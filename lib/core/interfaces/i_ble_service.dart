/// Pure abstract interface for BLE communication layer.
///
/// All return types are Domain Models, never exposing third-party library types.
/// This ensures the UI layer remains completely decoupled from implementation details.
///
/// Implementations must handle platform-specific permissions:
/// - Android 10-11: ACCESS_FINE_LOCATION
/// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT
/// - iOS: Bluetooth usage description in Info.plist
/// - Windows: No special permissions required
library;

import 'dart:async';

import '../exceptions/ble_exception.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';

/// Abstract interface for BLE service operations.
///
/// Follows Interface Segregation Principle - clients depend only on
/// the methods they use.
abstract class IBleService {
  // ═══════════════════════════════════════════════════════════════════════════
  // Reactive Streams (Observable State)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Stream of discovered devices during scanning.
  ///
  /// Emits [BleDevice] objects as they are discovered.
  /// The stream continues until [stopScan] is called or timeout expires.
  Stream<BleDevice> get scanResults;

  /// Stream of connection state changes.
  ///
  /// Emits [BleConnectionState] whenever the connection state changes.
  /// UI should react to this stream to update connection indicators.
  Stream<BleConnectionState> get connectionState;

  /// Stream of raw data received from characteristic notifications.
  ///
  /// Emits byte arrays when subscribed characteristics send data.
  /// Must call [subscribeToNotifications] first to receive data.
  Stream<List<int>> get dataReceived;

  /// Current connection state (synchronous access).
  BleConnectionState get currentConnectionState;

  /// Currently connected device, or null if not connected.
  BleDevice? get connectedDevice;

  // ═══════════════════════════════════════════════════════════════════════════
  // Scanning Operations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Start scanning for BLE devices.
  ///
  /// [filterByServiceUuids] - Optional UUIDs to filter devices.
  ///   Only devices advertising these services will be reported.
  /// [timeout] - Auto-stop scanning after this duration (default: 10s).
  ///
  /// Results are emitted via [scanResults] stream.
  ///
  /// Throws:
  /// - [BlePermissionDeniedException] if permissions are not granted
  /// - [BleAdapterException] if Bluetooth is off
  /// - [BleScanException] for other scan failures
  Future<void> scan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 10),
  });

  /// Stop ongoing scan.
  ///
  /// Safe to call even if no scan is in progress.
  Future<void> stopScan();

  /// Whether a scan is currently running.
  bool get isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // Connection Management
  // ═══════════════════════════════════════════════════════════════════════════

  /// Connect to a device by its unique identifier.
  ///
  /// [deviceId] - Platform-specific ID (MAC on Android, UUID on iOS/Windows).
  /// [timeout] - Connection timeout (default: 15s).
  ///
  /// After successful connection, [connectionState] stream emits [BleConnectionState.connected].
  ///
  /// Throws:
  /// - [BleConnectionTimeoutException] if connection times out
  /// - [BleConnectionFailedException] for other connection failures
  /// - [BleAdapterException] if Bluetooth is off
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  });

  /// Disconnect from currently connected device.
  ///
  /// Safe to call even if not connected.
  /// After disconnection, [connectionState] stream emits [BleConnectionState.disconnected].
  Future<void> disconnect();

  // ═══════════════════════════════════════════════════════════════════════════
  // Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  /// Discover all services and characteristics on connected device.
  ///
  /// Must be called after successful [connect].
  /// Returns a list of [BleServiceInfo] containing service and characteristic metadata.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleServiceDiscoveryException] if discovery fails
  Future<List<BleServiceInfo>> discoverServices();

  // ═══════════════════════════════════════════════════════════════════════════
  // Data Operations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Write bytes to a characteristic.
  ///
  /// [serviceUuid] - Target service UUID.
  /// [characteristicUuid] - Target characteristic UUID.
  /// [data] - Bytes to write (0-255 range per element).
  /// [withResponse] - If true, wait for write confirmation (slower but reliable).
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  /// - [BleWriteException] if write fails
  Future<void> writeBytes({
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> data,
    bool withResponse = false,
  });

  /// Read bytes from a characteristic.
  ///
  /// Returns the current value of the characteristic.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  /// - [BleReadException] if read fails
  Future<List<int>> readBytes({
    required String serviceUuid,
    required String characteristicUuid,
  });

  /// Subscribe to notifications on a characteristic.
  ///
  /// After subscription, data will be emitted via [dataReceived] stream.
  ///
  /// Throws:
  /// - [BleNotConnectedException] if no device is connected
  /// - [BleCharacteristicNotFoundException] if characteristic doesn't exist
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  });

  /// Unsubscribe from notifications on a characteristic.
  Future<void> unsubscribeFromNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  });

  // ═══════════════════════════════════════════════════════════════════════════
  // Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  /// Initialize the BLE service.
  ///
  /// Should be called once at app startup.
  /// Requests necessary permissions based on platform.
  ///
  /// Throws:
  /// - [BlePermissionDeniedException] if required permissions are denied
  /// - [BleAdapterException] if Bluetooth is unavailable
  Future<void> initialize();

  /// Release all resources.
  ///
  /// Disconnects from any connected device and cleans up streams.
  /// Should be called when the service is no longer needed.
  Future<void> dispose();
}
