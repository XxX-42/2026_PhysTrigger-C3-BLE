/// Concrete BLE Service Implementation using flutter_blue_plus
///
/// This class implements the [BleService] interface with real BLE
/// hardware communication using the flutter_blue_plus library.
///
/// Key Features:
/// - UUID-filtered scanning (only shows devices with Service FFE0)
/// - Automatic service/characteristic discovery on connect
/// - Cached characteristic reference for low-latency writes
/// - Connection state stream for UI updates
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ble_service.dart';
import '../utils/byte_utils.dart';

/// Implementation of [BleService] using flutter_blue_plus
class BleServiceImpl implements BleService {
  // ============================================================
  // Private State
  // ============================================================

  /// Currently connected device (flutter_blue_plus native type)
  BluetoothDevice? _device;

  /// Cached target characteristic for fast writes
  /// This is the FFE1 characteristic under FFE0 service
  BluetoothCharacteristic? _targetCharacteristic;

  /// Scan subscription
  StreamSubscription<List<ScanResult>>? _scanSubscription;

  /// Connection state subscription
  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;

  /// Internal connection state controller
  final StreamController<BleConnectionState> _connectionStateController =
      StreamController<BleConnectionState>.broadcast();

  /// Current connection state cache
  BleConnectionState _currentConnectionState = BleConnectionState.disconnected;

  /// Connected device info cache
  BleDevice? _connectedDevice;

  // ============================================================
  // BleService Interface - Properties
  // ============================================================

  @override
  Stream<BleConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  @override
  BleConnectionState get connectionState => _currentConnectionState;

  @override
  BleDevice? get connectedDevice => _connectedDevice;

  // ============================================================
  // BleService Interface - Lifecycle
  // ============================================================

