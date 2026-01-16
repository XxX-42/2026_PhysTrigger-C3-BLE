/// FlutterBluePlus implementation of [IBleService].
///
/// This class provides the concrete BLE functionality using the `flutter_blue_plus`
/// library. It handles all platform differences (Windows, Android, iOS) transparently
/// and maps all library-specific types to our domain models.
///
/// ## Architecture Notes
/// - All FBP types are converted to domain models at the boundary
/// - Stream subscriptions are carefully managed to prevent memory leaks
/// - Exceptions are translated to our [BleException] hierarchy
///
/// ## Usage
/// ```dart
/// final bleService = FlutterBluePlusService();
/// await bleService.initialize();
///
/// bleService.scanResults.listen((device) {
///   print('Found: ${device.name}');
/// });
///
/// await bleService.scan();
/// ```
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus_windows/flutter_blue_plus_windows.dart' hide BleDevice;
import 'package:permission_handler/permission_handler.dart';

import '../exceptions/ble_exception.dart';
import '../interfaces/i_ble_service.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';

/// Concrete implementation of [IBleService] using flutter_blue_plus.
///
/// This implementation:
/// - Supports Android, iOS, macOS, Windows, and Linux
/// - Handles platform-specific permission requirements
/// - Converts all FBP types to domain models
/// - Provides comprehensive error handling
class FlutterBluePlusService implements IBleService {
  // ═══════════════════════════════════════════════════════════════════════════
  // Private State
  // ═══════════════════════════════════════════════════════════════════════════

  /// Currently connected FBP device (internal reference).
  BluetoothDevice? _fbpDevice;

  /// Discovered services cache (for characteristic lookup).
  List<BluetoothService>? _discoveredServices;

  /// Scan results stream controller.
  final StreamController<BleDevice> _scanResultsController =
      StreamController<BleDevice>.broadcast();

  /// Connection state stream controller.
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  /// Data received stream controller (for notifications).
  final StreamController<List<int>> _dataReceivedController =
      StreamController<List<int>>.broadcast();

  /// Current connection state cache.
  BleConnectionState _currentConnectionState = BleConnectionState.disconnected;

  /// Connected device info cache.
  BleDevice? _connectedDevice;

  /// Whether a scan is currently running.
  bool _isScanning = false;

  /// Active subscriptions for cleanup.
  StreamSubscription<List<ScanResult>>? _scanSubscription;
  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;
  final List<StreamSubscription<List<int>>> _notificationSubscriptions = [];

  /// Guard flag to prevent cleanup during active connection flow.
  /// This prevents the connection listener from nullifying _fbpDevice
  /// when transient 'disconnected' states occur during handshake.
  bool _isConnecting = false;

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Reactive Streams
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Stream<BleDevice> get scanResults => _scanResultsController.stream;

  @override
  Stream<BleConnectionState> get connectionState =>
      _connectionStateController.stream;

  @override
  Stream<List<int>> get dataReceived => _dataReceivedController.stream;

  @override
  BleConnectionState get currentConnectionState => _currentConnectionState;

  @override
  BleDevice? get connectedDevice => _connectedDevice;

  @override
  bool get isScanning => _isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> initialize() async {
    try {
      // Check if Bluetooth is supported on this device
      if (await FlutterBluePlus.isSupported == false) {
        throw const BleAdapterException(
          BleAdapterState.unavailable,
          'Bluetooth is not supported on this device',
        );
      }

      // Request platform-specific permissions
      await _requestPermissions();

      // Check adapter state
      // On Windows, we must explicitly wait for the adapter to be ready
      // unlike Android where we can try to turn it on.
      if (Platform.isWindows) {
        await FlutterBluePlus.adapterState
            .where((state) => state == BluetoothAdapterState.on)
            .first
            .timeout(
              const Duration(seconds: 3),
              onTimeout: () => throw const BleAdapterException(
                BleAdapterState.off,
                'Bluetooth adapter not ready. Please check if Bluetooth is enabled.',
              ),
            );
      } else {
        final adapterState = await FlutterBluePlus.adapterState.first;
        if (adapterState != BluetoothAdapterState.on) {
          // Attempt to turn on Bluetooth (Android only)
          if (Platform.isAndroid) {
            try {
              await FlutterBluePlus.turnOn();
              // Wait for adapter to be on (with timeout)
              await FlutterBluePlus.adapterState
                  .where((state) => state == BluetoothAdapterState.on)
                  .first
                  .timeout(const Duration(seconds: 10));
            } catch (e) {
              throw BleAdapterException(
                _mapAdapterState(adapterState),
                'Failed to enable Bluetooth. Please enable it manually.',
                e,
              );
            }
          } else {
            throw BleAdapterException(
              _mapAdapterState(adapterState),
              'Bluetooth is turned off. Please enable Bluetooth in Settings.',
            );
          }
        }
      }

      debugPrint('FlutterBluePlusService: Initialized successfully');
    } on BleException {
      rethrow;
    } catch (e) {
      throw BleAdapterException(
        BleAdapterState.unknown,
        'Failed to initialize BLE service',
        e,
      );
    }
  }

