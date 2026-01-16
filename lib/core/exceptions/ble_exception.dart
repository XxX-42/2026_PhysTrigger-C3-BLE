/// Comprehensive exception hierarchy for BLE operations.
///
/// Uses Dart 3 sealed classes for exhaustive pattern matching support.
/// Each exception type carries contextual information for debugging.
library;

/// Base exception for all BLE-related errors.
///
/// This is a sealed class enabling exhaustive switch statements:
/// ```dart
/// switch (exception) {
///   case BlePermissionDeniedException():
///     // Handle permission denial
///   case BleAdapterException():
///     // Handle adapter issues
///   // ... all cases must be handled
/// }
/// ```
sealed class BleException implements Exception {
  /// Human-readable error message.
  final String message;

  /// Original error from the underlying library (for debugging).
  final Object? cause;

  const BleException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return '$runtimeType: $message\nCaused by: $cause';
    }
    return '$runtimeType: $message';
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Permission Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when required permissions are not granted.
final class BlePermissionDeniedException extends BleException {
  /// Which permission was denied.
  final BlePermissionType permissionType;

  const BlePermissionDeniedException(
    this.permissionType, [
    String message = 'Required permission was denied',
    Object? cause,
  ]) : super(message, cause);
}

/// Types of permissions required for BLE operations.
enum BlePermissionType {
  /// General Bluetooth permission.
  bluetooth,

  /// Location permission (required on Android 11 and below for scanning).
  location,

  /// Bluetooth scan permission (Android 12+).
  bluetoothScan,

  /// Bluetooth connect permission (Android 12+).
  bluetoothConnect,
}

// ═══════════════════════════════════════════════════════════════════════════
// Adapter State Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when Bluetooth adapter is not available or turned off.
final class BleAdapterException extends BleException {
  /// Current state of the adapter.
  final BleAdapterState adapterState;

  const BleAdapterException(
    this.adapterState, [
    String message = 'Bluetooth adapter is not ready',
    Object? cause,
  ]) : super(message, cause);
}

/// States of the Bluetooth adapter.
enum BleAdapterState {
  /// Adapter state is unknown.
  unknown,

  /// Adapter is not available on this device.
  unavailable,

  /// Bluetooth is turned off.
  off,

  /// Bluetooth is turning on.
  turningOn,

  /// Bluetooth is on and ready.
  on,

  /// Bluetooth is turning off.
  turningOff,
}

// ═══════════════════════════════════════════════════════════════════════════
// Connection Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when connection times out.
final class BleConnectionTimeoutException extends BleException {
  /// The device ID that failed to connect.
  final String deviceId;

  /// Timeout duration that was exceeded.
  final Duration timeout;

  const BleConnectionTimeoutException(
    this.deviceId,
    this.timeout, [
    String message = 'Connection timed out',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when connection fails for reasons other than timeout.
final class BleConnectionFailedException extends BleException {
  /// The device ID that failed to connect.
  final String deviceId;

  const BleConnectionFailedException(
    this.deviceId, [
    String message = 'Failed to establish connection',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when an operation requires a connection but device is not connected.
final class BleNotConnectedException extends BleException {
  const BleNotConnectedException([
    String message = 'No device is connected',
    Object? cause,
  ]) : super(message, cause);
}

// ═══════════════════════════════════════════════════════════════════════════
// Operation Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when a write operation fails.
final class BleWriteException extends BleException {
  /// Target service UUID.
  final String serviceUuid;

  /// Target characteristic UUID.
  final String characteristicUuid;

  const BleWriteException(
    this.serviceUuid,
    this.characteristicUuid, [
    String message = 'Write operation failed',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when a read operation fails.
final class BleReadException extends BleException {
  /// Target service UUID.
  final String serviceUuid;

  /// Target characteristic UUID.
  final String characteristicUuid;

  const BleReadException(
    this.serviceUuid,
    this.characteristicUuid, [
    String message = 'Read operation failed',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when service discovery fails.
final class BleServiceDiscoveryException extends BleException {
  const BleServiceDiscoveryException([
    String message = 'Failed to discover services',
    Object? cause,
  ]) : super(message, cause);
}

/// Thrown when a requested service or characteristic is not found.
final class BleCharacteristicNotFoundException extends BleException {
  /// Service UUID that was searched (may be null if not applicable).
  final String? serviceUuid;

  /// Characteristic UUID that was not found.
  final String? characteristicUuid;

  const BleCharacteristicNotFoundException({
    this.serviceUuid,
    this.characteristicUuid,
    String message = 'Characteristic not found',
    Object? cause,
  }) : super(message, cause);
}

// ═══════════════════════════════════════════════════════════════════════════
// Scan Errors
// ═══════════════════════════════════════════════════════════════════════════

/// Thrown when scanning fails.
final class BleScanException extends BleException {
  const BleScanException([
    String message = 'Scan operation failed',
    Object? cause,
  ]) : super(message, cause);
}