  @override
  Future<void> initialize() async {
    // Check if Bluetooth is supported
    if (await FlutterBluePlus.isSupported == false) {
      throw BleConnectionException('Bluetooth is not supported on this device');
    }

    // Request permissions based on platform and OS version
    await _requestPermissions();

    // Check if Bluetooth is on
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      // Attempt to turn on Bluetooth (Android only)
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
        // Wait for adapter to be on
        await FlutterBluePlus.adapterState
            .where((state) => state == BluetoothAdapterState.on)
            .first
            .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw BleConnectionException(
              'Bluetooth is turned off. Please enable Bluetooth.',
            );
          },
        );
      } else {
        throw BleConnectionException(
          'Bluetooth is turned off. Please enable Bluetooth in Settings.',
        );
      }
    }

    debugPrint('BleServiceImpl: Initialized successfully');
  }

  /// Request Android runtime permissions based on OS version
  Future<void> _requestPermissions() async {
    if (!Platform.isAndroid) return;

    // Android 12+ (API 31+)
    if (await _isAndroid12OrHigher()) {
      final scanStatus = await Permission.bluetoothScan.request();
      final connectStatus = await Permission.bluetoothConnect.request();

      if (scanStatus.isDenied || connectStatus.isDenied) {
        throw BleConnectionException(
          'Bluetooth permissions are required. '
          'Please grant permissions in Settings.',
        );
      }
    } else {
      // Android 10-11
      final locationStatus = await Permission.locationWhenInUse.request();
      if (locationStatus.isDenied) {
        throw BleConnectionException(
          'Location permission is required for Bluetooth scanning on this device.',
        );
      }
    }
  }

  /// Check if running Android 12 (API 31) or higher
  Future<bool> _isAndroid12OrHigher() async {
    // permission_handler doesn't expose SDK version directly
    // We check by trying to query Android 12+ specific permission
    final status = await Permission.bluetoothScan.status;
    // If this permission exists (not permanently denied due to API level),
    // we're on Android 12+
    return status != PermissionStatus.permanentlyDenied;
  }

  @override
  Future<void> dispose() async {
    await _scanSubscription?.cancel();
    await _connectionSubscription?.cancel();
    await disconnect();
    await _connectionStateController.close();
  }

  // ============================================================
  // BleService Interface - Scanning
  // ============================================================

  @override
  Stream<BleDevice> scan({
    List<String>? serviceUuids,
    Duration timeout = const Duration(seconds: 10),
  }) {
    final controller = StreamController<BleDevice>();

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Platform-specific scan configuration
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    
    // Build UUID filter list
    // Using withServices filter greatly improves UX by only showing
    // devices that advertise the target service UUID
    final List<Guid> filterUuids = [];
    
    // On desktop (Windows/macOS/Linux), UUID filtering may not work
    // reliably with all adapters, so we filter manually in results
    final bool isDesktop = Platform.isWindows || Platform.isMacOS || Platform.isLinux;
    
    if (!isDesktop) {
      // Mobile: Use hardware UUID filtering for better performance
      if (serviceUuids != null) {
        for (final uuid in serviceUuids) {
          filterUuids.add(Guid(uuid));
        }
      } else {
        // Default: Filter for our target service (FFE0)
        filterUuids.add(Guid(BleUuids.serviceUuid));
      }
    }

    // Start scanning with platform-appropriate configuration
    FlutterBluePlus.startScan(
      withServices: isDesktop ? [] : filterUuids, // Desktop: scan all, filter manually
      timeout: timeout,
      androidUsesFineLocation: false, // We use neverForLocation flag
    );

    // Target UUID for manual filtering on desktop
    final targetUuidUpper = BleUuids.serviceUuid.toUpperCase();
    final targetUuidShort = 'FFE0';

    // Listen to scan results
    _scanSubscription = FlutterBluePlus.scanResults.listen(
      (results) {
        for (final result in results) {
          // On desktop, manually filter by service UUID
          if (isDesktop && serviceUuids == null) {
            bool hasTargetService = false;
            for (final serviceUuid in result.advertisementData.serviceUuids) {
              final uuidStr = serviceUuid.str.toUpperCase();
              if (uuidStr.contains(targetUuidShort) || uuidStr == targetUuidUpper) {
                hasTargetService = true;
                break;
              }
            }
            if (!hasTargetService) continue; // Skip devices without our service
          }
          
          final device = BleDevice(
            id: result.device.remoteId.str,
            name: result.device.platformName.isNotEmpty
                ? result.device.platformName
                : 'Unknown Device',
            rssi: result.rssi,
          );
          controller.add(device);
        }
      },
      onError: (error) {
        controller.addError(BleConnectionException('Scan failed', error));
      },
    );

    // Handle scan completion
    FlutterBluePlus.isScanning.where((scanning) => !scanning).first.then((_) {
      controller.close();
    });

    return controller.stream;
  }

  @override
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
    await _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  // ============================================================
  // BleService Interface - Connection
  // ============================================================

  @override
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    try {
      _updateConnectionState(BleConnectionState.connecting);

      // Get device reference
      _device = BluetoothDevice.fromId(deviceId);

      // Setup connection state listener BEFORE connecting
      _connectionSubscription = _device!.connectionState.listen((state) {
        switch (state) {
          case BluetoothConnectionState.connected:
            _updateConnectionState(BleConnectionState.connected);
          case BluetoothConnectionState.disconnected:
            _updateConnectionState(BleConnectionState.disconnected);
            _targetCharacteristic = null;
            _connectedDevice = null;
          default:
            break;
        }
      });

      // Attempt connection
      await _device!.connect(
        timeout: timeout,
        autoConnect: false, // Explicit connect, no auto-reconnect
      );

      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // CRITICAL: Discover services immediately after connect
      // This finds our FFE0 service and FFE1 characteristic
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      await _discoverAndCacheCharacteristic();

      // Cache connected device info
      _connectedDevice = BleDevice(
        id: deviceId,
        name: _device!.platformName.isNotEmpty
            ? _device!.platformName
            : 'Unknown Device',
        rssi: 0,
      );

      debugPrint('BleServiceImpl: Connected to $deviceId');
    } catch (e) {
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionException('Failed to connect to device', e);
    }
  }

  /// Discover services and cache the target characteristic
  ///
  /// This is called immediately after connection to:
  /// 1. Find Service FFE0
  /// 2. Find Characteristic FFE1 within that service
  /// 3. Cache it in [_targetCharacteristic] for fast writes
  Future<void> _discoverAndCacheCharacteristic() async {
    if (_device == null) {
      throw BleConnectionException('No device connected');
    }

    // Discover all services
    final services = await _device!.discoverServices();
    debugPrint('BleServiceImpl: Discovered ${services.length} services');

    // Find our target service (FFE0)
    BluetoothService? targetService;
    for (final service in services) {
      // Compare with both short and full UUID formats
      final uuidStr = service.uuid.str.toUpperCase();
      if (uuidStr.contains('FFE0') ||
          uuidStr == BleUuids.serviceUuid.toUpperCase()) {
        targetService = service;
        debugPrint('BleServiceImpl: Found target service: $uuidStr');
        break;
      }
    }

    if (targetService == null) {
      throw BleConnectionException(
        'Target service (FFE0) not found on this device. '
        'Please ensure you are connecting to the correct hardware.',
      );
    }

    // Find our target characteristic (FFE1) within the service
    for (final characteristic in targetService.characteristics) {
      final uuidStr = characteristic.uuid.str.toUpperCase();
      if (uuidStr.contains('FFE1') ||
          uuidStr == BleUuids.characteristicUuid.toUpperCase()) {
        _targetCharacteristic = characteristic;
        debugPrint('BleServiceImpl: Found target characteristic: $uuidStr');
        debugPrint(
            '  Properties: read=${characteristic.properties.read}, '
            'write=${characteristic.properties.write}, '
            'writeNoResponse=${characteristic.properties.writeWithoutResponse}, '
            'notify=${characteristic.properties.notify}');
        break;
      }
    }

    if (_targetCharacteristic == null) {
      throw BleConnectionException(
        'Target characteristic (FFE1) not found within service FFE0.',
      );
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      _updateConnectionState(BleConnectionState.disconnecting);
      await _connectionSubscription?.cancel();
      _connectionSubscription = null;

      if (_device != null) {
        await _device!.disconnect();
      }

      _device = null;
      _targetCharacteristic = null;
      _connectedDevice = null;
      _updateConnectionState(BleConnectionState.disconnected);

      debugPrint('BleServiceImpl: Disconnected');
    } catch (e) {
      _updateConnectionState(BleConnectionState.disconnected);
      debugPrint('BleServiceImpl: Disconnect error: $e');
    }
  }

  /// Update connection state and notify listeners
  void _updateConnectionState(BleConnectionState state) {
    _currentConnectionState = state;
    _connectionStateController.add(state);
  }

  // ============================================================
  // BleService Interface - Data Transmission
  // ============================================================

  @override
  Future<void> writeBytes(
    String serviceUuid,
    String characteristicUuid,
    List<int> data, {
    bool withResponse = false,
  }) async {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Use cached characteristic for minimal latency
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_targetCharacteristic == null) {
      throw BleWriteException(
        'Not connected or characteristic not discovered. '
        'Call connect() first.',
      );
    }

    try {
      // Validate data range (0-255 per byte)
      validateBytes(data);

      // Determine write type based on characteristic properties
      // Prefer writeWithoutResponse for lower latency (important for control apps)
      final bool useWithoutResponse =
          _targetCharacteristic!.properties.writeWithoutResponse &&
              !withResponse;

      await _targetCharacteristic!.write(
        data,
        withoutResponse: useWithoutResponse,
      );

      debugPrint(
        'BleServiceImpl: Wrote ${bytesToHexString(data)} '
        '(withoutResponse: $useWithoutResponse)',
      );
    } catch (e) {
      throw BleWriteException('Failed to write data', e);
    }
  }

  @override
  Future<List<int>> readBytes(
    String serviceUuid,
    String characteristicUuid,
  ) async {
    if (_targetCharacteristic == null) {
      throw BleWriteException('Not connected or characteristic not discovered');
    }

    try {
      final value = await _targetCharacteristic!.read();
      debugPrint('BleServiceImpl: Read ${bytesToHexString(value)}');
      return value;
    } catch (e) {
      throw BleWriteException('Failed to read data', e);
    }
  }

  @override
  Stream<List<int>> subscribeToNotifications(
    String serviceUuid,
    String characteristicUuid,
  ) {
    if (_targetCharacteristic == null) {
      throw BleWriteException('Not connected or characteristic not discovered');
    }

    // Enable notifications on the characteristic
    _targetCharacteristic!.setNotifyValue(true);

    // Return the notification stream
    return _targetCharacteristic!.onValueReceived;
  }
}