  @override
  Future<void> dispose() async {
    // Cancel all subscriptions
    await _scanSubscription?.cancel();
    await _connectionSubscription?.cancel();
    for (final sub in _notificationSubscriptions) {
      await sub.cancel();
    }
    _notificationSubscriptions.clear();

    // Disconnect if connected
    await disconnect();

    // Close stream controllers
    await _scanResultsController.close();
    await _connectionStateController.close();
    await _dataReceivedController.close();

    debugPrint('FlutterBluePlusService: Disposed');
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Scanning
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> scan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    try {
      // Verify adapter is on
      await _ensureAdapterOn();

      // Convert service UUIDs to FBP Guid format
      final List<Guid> withServices = filterByServiceUuids
              ?.map((uuid) => Guid(uuid))
              .toList() ??
          [];

      // Start scanning
      _isScanning = true;

      // Safety: Ensure any previous scan is stopped to prevent state conflicts
      // This fixes common "already scanning" errors on Windows/Android
      try {
        await FlutterBluePlus.stopScan();
      } catch (e) {
        // Ignore errors stopping scan
      }

      await FlutterBluePlus.startScan(
        withServices: withServices,
        timeout: timeout,
        androidUsesFineLocation: false,
      );

      // Listen to scan results and convert to domain model
      _scanSubscription = FlutterBluePlus.scanResults.listen(
        (results) {
          for (final result in results) {
            final device = _mapScanResultToDevice(result);
            _scanResultsController.add(device);
          }
        },
        onError: (error) {
          debugPrint('FlutterBluePlusService: Stream Error: $error');
          _scanResultsController.addError(
            BleScanException('Scan stream error', error),
          );
        },
      );

      // Auto-stop when scan completes
      FlutterBluePlus.isScanning.where((s) => !s).first.then((_) {
        _isScanning = false;
      });

      debugPrint('FlutterBluePlusService: Scan started');
    } on BleException {
      _isScanning = false;
      rethrow;
    } catch (e) {
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Raw Scan Error: $e');
      throw BleScanException('Failed to start scan: $e', e);
    }
  }

