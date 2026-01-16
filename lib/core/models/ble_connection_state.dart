/// Connection state enumeration for BLE devices.
///
/// Represents the lifecycle of a BLE connection:
/// disconnected → connecting → connected → disconnecting → disconnected
library;

/// Connection state for BLE device.
enum BleConnectionState {
  /// No active connection.
  disconnected,

  /// Connection attempt in progress.
  connecting,

  /// Successfully connected and ready for operations.
  connected,

  /// Disconnection in progress.
  disconnecting,
}

/// Extension methods for [BleConnectionState].
extension BleConnectionStateX on BleConnectionState {
  /// Whether data operations (read/write) are currently possible.
  bool get isOperational => this == BleConnectionState.connected;

  /// Whether a state transition is in progress.
  bool get isTransitioning =>
      this == BleConnectionState.connecting ||
      this == BleConnectionState.disconnecting;

  /// Whether the device is not connected (disconnected or disconnecting).
  bool get isDisconnected =>
      this == BleConnectionState.disconnected ||
      this == BleConnectionState.disconnecting;

  /// Human-readable label for UI display.
  String get label {
    switch (this) {
      case BleConnectionState.disconnected:
        return 'Disconnected';
      case BleConnectionState.connecting:
        return 'Connecting...';
      case BleConnectionState.connected:
        return 'Connected';
      case BleConnectionState.disconnecting:
        return 'Disconnecting...';
    }
  }

  /// Icon code point for Material Icons.
  int get iconCodePoint {
    switch (this) {
      case BleConnectionState.disconnected:
        return 0xe1b2; // bluetooth_disabled
      case BleConnectionState.connecting:
        return 0xe1a7; // bluetooth_searching
      case BleConnectionState.connected:
        return 0xe1a8; // bluetooth_connected
      case BleConnectionState.disconnecting:
        return 0xe1a7; // bluetooth_searching
    }
  }
}
