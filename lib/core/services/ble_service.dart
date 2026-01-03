/// BLE Service Interface for PhysTrigger
/// 
/// This abstract class defines the contract for BLE operations.
/// Concrete implementations will use platform-specific BLE packages
/// (e.g., flutter_blue_plus, flutter_reactive_ble).
library;

import 'dart:async';

/// Represents a discovered BLE device
class BleDevice {
  final String id;          // Device MAC address or UUID
  final String name;        // Device advertised name
  final int rssi;           // Signal strength
  
  const BleDevice({
    required this.id,
    required this.name,
    required this.rssi,
  });
  
  @override
  String toString() => 'BleDevice($name, $id, RSSI: $rssi)';
}

/// Connection state enum for BLE device
enum BleConnectionState {
  disconnected,
  connecting,
  connected,
  disconnecting,
}

/// Abstract BLE Service interface
/// 
/// Implementations should handle:
/// - Android 10-11: ACCESS_FINE_LOCATION permission
/// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT permissions
abstract class BleService {
  
  // ============================================================
  // Properties
  // ============================================================
  
  /// Stream of connection state changes
  Stream<BleConnectionState> get connectionStateStream;
  
  /// Current connection state
  BleConnectionState get connectionState;
  
  /// Currently connected device (null if not connected)
  BleDevice? get connectedDevice;
  
  // ============================================================
  // Scanning
  // ============================================================
  
  /// Start scanning for BLE devices
  /// 
  /// [serviceUuids] - Optional list of service UUIDs to filter by
  /// [timeout] - Scan duration (default: 10 seconds)
  /// 
  /// Returns a stream of discovered devices
  Stream<BleDevice> scan({
    List<String>? serviceUuids,
    Duration timeout = const Duration(seconds: 10),
  });
  
  /// Stop ongoing BLE scan
  Future<void> stopScan();
  
  // ============================================================
  // Connection
  // ============================================================
  
  /// Connect to a BLE device by its ID
  /// 
  /// [deviceId] - The device's unique identifier (MAC/UUID)
  /// [timeout] - Connection timeout (default: 15 seconds)
  /// 
  /// Throws [BleConnectionException] on failure
  Future<void> connect(
    String deviceId, {
    Duration timeout = const Duration(seconds: 15),
  });
  
  /// Disconnect from the currently connected device
  Future<void> disconnect();
  
  // ============================================================
  // Data Transmission
  // ============================================================
  
  /// Write raw bytes to a BLE characteristic
  /// 
  /// [serviceUuid] - The target service UUID (e.g., "FFE0")
  /// [characteristicUuid] - The target characteristic UUID (e.g., "FFE1")
  /// [data] - List of bytes to send (0-255 range)
  /// [withResponse] - Whether to wait for write confirmation
  /// 
  /// Example:
  /// ```dart
  /// // Send "forward" command (0x01)
  /// await writeBytes("FFE0", "FFE1", [0x01]);
  /// 
  /// // Send "stop" command (0x00)
  /// await writeBytes("FFE0", "FFE1", [0x00]);
  /// ```
  Future<void> writeBytes(
    String serviceUuid,
    String characteristicUuid,
    List<int> data, {
    bool withResponse = false,
  });
  
  /// Read bytes from a BLE characteristic
  /// 
  /// Returns the characteristic's current value as a byte list
  Future<List<int>> readBytes(
    String serviceUuid,
    String characteristicUuid,
  );
  
  /// Subscribe to notifications from a characteristic
  /// 
  /// Returns a stream of byte arrays when the characteristic value changes
  Stream<List<int>> subscribeToNotifications(
    String serviceUuid,
    String characteristicUuid,
  );
  
  // ============================================================
  // Lifecycle
  // ============================================================
  
  /// Initialize the BLE service
  /// 
  /// Should request necessary permissions based on Android version:
  /// - Android 10-11: ACCESS_FINE_LOCATION
  /// - Android 12+: BLUETOOTH_SCAN, BLUETOOTH_CONNECT
  Future<void> initialize();
  
  /// Dispose of resources
  Future<void> dispose();
}

/// Exception thrown when BLE connection fails
class BleConnectionException implements Exception {
  final String message;
  final dynamic originalError;
  
  const BleConnectionException(this.message, [this.originalError]);
  
  @override
  String toString() => 'BleConnectionException: $message';
}

/// Exception thrown when BLE write operation fails
class BleWriteException implements Exception {
  final String message;
  final dynamic originalError;
  
  const BleWriteException(this.message, [this.originalError]);
  
  @override
  String toString() => 'BleWriteException: $message';
}