  @override
  Future<void> stopScan() async {
    try {
      await FlutterBluePlus.stopScan();
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Scan stopped');
    } catch (e) {
      _isScanning = false;
      debugPrint('FlutterBluePlusService: Error stopping scan: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Constants - UUIDs
  // ═══════════════════════════════════════════════════════════════════════════
  static const String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  static const String CHAR_UUID_CTRL = "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Connection
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    _isConnecting = true; // Guard against premature cleanup
    try {
      _updateConnectionState(BleConnectionState.connecting);

      // Get device reference from ID
      // Use BluetoothDeviceWindows.fromId which properly handles Windows platform
      // by delegating to WinBle, and falls back to standard FBP for Android.
      final device = BluetoothDeviceWindows.fromId(deviceId);
      _fbpDevice = device;
      
      debugPrint('FlutterBluePlusService: Connecting to device. Type: ${device.runtimeType}');

      // Setup connection state listener BEFORE connecting
      _connectionSubscription?.cancel();
      _connectionSubscription = device.connectionState.listen((state) {
        final mappedState = _mapConnectionState(state);
        _updateConnectionState(mappedState);

        // Only cleanup if truly disconnected AND not mid-connect
        // (transient disconnected states occur during handshake)
        if (state == BluetoothConnectionState.disconnected && !_isConnecting) {
          _cleanupConnection();
        }
      });

      // Attempt connection
      await device.connect(
        timeout: timeout,
        autoConnect: false,
      );

      // ───────────────────────────────────────────────────────────────────────
      // CRITICAL: Wait for GATT Layer to be Ready
      // ───────────────────────────────────────────────────────────────────────
      // device.connect() returning does NOT guarantee the GATT layer is ready
      // for discoverServices(), especially on Android. We must explicitly wait
      // for the connection state stream to emit 'connected'.
      debugPrint('FlutterBluePlusService: Waiting for GATT layer negotiation...');
      try {
        await device.connectionState
            .where((state) => state == BluetoothConnectionState.connected)
            .first
            .timeout(
              const Duration(seconds: 5),
              onTimeout: () => throw BleConnectionFailedException(
                deviceId,
                'Physical link negotiation timed out',
              ),
            );
        debugPrint('FlutterBluePlusService: GATT layer ready.');
      } on BleConnectionFailedException {
        rethrow;
      } catch (e) {
        throw BleConnectionFailedException(
          deviceId,
          'Physical link negotiation timed out',
          e,
        );
      }

      // Re-assign device reference after successful GATT negotiation
      // to ensure it wasn't cleared by any transient state changes
      _fbpDevice = device;

      // ───────────────────────────────────────────────────────────────────────
      // Android Specific: Request High MTU
      // ───────────────────────────────────────────────────────────────────────
      if (Platform.isAndroid) {
        try {
          await device.requestMtu(512);
        } catch (e) {
          debugPrint('Failed to request MTU: $e');
          // Non-fatal, continue
        }
      }

      // ───────────────────────────────────────────────────────────────────────
      // Safe Discovery & Validation
      // ───────────────────────────────────────────────────────────────────────
      _discoveredServices = await device.discoverServices();

      // Validate Service Exists
      final service = _discoveredServices?.firstWhere(
        (s) => s.uuid.str.toLowerCase() == SERVICE_UUID.toLowerCase(),
        orElse: () => throw BleServiceDiscoveryException(
          'Target Service NOT found: $SERVICE_UUID',
        ),
      );

      // Validate Characteristic Exists
      // We check for CTRL characteristic as a minimum requirement
      final char = service?.characteristics.firstWhere(
        (c) => c.uuid.str.toLowerCase() == CHAR_UUID_CTRL.toLowerCase(),
        orElse: () => throw BleCharacteristicNotFoundException(
          serviceUuid: SERVICE_UUID,
          characteristicUuid: CHAR_UUID_CTRL,
          message: 'Target Characteristic NOT found: $CHAR_UUID_CTRL',
        ),
      );

      if (service == null || char == null) {
         // Should be caught by orElse, but double check
         throw BleConnectionFailedException(deviceId, 'Service or Characteristic validation failed');
      }

      // Cache connected device info
      _connectedDevice = BleDevice(
        id: deviceId,
        name: device.platformName.isNotEmpty
            ? device.platformName
            : 'Unknown Device',
        rssi: 0,
      );

      debugPrint('FlutterBluePlusService: Connected & Validated $deviceId');
    } on TimeoutException {
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionTimeoutException(deviceId, timeout);
    } on BleException {
      // Disconnect to clean up if validation failed
      await _fbpDevice?.disconnect(); 
      _updateConnectionState(BleConnectionState.disconnected);
      rethrow;
    } catch (e) {
      // Disconnect to clean up
      await _fbpDevice?.disconnect();
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionFailedException(
        deviceId,
        'Failed to connect: ${e.toString()}',
        e,
      );
    } finally {
      _isConnecting = false; // Always clear guard flag
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      _updateConnectionState(BleConnectionState.disconnecting);

      await _connectionSubscription?.cancel();
      _connectionSubscription = null;

      if (_fbpDevice != null) {
        await _fbpDevice!.disconnect();
      }

      _cleanupConnection();
      _updateConnectionState(BleConnectionState.disconnected);

      debugPrint('FlutterBluePlusService: Disconnected');
    } catch (e) {
      _cleanupConnection();
      _updateConnectionState(BleConnectionState.disconnected);
      debugPrint('FlutterBluePlusService: Disconnect error: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<List<BleServiceInfo>> discoverServices() async {
    if (_fbpDevice == null) {
      throw const BleNotConnectedException();
    }

    try {
      _discoveredServices = await _fbpDevice!.discoverServices();

      final services = _discoveredServices!.map((fbpService) {
        final characteristics = fbpService.characteristics.map((fbpChar) {
          return BleCharacteristicInfo(
            uuid: fbpChar.uuid.str.toUpperCase(),
            canRead: fbpChar.properties.read,
            canWrite: fbpChar.properties.write,
            canWriteWithoutResponse: fbpChar.properties.writeWithoutResponse,
            canNotify: fbpChar.properties.notify,
            canIndicate: fbpChar.properties.indicate,
          );
        }).toList();

        return BleServiceInfo(
          uuid: fbpService.uuid.str.toUpperCase(),
          characteristics: characteristics,
        );
      }).toList();

      debugPrint(
          'FlutterBluePlusService: Discovered ${services.length} services');
      return services;
    } catch (e) {
      throw BleServiceDiscoveryException('Failed to discover services', e);
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // IBleService - Data Operations
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  Future<void> writeBytes({
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> data,
    bool withResponse = false,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      // Determine write mode based on characteristic properties and request
      final useWithoutResponse =
          characteristic.properties.writeWithoutResponse && !withResponse;

      await characteristic.write(
        data,
        withoutResponse: useWithoutResponse,
      );

      debugPrint(
        'FlutterBluePlusService: Wrote ${data.length} bytes '
        '(withoutResponse: $useWithoutResponse)',
      );
    } catch (e) {
      throw BleWriteException(serviceUuid, characteristicUuid,
          'Write operation failed: ${e.toString()}', e);
    }
  }

  @override
  Future<List<int>> readBytes({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      final value = await characteristic.read();
      debugPrint('FlutterBluePlusService: Read ${value.length} bytes');
      return value;
    } catch (e) {
      throw BleReadException(serviceUuid, characteristicUuid,
          'Read operation failed: ${e.toString()}', e);
    }
  }

  @override
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      await characteristic.setNotifyValue(true);

      final subscription = characteristic.onValueReceived.listen((value) {
        _dataReceivedController.add(value);
      });
      _notificationSubscriptions.add(subscription);

      debugPrint(
        'FlutterBluePlusService: Subscribed to notifications on $characteristicUuid',
      );
    } catch (e) {
      throw BleCharacteristicNotFoundException(
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
        message: 'Failed to subscribe to notifications: ${e.toString()}',
        cause: e,
      );
    }
  }

  @override
  Future<void> unsubscribeFromNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final characteristic = await _findCharacteristic(
      serviceUuid,
      characteristicUuid,
    );

    try {
      await characteristic.setNotifyValue(false);
      debugPrint(
        'FlutterBluePlusService: Unsubscribed from notifications on $characteristicUuid',
      );
    } catch (e) {
      debugPrint('FlutterBluePlusService: Error unsubscribing: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Private Helper Methods
  // ═══════════════════════════════════════════════════════════════════════════

  /// Request platform-specific permissions.
  Future<void> _requestPermissions() async {
    if (!Platform.isAndroid) return;

    // Android 12+ (API 31+) requires new Bluetooth permissions
    if (await _isAndroid12OrHigher()) {
      final scanStatus = await Permission.bluetoothScan.request();
      final connectStatus = await Permission.bluetoothConnect.request();

      if (scanStatus.isDenied) {
        throw const BlePermissionDeniedException(BlePermissionType.bluetoothScan);
      }
      if (connectStatus.isDenied) {
        throw const BlePermissionDeniedException(
            BlePermissionType.bluetoothConnect);
      }
    } else {
      // Android 10-11 requires location permission for scanning
      final locationStatus = await Permission.locationWhenInUse.request();
      if (locationStatus.isDenied) {
        throw const BlePermissionDeniedException(BlePermissionType.location);
      }
    }
  }

  /// Check if running Android 12 (API 31) or higher.
  Future<bool> _isAndroid12OrHigher() async {
    // If bluetoothScan permission exists and isn't permanently denied due to
    // API level, we're on Android 12+
    final status = await Permission.bluetoothScan.status;
    return status != PermissionStatus.permanentlyDenied;
  }

  /// Ensure Bluetooth adapter is on before operations.
  Future<void> _ensureAdapterOn() async {
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      throw BleAdapterException(
        _mapAdapterState(adapterState),
        'Bluetooth is not enabled',
      );
    }
  }

  /// Map FBP ScanResult to our BleDevice domain model.
  BleDevice _mapScanResultToDevice(ScanResult result) {
    // Extract service UUIDs from advertisement data
    final serviceUuids = result.advertisementData.serviceUuids
        .map((guid) => guid.str.toUpperCase())
        .toList();

    // Extract manufacturer data
    final manufacturerData = <int, List<int>>{};
    result.advertisementData.manufacturerData.forEach((key, value) {
      manufacturerData[key] = value;
    });

    return BleDevice(
      // RemoteId works consistently across platforms when converted to string
      id: result.device.remoteId.str,
      name: result.device.platformName.isNotEmpty
          ? result.device.platformName
          : result.advertisementData.advName,
      rssi: result.rssi,
      serviceUuids: serviceUuids,
      manufacturerData: manufacturerData,
    );
  }

  /// Map FBP BluetoothConnectionState to our BleConnectionState.
  BleConnectionState _mapConnectionState(BluetoothConnectionState fbpState) {
    switch (fbpState) {
      case BluetoothConnectionState.disconnected:
        return BleConnectionState.disconnected;
      case BluetoothConnectionState.connected:
        return BleConnectionState.connected;
      default:
        // FBP doesn't have connecting/disconnecting states in the enum,
        // but they are implied during operations
        return BleConnectionState.disconnected;
    }
  }

  /// Map FBP BluetoothAdapterState to our BleAdapterState.
  BleAdapterState _mapAdapterState(BluetoothAdapterState fbpState) {
    switch (fbpState) {
      case BluetoothAdapterState.unknown:
        return BleAdapterState.unknown;
      case BluetoothAdapterState.unavailable:
        return BleAdapterState.unavailable;
      case BluetoothAdapterState.unauthorized:
        return BleAdapterState.unavailable;
      case BluetoothAdapterState.turningOn:
        return BleAdapterState.turningOn;
      case BluetoothAdapterState.on:
        return BleAdapterState.on;
      case BluetoothAdapterState.turningOff:
        return BleAdapterState.turningOff;
      case BluetoothAdapterState.off:
        return BleAdapterState.off;
    }
  }

  /// Update connection state and notify listeners.
  void _updateConnectionState(BleConnectionState state) {
    if (_currentConnectionState != state) {
      _currentConnectionState = state;
      _connectionStateController.add(state);
      debugPrint('FlutterBluePlusService: Connection state -> ${state.label}');
    }
  }

  /// Cleanup connection-related state.
  void _cleanupConnection() {
    _fbpDevice = null;
    _discoveredServices = null;
    _connectedDevice = null;

    // Cancel notification subscriptions
    for (final sub in _notificationSubscriptions) {
      sub.cancel();
    }
    _notificationSubscriptions.clear();
  }

  /// Find a characteristic by service and characteristic UUID.
  ///
  /// Throws [BleNotConnectedException] if not connected.
  /// Throws [BleCharacteristicNotFoundException] if not found.
  Future<BluetoothCharacteristic> _findCharacteristic(
    String serviceUuid,
    String characteristicUuid,
  ) async {
    if (_fbpDevice == null) {
      throw const BleNotConnectedException();
    }

    // Discover services if not already done
    if (_discoveredServices == null) {
      await discoverServices();
    }

    final normalizedServiceUuid = serviceUuid.toUpperCase();
    final normalizedCharUuid = characteristicUuid.toUpperCase();

    // Find the service
    BluetoothService? targetService;
    for (final service in _discoveredServices!) {
      if (service.uuid.str.toUpperCase() == normalizedServiceUuid) {
        targetService = service;
        break;
      }
    }

    if (targetService == null) {
      throw BleCharacteristicNotFoundException(
        serviceUuid: serviceUuid,
        message: 'Service not found: $serviceUuid',
      );
    }

    // Find the characteristic
    for (final char in targetService.characteristics) {
      if (char.uuid.str.toUpperCase() == normalizedCharUuid) {
        return char;
      }
    }

    throw BleCharacteristicNotFoundException(
      serviceUuid: serviceUuid,
      characteristicUuid: characteristicUuid,
      message: 'Characteristic not found: $characteristicUuid',
    );
  }
}
