# Project Architecture: lib

## Directory Tree
```text
lib/
├── aggregate.py
├── core
│   ├── core.dart
│   ├── exceptions
│   │   └── ble_exception.dart
│   ├── interfaces
│   │   └── i_ble_service.dart
│   ├── models
│   │   ├── ble_connection_state.dart
│   │   ├── ble_device.dart
│   │   └── ble_service_info.dart
│   ├── services
│   │   └── flutter_blue_plus_service.dart
│   ├── utils
│   │   ├── android_permissions.dart
│   │   └── byte_utils.dart
│   └── viewmodels
│       └── ble_controller_viewmodel.dart
├── main.dart
└── ui
    ├── screens
    │   ├── control_screen.dart
    │   ├── device_scan_page.dart
    │   └── slider_control_page.dart
    ├── ui.dart
    └── widgets
        ├── hold_action_button.dart
        └── temperature_chart.dart
```

---

## File: main.dart
```dart
/// PhysTrigger Heating Vest - Main Entry Point
///
/// Implements robust error handling via runZonedGuarded and strict initialization order.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'ui/screens/device_scan_page.dart';

Future<void> main() async {
  // Fix 2: Safety Wrapper
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Catch-all for Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint('[FLUTTER ERROR] ${details.exception}');
      debugPrint('[STACK TRACE] ${details.stack}');
    };

    runApp(const PhysTriggerApp());
  }, (Object error, StackTrace stack) {
    // Catch-all for async/Dart errors
    debugPrint('[FATAL APP ERROR] $error');
    debugPrint('[STACK TRACE] $stack');
  });
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Layer 1: BLE Service
        Provider<IBleService>(
          create: (_) => FlutterBluePlusService(),
          dispose: (_, service) => service.dispose(),
        ),

        // Layer 2: ViewModel
        ChangeNotifierProxyProvider<IBleService, BleControllerViewModel>(
          create: (context) {
            final viewModel = BleControllerViewModel(
              context.read<IBleService>(),
            );
            // Critical: Initialize permission/scan logic AFTER creation
            viewModel.initialize();
            return viewModel;
          },
          update: (_, service, viewModel) =>
              viewModel ?? BleControllerViewModel(service),
        ),
      ],
      child: MaterialApp(
        title: 'PhysTrigger Heating Vest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0D1117),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF58A6FF),
            secondary: Color(0xFF238636),
            surface: Color(0xFF161B22),
          ),
          fontFamily: 'Segoe UI',
          useMaterial3: true,
        ),
        home: const DeviceScanPage(),
      ),
    );
  }
}

```

---
## File: core\core.dart
```dart
/// Core module exports
///
/// Provides a single import point for all core functionality.
/// This barrel file exposes the public API of the core module.
library;

// ═══════════════════════════════════════════════════════════════════════════
// Interfaces (Contracts)
// ═══════════════════════════════════════════════════════════════════════════
export 'interfaces/i_ble_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Domain Models
// ═══════════════════════════════════════════════════════════════════════════
export 'models/ble_device.dart';
export 'models/ble_connection_state.dart';
export 'models/ble_service_info.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Exceptions
// ═══════════════════════════════════════════════════════════════════════════
export 'exceptions/ble_exception.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Services (Implementations)
// ═══════════════════════════════════════════════════════════════════════════
export 'services/flutter_blue_plus_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Utilities
// ═══════════════════════════════════════════════════════════════════════════
export 'utils/byte_utils.dart';
export 'utils/android_permissions.dart';

// ═══════════════════════════════════════════════════════════════════════════
// ViewModels
// ═══════════════════════════════════════════════════════════════════════════
export 'viewmodels/ble_controller_viewmodel.dart';

```

---
## File: core\exceptions\ble_exception.dart
```dart
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

```

---
## File: core\interfaces\i_ble_service.dart
```dart
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

```

---
## File: core\models\ble_connection_state.dart
```dart
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

```

---
## File: core\models\ble_device.dart
```dart
/// Domain model representing a discovered BLE device.
///
/// This is a pure data class with no dependencies on third-party libraries,
/// ensuring the UI layer remains decoupled from BLE implementation details.
library;

import 'package:flutter/foundation.dart';

/// Immutable representation of a discovered BLE device.
@immutable
class BleDevice {
  /// Unique identifier (MAC address on Android, UUID on iOS/Windows).
  final String id;

  /// Advertised device name (may be empty if not advertised).
  final String name;

  /// Signal strength in dBm (typically -30 to -100).
  final int rssi;

  /// List of advertised service UUIDs.
  final List<String> serviceUuids;

  /// Raw manufacturer-specific data keyed by company identifier.
  final Map<int, List<int>> manufacturerData;

  const BleDevice({
    required this.id,
    this.name = '',
    this.rssi = 0,
    this.serviceUuids = const [],
    this.manufacturerData = const {},
  });

  /// Whether this device has a valid advertised name.
  bool get hasName => name.isNotEmpty;

  /// Signal strength category based on RSSI.
  BleSignalStrength get signalStrength {
    if (rssi >= -50) return BleSignalStrength.excellent;
    if (rssi >= -60) return BleSignalStrength.good;
    if (rssi >= -70) return BleSignalStrength.fair;
    return BleSignalStrength.weak;
  }

  /// Create a copy with updated values.
  BleDevice copyWith({
    String? id,
    String? name,
    int? rssi,
    List<String>? serviceUuids,
    Map<int, List<int>>? manufacturerData,
  }) {
    return BleDevice(
      id: id ?? this.id,
      name: name ?? this.name,
      rssi: rssi ?? this.rssi,
      serviceUuids: serviceUuids ?? this.serviceUuids,
      manufacturerData: manufacturerData ?? this.manufacturerData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BleDevice && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'BleDevice(id: $id, name: $name, rssi: $rssi)';
}

/// Signal strength categories based on RSSI values.
enum BleSignalStrength {
  /// RSSI >= -50 dBm
  excellent,

  /// RSSI >= -60 dBm
  good,

  /// RSSI >= -70 dBm
  fair,

  /// RSSI < -70 dBm
  weak,
}

```

---
## File: core\models\ble_service_info.dart
```dart
/// Domain models for BLE service and characteristic discovery results.
///
/// These models abstract away the underlying BLE library's data structures,
/// providing a clean interface for the UI layer.
library;

import 'package:flutter/foundation.dart';

/// Represents a discovered BLE service.
@immutable
class BleServiceInfo {
  /// Service UUID (typically in 128-bit or 16-bit format).
  final String uuid;

  /// List of characteristics discovered within this service.
  final List<BleCharacteristicInfo> characteristics;

  const BleServiceInfo({
    required this.uuid,
    this.characteristics = const [],
  });

  /// Find a characteristic by UUID.
  BleCharacteristicInfo? findCharacteristic(String characteristicUuid) {
    final normalizedUuid = characteristicUuid.toLowerCase();
    return characteristics.cast<BleCharacteristicInfo?>().firstWhere(
          (c) => c!.uuid.toLowerCase() == normalizedUuid,
          orElse: () => null,
        );
  }

  @override
  String toString() =>
      'BleServiceInfo(uuid: $uuid, characteristics: ${characteristics.length})';
}

/// Represents a discovered BLE characteristic.
@immutable
class BleCharacteristicInfo {
  /// Characteristic UUID.
  final String uuid;

  /// Whether this characteristic supports read operations.
  final bool canRead;

  /// Whether this characteristic supports write with response.
  final bool canWrite;

  /// Whether this characteristic supports write without response.
  final bool canWriteWithoutResponse;

  /// Whether this characteristic supports notifications.
  final bool canNotify;

  /// Whether this characteristic supports indications.
  final bool canIndicate;

  const BleCharacteristicInfo({
    required this.uuid,
    this.canRead = false,
    this.canWrite = false,
    this.canWriteWithoutResponse = false,
    this.canNotify = false,
    this.canIndicate = false,
  });

  /// Whether any write operation is supported.
  bool get isWriteable => canWrite || canWriteWithoutResponse;

  /// Whether any subscription mode is supported.
  bool get isSubscribable => canNotify || canIndicate;

  @override
  String toString() => 'BleCharacteristicInfo(uuid: $uuid, '
      'read: $canRead, write: $canWrite, notify: $canNotify)';
}

```

---
## File: core\services\flutter_blue_plus_service.dart
```dart
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

        if (state == BluetoothConnectionState.disconnected) {
          _cleanupConnection();
        }
      });

      // Attempt connection
      await device.connect(
        timeout: timeout,
        autoConnect: false,
      );

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
      // Diconnect to clean up if validation failed
      await _fbpDevice?.disconnect(); 
      _updateConnectionState(BleConnectionState.disconnected);
      rethrow;
    } catch (e) {
      // Diconnect to clean up
      await _fbpDevice?.disconnect();
      _updateConnectionState(BleConnectionState.disconnected);
      throw BleConnectionFailedException(
        deviceId,
        'Failed to connect: ${e.toString()}',
        e,
      );
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

```

---
## File: core\utils\android_permissions.dart
```dart
/// Android BLE Permission Helper - Bulletproof Implementation
///
/// Handles Android 12+ (API 31+) split permissions and Legacy (API < 31) location permissions.
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Request BLE permissions with logic for all Android versions.
///
/// Returns `true` only if crucial permissions are granted.
Future<bool> requestAndroidPermissions({
  VoidCallback? onOpenSettings,
}) async {
  if (!Platform.isAndroid) return true;

  // Use permission_handler's built-in SDK check/support
  // It automatically handles manifest merging if configured correctly,
  // but explicit requests are safer.
  
  Map<Permission, PermissionStatus> statuses;

  // Check if we are potentially on Android 12+
  // We can infer this if BLUETOOTH_SCAN is supported/declared.
  // Note: Permission.bluetoothScan.status won't crash on older Android, 
  // it just returns restricted/denied usually.
  
  // Strategy: Request everything relevant.
  // The plugin handles API level checks internally.
  
  if (await Permission.bluetoothScan.status.isRestricted || 
      await _isAndroid12OrHigher()) {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 12+ (S / API 31+)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Request SCAN and CONNECT together
    statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    final scan = statuses[Permission.bluetoothScan];
    final connect = statuses[Permission.bluetoothConnect];
    
    if (scan == PermissionStatus.granted && connect == PermissionStatus.granted) {
      return true;
    }
    
    if (scan == PermissionStatus.permanentlyDenied || connect == PermissionStatus.permanentlyDenied) {
      onOpenSettings?.call();
      return false;
    }
    
    return false;
  } else {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 11 and below (API < 31)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Requires LOCATION for BLE scanning
    final status = await Permission.locationWhenInUse.request();
    
    if (status.isGranted) return true;
    
    if (status.isPermanentlyDenied) {
      onOpenSettings?.call();
    }
    return false;
  }
}

/// Helper: Roughly detect Android 12+ environment
Future<bool> _isAndroid12OrHigher() async {
  // On older Android, bluetoothScan usually returns restricted/unavailable state immediately.
  // But reliable check is checking OS version directly if needed. 
  // For safety, we try to create the intent if needed, but here we stick to permission_handler.
  
  // Note: permission_handler 10.0+ handles this well.
  // Using a heuristic: if bluetoothScan is NOT permanently denied by default, it might be 12+.
  // Actually, simplest is to just request.
  
  // Using device info plugin would be best, but we don't want extra dependencies.
  // We rely on the fact that requesting `bluetoothScan` on Android 10 returns success immediately/ignores it?
  // No, permission_handler returns `restricted` on older Android for new permissions.
  
  // If `bluetoothScan` is Restricted, we assume old Android.
  var status = await Permission.bluetoothScan.status;
  return !status.isRestricted; 
}

```

---
## File: core\utils\byte_utils.dart
```dart
/// Byte conversion utilities for BLE communication
/// 
/// Ensures data format strictly conforms to the protocol:
/// - All data must be List<int> (Byte Array)
/// - Each element must be in range 0-255 (unsigned byte)
library;

import 'dart:convert'; // For utf8 decoder
import 'package:flutter/foundation.dart';

/// Converts a single hex value to a byte list
/// 
/// Example:
/// ```dart
/// hexToByte(0x01);  // Returns [1]
/// hexToByte(0xA5);  // Returns [165]
/// hexToByte(0xFF);  // Returns [255]
/// ```
List<int> hexToByte(int hexValue) {
  assert(hexValue >= 0 && hexValue <= 255, 
    'Hex value must be in range 0x00-0xFF (0-255)');
  return [hexValue];
}

/// Converts a hex string to a byte list
/// 
/// Supports formats:
/// - "A5" or "a5" (single byte)
/// - "A5DD02" or "A5 DD 02" (multi-byte)
/// - "0xA5" or "0XA5" (with prefix)
/// 
/// Example:
/// ```dart
/// hexStringToBytes("A5DD02");     // Returns [165, 221, 2]
/// hexStringToBytes("A5 DD 02");   // Returns [165, 221, 2]
/// hexStringToBytes("0xA5");       // Returns [165]
/// ```
List<int> hexStringToBytes(String hexString) {
  // Remove common prefixes and spaces
  String cleaned = hexString
      .replaceAll('0x', '')
      .replaceAll('0X', '')
      .replaceAll(' ', '')
      .toUpperCase();
  
  // Ensure even number of characters
  if (cleaned.length % 2 != 0) {
    cleaned = '0$cleaned';
  }
  
  final List<int> bytes = [];
  for (int i = 0; i < cleaned.length; i += 2) {
    final hexPair = cleaned.substring(i, i + 2);
    final value = int.parse(hexPair, radix: 16);
    bytes.add(value);
  }
  
  return bytes;
}

/// Converts a byte list to a hex string for debugging
/// 
/// Example:
/// ```dart
/// bytesToHexString([165, 221, 2]);  // Returns "A5 DD 02"
/// ```
String bytesToHexString(List<int> bytes) {
  return bytes
      .map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join(' ');
}

/// Validates that all bytes are in valid range (0-255)
/// 
/// Throws [ArgumentError] if any byte is out of range
void validateBytes(List<int> bytes) {
  for (int i = 0; i < bytes.length; i++) {
    if (bytes[i] < 0 || bytes[i] > 255) {
      throw ArgumentError(
        'Byte at index $i (value: ${bytes[i]}) is out of range 0-255'
      );
    }
  }
}

/// Converts slider percentage to byte array for BLE transmission
/// 
/// ESP32 firmware expects UINT8 (0-100) directly, no conversion needed.
/// The firmware internally maps this to PWM duty cycle (0-255).
/// 
/// Example:
/// ```dart
/// sliderValueToBytes(0);    // Returns [0]   - 0% heating
/// sliderValueToBytes(50);   // Returns [50]  - 50% heating
/// sliderValueToBytes(100);  // Returns [100] - 100% heating
/// ```
List<int> sliderValueToBytes(int percentage) {
  assert(percentage >= 0 && percentage <= 100, 
    'Slider value must be in range 0-100');
  return [percentage];
}

/// BLE UUID constants for PhysTrigger Heating Vest
/// 
/// These UUIDs match the ESP32 firmware in sketch_jan3a.ino
abstract class BleUuids {
  /// PhysTrigger Heating Vest Service UUID
  static const String serviceUuid = '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
  
  /// PWM Control Characteristic UUID (Write/Write No Response)
  /// Accepts UINT8 values from 0-100 representing heating intensity percentage
  static const String characteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a8';
  
  /// Temperature Notification Characteristic UUID (Read/Notify)
  /// Broadcasts temperature readings as UTF8 string (e.g., "25.82")
  static const String tempCharacteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a9';
  
  /// Target device name for scanning
  static const String targetDeviceName = 'PhysTrigger_Vest';
}

/// Parse temperature from UTF8 bytes
/// 
/// ESP32 sends temperature as UTF8 string (e.g., "25.82")
/// This function converts bytes to string and parses to double
double parseTemperature(List<int> bytes) {
  try {
    final str = utf8.decode(bytes);
    return double.tryParse(str) ?? 0.0;
  } catch (e) {
    debugPrint('Temperature parse error: $e');
    return 0.0;
  }
}

```

---
## File: core\viewmodels\ble_controller_viewmodel.dart
```dart
/// BLE Controller ViewModel - MVVM State Management Layer
///
/// Bridges the UI layer with [IBleService] for BLE operations.
/// Uses [ChangeNotifier] for reactive state management with Provider.
///
/// ## Architecture
/// - Receives [IBleService] via constructor injection (DI-ready)
/// - Exposes observable state properties for UI binding
/// - Translates all [BleException] errors to user-friendly messages
///
/// ## Usage
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => BleControllerViewModel(FlutterBluePlusService()),
/// )
/// ```
library;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/ble_exception.dart';
import '../interfaces/i_ble_service.dart';
import '../models/ble_connection_state.dart';
import '../models/ble_device.dart';
import '../models/ble_service_info.dart';
import '../utils/byte_utils.dart';

/// ViewModel for BLE device control operations.
///
/// This class follows MVVM pattern and provides:
/// - Reactive state updates via [ChangeNotifier]
/// - Command methods for UI actions
/// - Error handling with user-friendly messages
class BleControllerViewModel extends ChangeNotifier {
  // ═══════════════════════════════════════════════════════════════════════════
  // Dependencies (Injected)
  // ═══════════════════════════════════════════════════════════════════════════

  /// BLE service interface - never instantiated internally.
  final IBleService _bleService;

  // ═══════════════════════════════════════════════════════════════════════════
  // Observable State Properties
  // ═══════════════════════════════════════════════════════════════════════════

  /// List of discovered devices from scan.
  List<BleDevice> _scanResults = [];

  /// Unmodifiable view of scan results for UI binding.
  List<BleDevice> get scanResults => List.unmodifiable(_scanResults);

  /// Current connection state.
  BleConnectionState _connectionState = BleConnectionState.disconnected;

  /// Current connection state for UI binding.
  BleConnectionState get connectionState => _connectionState;

  /// Currently connected device (null if disconnected).
  BleDevice? _connectedDevice;

  /// Currently connected device for UI binding.
  BleDevice? get connectedDevice => _connectedDevice;

  /// Whether a scan is currently in progress.
  bool _isScanning = false;

  /// Whether scanning is active for UI binding.
  bool get isScanning => _isScanning;

  /// Last error message for UI display (null if no error).
  String? _errorMessage;

  /// Error message for UI snackbar/dialog display.
  String? get errorMessage => _errorMessage;

  /// Discovered services on connected device.
  List<BleServiceInfo> _discoveredServices = [];

  /// Discovered services for UI binding.
  List<BleServiceInfo> get discoveredServices =>
      List.unmodifiable(_discoveredServices);

  /// Temperature history for chart display (last 30 readings).
  final List<double> _temperatureHistory = [];

  /// Temperature history for UI chart binding.
  List<double> get temperatureHistory => List.unmodifiable(_temperatureHistory);

  /// Current temperature reading.
  double _currentTemperature = 0.0;

  /// Current temperature for UI display.
  double get currentTemperature => _currentTemperature;

  /// Last sent command bytes (for debug display).
  List<int>? _lastSentCommand;

  /// Last sent command for debug UI.
  List<int>? get lastSentCommand => _lastSentCommand;

  /// Last sent command as hex string for debug display.
  String get lastSentCommandHex =>
      _lastSentCommand != null ? bytesToHexString(_lastSentCommand!) : '--';

  // ═══════════════════════════════════════════════════════════════════════════
  // Convenience Getters
  // ═══════════════════════════════════════════════════════════════════════════

  /// Whether device is currently connected.
  bool get isConnected => _connectionState == BleConnectionState.connected;

  /// Whether connection is in progress.
  bool get isConnecting => _connectionState == BleConnectionState.connecting;

  /// Whether disconnection is in progress.
  bool get isDisconnecting =>
      _connectionState == BleConnectionState.disconnecting;

  /// Whether any transitional state is active.
  bool get isBusy => _connectionState.isTransitioning || _isScanning;

  // ═══════════════════════════════════════════════════════════════════════════
  // Stream Subscriptions (must be disposed!)
  // ═══════════════════════════════════════════════════════════════════════════

  StreamSubscription<BleConnectionState>? _connectionStateSubscription;
  StreamSubscription<BleDevice>? _scanResultsSubscription;
  StreamSubscription<List<int>>? _dataReceivedSubscription;
  Timer? _scanTimeoutTimer;

  // ═══════════════════════════════════════════════════════════════════════════
  // Device Persistence (for auto-reconnect)
  // ═══════════════════════════════════════════════════════════════════════════

  static const String _keyLastDeviceId = 'last_connected_device_id';
  String? _lastSavedDeviceId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Constructor & Initialization
  // ═══════════════════════════════════════════════════════════════════════════

  /// Creates a new ViewModel with the given BLE service.
  ///
  /// The service is injected via constructor for testability and flexibility.
  /// Call [initialize] after construction to setup streams and permissions.
  BleControllerViewModel(this._bleService) {
    _setupServiceListeners();
  }

  /// Initialize the BLE service and request permissions.
  ///
  /// Should be called once after construction.
  /// Updates [errorMessage] if initialization fails.
  Future<void> initialize() async {
    try {
      await _bleService.initialize();
      _lastSavedDeviceId = await _loadLastDeviceId();
      debugPrint('BleControllerViewModel: Initialized successfully');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Init error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Failed to initialize BLE: $e';
      notifyListeners();
      debugPrint('BleControllerViewModel: Init error: $e');
    }
  }

  /// Setup listeners for service streams.
  void _setupServiceListeners() {
    // Listen to connection state changes
    _connectionStateSubscription = _bleService.connectionState.listen(
      (state) {
        _connectionState = state;

        if (state == BleConnectionState.connected) {
          _connectedDevice = _bleService.connectedDevice;
          _errorMessage = null;
        } else if (state == BleConnectionState.disconnected) {
          _connectedDevice = null;
          _discoveredServices = [];
        }

        notifyListeners();
        debugPrint('BleControllerViewModel: Connection state -> ${state.label}');
      },
      onError: (error) {
        if (error is BleException) {
          _errorMessage = error.message;
        } else {
          _errorMessage = error.toString();
        }
        notifyListeners();
      },
    );

    // Listen to data received (notifications)
    _dataReceivedSubscription = _bleService.dataReceived.listen(
      (data) {
        // Parse temperature if data looks like UTF8 temperature string
        if (data.isNotEmpty) {
          final temp = parseTemperature(data);
          if (temp > 0) {
            _currentTemperature = temp;
            _temperatureHistory.add(temp);

            // Keep only last 30 readings
            if (_temperatureHistory.length > 30) {
              _temperatureHistory.removeAt(0);
            }

            notifyListeners();
          }
        }
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Scanning Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Start scanning for BLE devices.
  ///
  /// Clears previous results and starts a new scan.
  /// Updates [isScanning] and [scanResults] reactively.
  /// Auto-stops after 15 seconds.
  Future<void> startScan({
    List<String>? filterByServiceUuids,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (_isScanning) return;

    _isScanning = true;
    _scanResults = [];
    _errorMessage = null;
    notifyListeners();

    try {
      // Start scan on service
      await _bleService.scan(
        filterByServiceUuids: filterByServiceUuids,
        timeout: timeout,
      );

      // Listen to scan results
      _scanResultsSubscription = _bleService.scanResults.listen(
        (device) {
          _handleScanResult(device);
        },
        onError: (error) {
          if (error is BleException) {
            _errorMessage = error.message;
          } else {
            _errorMessage = error.toString();
          }
          _isScanning = false;
          notifyListeners();
        },
        onDone: () {
          _isScanning = false;
          notifyListeners();
        },
      );

      // Safety timeout
      _scanTimeoutTimer = Timer(timeout, () {
        stopScan();
      });

      debugPrint('BleControllerViewModel: Scan started');
    } on BleException catch (e) {
      _errorMessage = e.message;
      _isScanning = false;
      notifyListeners();
      debugPrint('BleControllerViewModel: Scan error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Scan failed: $e';
      _isScanning = false;
      notifyListeners();
      debugPrint('BleControllerViewModel: Scan error: $e');
    }
  }

  /// Handle incoming scan result.
  void _handleScanResult(BleDevice device) {
    // Skip devices without names
    if (!device.hasName) return;

    // Check if we already have this device
    final existingIndex = _scanResults.indexWhere((d) => d.id == device.id);

    if (existingIndex >= 0) {
      // Update existing device with new RSSI
      _scanResults[existingIndex] = device;
    } else {
      // Add new device
      _scanResults.add(device);
      debugPrint(
          'BleControllerViewModel: Found device: ${device.name} [${device.id}]');
    }

    notifyListeners();
  }

  /// Stop the current scan.
  Future<void> stopScan() async {
    _scanTimeoutTimer?.cancel();
    _scanTimeoutTimer = null;

    await _scanResultsSubscription?.cancel();
    _scanResultsSubscription = null;

    try {
      await _bleService.stopScan();
    } catch (e) {
      debugPrint('BleControllerViewModel: Error stopping scan: $e');
    }

    _isScanning = false;
    notifyListeners();

    debugPrint('BleControllerViewModel: Scan stopped');
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Connection Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Connect to a discovered device.
  ///
  /// Returns true if connection was successful.
  /// Updates [connectionState] and [connectedDevice] reactively.
  Future<bool> connect(BleDevice device) async {
    _errorMessage = null;
    notifyListeners();

    try {
      await _bleService.connect(device.id);

      // Save device ID for future auto-reconnect
      if (_bleService.currentConnectionState == BleConnectionState.connected) {
        await _saveLastDeviceId(device.id);
      }

      debugPrint('BleControllerViewModel: Connected to ${device.name}');
      return true;
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Connect error: ${e.message}');
      return false;
    } catch (e) {
      _errorMessage = 'Connection failed: $e';
      notifyListeners();
      debugPrint('BleControllerViewModel: Connect error: $e');
      return false;
    }
  }

  /// Disconnect from the current device.
  ///
  /// Sends safety shutdown command (0%) before disconnecting.
  Future<void> disconnect() async {
    _errorMessage = null;

    // Safety: Send 0% command before disconnecting
    if (isConnected) {
      try {
        debugPrint(
            'BleControllerViewModel: Safety shutdown - sending 0% before disconnect');
        await writeSliderValue(0);
        await Future.delayed(const Duration(milliseconds: 200));
      } catch (e) {
        debugPrint('BleControllerViewModel: Safety shutdown failed: $e');
      }
    }

    try {
      await _bleService.disconnect();
      debugPrint('BleControllerViewModel: Disconnected');
    } on BleException catch (e) {
      _errorMessage = e.message;
      debugPrint('BleControllerViewModel: Disconnect error: ${e.message}');
    } catch (e) {
      _errorMessage = 'Disconnect failed: $e';
      debugPrint('BleControllerViewModel: Disconnect error: $e');
    }

    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Service Discovery
  // ═══════════════════════════════════════════════════════════════════════════

  /// Discover services on the connected device.
  ///
  /// Updates [discoveredServices] with results.
  Future<void> discoverServices() async {
    if (!isConnected) {
      _errorMessage = 'Cannot discover services: not connected';
      notifyListeners();
      return;
    }

    try {
      _discoveredServices = await _bleService.discoverServices();
      notifyListeners();
      debugPrint(
          'BleControllerViewModel: Discovered ${_discoveredServices.length} services');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Discovery error: ${e.message}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Data Commands
  // ═══════════════════════════════════════════════════════════════════════════

  /// Send raw bytes to the connected device.
  ///
  /// Updates [lastSentCommand] for debug display.
  Future<void> sendCommand(List<int> bytes) async {
    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot send - not connected');
      return;
    }

    try {
      validateBytes(bytes);

      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: bytes,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent ${bytesToHexString(bytes)}');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Send error: ${e.message}');
    }
  }

  /// Send slider value (0-100) to connected device.
  ///
  /// The firmware maps this percentage to PWM duty cycle.
  Future<void> writeSliderValue(int percentage) async {
    if (percentage < 0 || percentage > 100) {
      debugPrint('BleControllerViewModel: Invalid slider value: $percentage');
      return;
    }

    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot write slider - not connected');
      return;
    }

    try {
      final bytes = sliderValueToBytes(percentage);

      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: bytes,
        withResponse: false,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent slider value: $percentage%');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Write error: ${e.message}');
    }
  }

  /// Subscribe to notifications on a characteristic.
  Future<void> subscribeToNotifications({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    if (!isConnected) {
      _errorMessage = 'Cannot subscribe: not connected';
      notifyListeners();
      return;
    }

    try {
      await _bleService.subscribeToNotifications(
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
      );
      debugPrint('BleControllerViewModel: Subscribed to $characteristicUuid');
    } on BleException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      debugPrint('BleControllerViewModel: Subscribe error: ${e.message}');
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Error Management
  // ═══════════════════════════════════════════════════════════════════════════

  /// Clear the current error message.
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Device Persistence Helpers
  // ═══════════════════════════════════════════════════════════════════════════

  /// Save device ID to local storage.
  Future<void> _saveLastDeviceId(String deviceId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyLastDeviceId, deviceId);
      _lastSavedDeviceId = deviceId;
      debugPrint('BleControllerViewModel: Saved device ID: $deviceId');
    } catch (e) {
      debugPrint('BleControllerViewModel: Failed to save device ID: $e');
    }
  }

  /// Load last connected device ID from storage.
  Future<String?> _loadLastDeviceId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final deviceId = prefs.getString(_keyLastDeviceId);
      debugPrint('BleControllerViewModel: Loaded device ID: $deviceId');
      return deviceId;
    } catch (e) {
      debugPrint('BleControllerViewModel: Failed to load device ID: $e');
      return null;
    }
  }

  /// Get the last saved device ID (for auto-reconnect).
  String? get lastSavedDeviceId => _lastSavedDeviceId;

  // ═══════════════════════════════════════════════════════════════════════════
  // Lifecycle
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  void dispose() {
    // Cancel all stream subscriptions
    _connectionStateSubscription?.cancel();
    _scanResultsSubscription?.cancel();
    _dataReceivedSubscription?.cancel();
    _scanTimeoutTimer?.cancel();

    // Dispose the underlying service
    _bleService.dispose();

    super.dispose();
    debugPrint('BleControllerViewModel: Disposed');
  }
}

```

---
## File: ui\ui.dart
```dart
/// UI module exports
/// 
/// Provides a single import point for all UI widgets
library;

export 'widgets/hold_action_button.dart';
export 'screens/control_screen.dart';

```

---
## File: ui\screens\control_screen.dart
```dart
/// Control Screen - Main UI for BLE device interaction
///
/// Dynamic view switching:
/// - Disconnected: Shows scan button + device list
/// - Connected: Shows disconnect button + control pad
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../widgets/hold_action_button.dart';

/// Main control screen with scan/connect/control functionality
class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text('PhysTrigger BLE'),
        backgroundColor: const Color(0xFF16213E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              // Main content area
              Expanded(
                child: viewModel.isConnected
                    ? _buildControlPanel(context, viewModel)
                    : _buildScanPanel(context, viewModel),
              ),

              // Debug info bar at bottom
              _buildDebugBar(viewModel),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // State A: Disconnected - Scan Panel
  // ============================================================

  Widget _buildScanPanel(BuildContext context, BleControllerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Scan button
          ElevatedButton.icon(
            onPressed: viewModel.isScanning ? viewModel.stopScan : viewModel.startScan,
            icon: viewModel.isScanning
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.bluetooth_searching),
            label: Text(viewModel.isScanning ? '停止扫描' : '扫描设备'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3460),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Device list header
          Text(
            '发现的设备 (${viewModel.scanResults.length})',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // Device list
          Expanded(
            child: viewModel.scanResults.isEmpty
                ? Center(
                    child: Text(
                      viewModel.isScanning ? '正在扫描...' : '点击上方按钮开始扫描',
                      style: const TextStyle(color: Colors.white38),
                    ),
                  )
                : ListView.builder(
                    itemCount: viewModel.scanResults.length,
                    itemBuilder: (context, index) {
                      final device = viewModel.scanResults[index];
                      return _buildDeviceListTile(context, viewModel, device);
                    },
                  ),
          ),

          // Error message
          if (viewModel.errorMessage != null)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.redAccent),
              ),
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDeviceListTile(
    BuildContext context,
    BleControllerViewModel viewModel,
    BleDevice device,
  ) {
    // Display "Unknown Device (MAC)" if name is empty
    final displayName = device.name.isNotEmpty
        ? device.name
        : 'Unknown Device (${device.id})';

    return Card(
      color: const Color(0xFF16213E),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.bluetooth, color: Colors.blueAccent),
        title: Text(
          displayName,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'RSSI: ${device.rssi} dBm',
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        trailing: viewModel.isConnecting
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.chevron_right, color: Colors.white38),
        onTap: viewModel.isConnecting
            ? null
            : () async {
                await viewModel.connect(device);
              },
      ),
    );
  }

  // ============================================================
  // State B: Connected - Control Panel
  // ============================================================

  Widget _buildControlPanel(BuildContext context, BleControllerViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Connection status header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.greenAccent),
            ),
            child: Row(
              children: [
                const Icon(Icons.bluetooth_connected, color: Colors.greenAccent),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '已连接',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        viewModel.connectedDevice?.name ?? 'Unknown',
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: viewModel.disconnect,
                  child: const Text(
                    '断开连接',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Directional control pad
          Expanded(
            child: Center(
              child: DirectionalPad(
                onCommand: viewModel.sendCommand,
                buttonSize: 80,
                enabled: viewModel.isConnected,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Additional action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HoldActionButton(
                label: 'STOP',
                icon: Icons.stop_circle_outlined,
                pressCommand: const [0x00], // STOP command
                releaseCommand: const [0x00], // STOP command
                onCommand: viewModel.sendCommand,
                size: 70,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade900,
                enabled:viewModel.isConnected,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Debug Bar (always visible at bottom)
  // ============================================================

  Widget _buildDebugBar(BleControllerViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F1A),
        border: Border(
          top: BorderSide(color: Colors.white12),
        ),
      ),
      child: Row(
        children: [
          // Connection state indicator
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getConnectionColor(viewModel.connectionState),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _getConnectionText(viewModel.connectionState),
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),

          const Spacer(),

          // Last sent command
          const Text(
            '最后指令: ',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              viewModel.lastSentCommandHex,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 12,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getConnectionColor(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.connected:
        return Colors.greenAccent;
      case BleConnectionState.connecting:
      case BleConnectionState.disconnecting:
        return Colors.orangeAccent;
      case BleConnectionState.disconnected:
        return Colors.redAccent;
    }
  }

  String _getConnectionText(BleConnectionState state) {
    switch (state) {
      case BleConnectionState.connected:
        return '已连接';
      case BleConnectionState.connecting:
        return '连接中...';
      case BleConnectionState.disconnecting:
        return '断开中...';
      case BleConnectionState.disconnected:
        return '未连接';
    }
  }
}

```

---
## File: ui\screens\device_scan_page.dart
```dart
/// Device Connect Page - Simple Connection UI
/// 
/// Single button to scan and connect to PhysTrigger_Vest.
/// After successful connection, navigates to SliderControlPage.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import 'slider_control_page.dart';

/// Simple landing page with connect button
class DeviceScanPage extends StatefulWidget {
  const DeviceScanPage({super.key});

  @override
  State<DeviceScanPage> createState() => _DeviceScanPageState();
}

class _DeviceScanPageState extends State<DeviceScanPage> {
  bool _isConnecting = false;
  Timer? _scanTimer;

  @override
  void dispose() {
    _scanTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          // Navigate to control page when connected
          if (viewModel.isConnected) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const SliderControlPage(),
                ),
              );
            });
          }

          final showLoading = _isConnecting || viewModel.isScanning || viewModel.isConnecting;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: showLoading
                            ? [const Color(0xFF58A6FF), const Color(0xFF388BFD)]
                            : [const Color(0xFF238636), const Color(0xFF2EA043)],
                      ),
                    ),
                    child: Icon(
                      showLoading
                          ? Icons.bluetooth_searching
                          : Icons.bluetooth,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Title
                  const Text(
                    'PhysTrigger Vest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Status Text
                  Text(
                    _getStatusText(viewModel),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  // Connected Device ID
                  if (viewModel.connectedDevice != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${viewModel.connectedDevice!.id}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 48),
                  
                  // Connect Button or Loading
                  if (showLoading)
                    const Column(
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xFF58A6FF),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '正在连接...',
                          style: TextStyle(
                            color: Color(0xFF58A6FF),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: () => _startConnection(viewModel),
                      icon: const Icon(Icons.power_settings_new, size: 24),
                      label: const Text(
                        '连接设备',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF238636),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  
                  // Error Message
                  if (viewModel.errorMessage != null) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDA3633).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFDA3633),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              viewModel.errorMessage!,
                              style: const TextStyle(
                                color: Color(0xFFDA3633),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getStatusText(BleControllerViewModel viewModel) {
    if (viewModel.isConnecting) return '正在连接 PhysTrigger_Vest...';
    if (_isConnecting || viewModel.isScanning) return '正在搜索 PhysTrigger_Vest...';
    if (viewModel.isConnected) return '已连接';
    return '点击下方按钮连接加热马甲';
  }

  void _startConnection(BleControllerViewModel viewModel) {
    setState(() => _isConnecting = true);
    
    // Start scan
    viewModel.startScan();
    
    // Poll for PhysTrigger device every 500ms
    _scanTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final results = viewModel.scanResults;
      
      // Find PhysTrigger device by name
      BleDevice? targetDevice;
      for (final device in results) {
        if (device.name.toLowerCase().contains('phystrigger')) {
          targetDevice = device;
          debugPrint('[DeviceScanPage] Found PhysTrigger: ${device.name} [${device.id}]');
          break;
        }
      }
      
      if (targetDevice != null) {
        timer.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        
        debugPrint('[DeviceScanPage] Connecting to: ${targetDevice.name} [${targetDevice.id}]');
        viewModel.connect(targetDevice);
        
        setState(() => _isConnecting = false);
      }
    });
    
    // Timeout after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (_scanTimer?.isActive ?? false) {
        _scanTimer?.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        setState(() => _isConnecting = false);
      }
    });
  }
}

```

---
## File: ui\screens\slider_control_page.dart
```dart
/// Slider Control Page for PhysTrigger Heating Vest
/// 
/// Main UI screen with:
/// - Connection status display in AppBar
/// - Large vertical slider (0-100%)
/// - Real-time BLE communication
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../widgets/temperature_chart.dart';
import 'device_scan_page.dart';

/// Main control screen for heating vest slider control
class SliderControlPage extends StatefulWidget {
  const SliderControlPage({super.key});

  @override
  State<SliderControlPage> createState() => _SliderControlPageState();
}

class _SliderControlPageState extends State<SliderControlPage> {
  double _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: _buildAppBar(context),
      body: Consumer<BleControllerViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Connection Status Card
                    _buildConnectionStatusCard(viewModel),
                    
                    const SizedBox(height: 48),
                    
                    // Slider Control Section
                    if (viewModel.isConnected) ...[
                      _buildSliderControl(viewModel),
                    ] else ...[
                      _buildDisconnectedMessage(viewModel),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// AppBar with connection status badge
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'PhysTrigger Heating Vest',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFF161B22),
      elevation: 0,
      actions: [
        Consumer<BleControllerViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: _buildConnectionBadge(context, viewModel),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Connection status badge for AppBar with hover disconnect
  Widget _buildConnectionBadge(BuildContext context, BleControllerViewModel viewModel) {
    if (viewModel.isConnected) {
      // Connected state with hover to disconnect
      return _HoverDisconnectBadge(
        onDisconnect: () async {
          await viewModel.disconnect();
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const DeviceScanPage()),
            );
          }
        },
      );
    } else if (viewModel.isScanning || viewModel.isConnecting) {
      return _buildStatusBadge('搜索中...', const Color(0xFFF0883E), Icons.bluetooth_searching);
    } else {
      return _buildStatusBadge('断开', const Color(0xFFDA3633), Icons.bluetooth_disabled);
    }
  }
  
  Widget _buildStatusBadge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Connection status detail card
  Widget _buildConnectionStatusCard(BleControllerViewModel viewModel) {
    return Card(
      elevation: 8,
      color: const Color(0xFF161B22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFF30363D).withOpacity(0.8),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Device Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: viewModel.isConnected
                      ? [const Color(0xFF238636), const Color(0xFF2EA043)]
                      : [const Color(0xFF8B949E), const Color(0xFF6E7681)],
                ),
              ),
              child: Icon(
                viewModel.isConnected
                    ? Icons.bluetooth_connected
                    : Icons.bluetooth_disabled,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(height: 16),

            // Device Name
            Text(
              viewModel.connectedDevice?.name ?? BleUuids.targetDeviceName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Connection Details
            if (viewModel.isConnected) ...[
              Text(
                viewModel.connectedDevice?.id ?? '',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'monospace',
                ),
              ),
            ] else if (viewModel.errorMessage != null) ...[
              Text(
                viewModel.errorMessage!,
                style: const TextStyle(
                  color: Color(0xFFDA3633),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Main slider control widget
  Widget _buildSliderControl(BleControllerViewModel viewModel) {
    return Column(
      children: [
        // Temperature Chart (NEW)
        if (viewModel.temperatureHistory.isNotEmpty)
          TemperatureChart(
            temperatureData: viewModel.temperatureHistory,
            currentTemperature: viewModel.currentTemperature,
          ),
        
        if (viewModel.temperatureHistory.isNotEmpty)
          const SizedBox(height: 32),
        
        // Heating Intensity Label
        const Text(
          '加热强度',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 32),

        // Current Value Display
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Color.lerp(
                  const Color(0xFF161B22),
                  const Color(0xFFF0883E),
                  _currentValue / 100,
                )!,
                const Color(0xFF161B22),
              ],
            ),
            border: Border.all(
              color: Color.lerp(
                const Color(0xFF30363D),
                const Color(0xFFF0883E),
                _currentValue / 100,
              )!,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              '${_currentValue.toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 48),

        // Horizontal Slider (CHANGED from vertical)
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 12,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 16,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 24,
            ),
            activeTrackColor: const Color(0xFFF0883E),
            inactiveTrackColor: const Color(0xFF30363D),
            thumbColor: const Color(0xFFF0883E),
            overlayColor: const Color(0xFFF0883E).withOpacity(0.2),
            valueIndicatorColor: const Color(0xFFF0883E),
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${_currentValue.toInt()}%',
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
            onChangeEnd: (value) {
              // Send to BLE when user finishes adjusting
              viewModel.writeSliderValue(value.toInt());
            },
          ),
        ),

        const SizedBox(height: 32),

        // Value Range Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '50%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '100%',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Last Sent Command Debug Info
        if (viewModel.lastSentCommandHex != '--')
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF21262D),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.send,
                  color: Color(0xFF58A6FF),
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '最后发送: ${viewModel.lastSentCommandHex}',
                  style: const TextStyle(
                    color: Color(0xFF58A6FF),
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// Message shown when not connected
  Widget _buildDisconnectedMessage(BleControllerViewModel viewModel) {
    return Column(
      children: [
        Icon(
          Icons.power_off,
          size: 80,
          color: Colors.white.withOpacity(0.3),
        ),
        const SizedBox(height: 24),
        Text(
          viewModel.isScanning ? '正在搜索设备...' : '设备未连接',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        if (!viewModel.isScanning)
          ElevatedButton.icon(
            onPressed: () => viewModel.startScan(),
            icon: const Icon(Icons.refresh),
            label: const Text('重新扫描'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF238636),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
      ],
    );
  }
}

/// Hover-enabled disconnect badge
/// Shows "已连接" normally, changes to "断开连接" on hover
class _HoverDisconnectBadge extends StatefulWidget {
  final VoidCallback onDisconnect;
  
  const _HoverDisconnectBadge({required this.onDisconnect});

  @override
  State<_HoverDisconnectBadge> createState() => _HoverDisconnectBadgeState();
}

class _HoverDisconnectBadgeState extends State<_HoverDisconnectBadge> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovering 
        ? const Color(0xFFDA3633) 
        : const Color(0xFF3FB950);
    final text = _isHovering ? '断开连接' : '已连接';
    final icon = _isHovering 
        ? Icons.bluetooth_disabled 
        : Icons.bluetooth_connected;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onDisconnect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

---
## File: ui\widgets\hold_action_button.dart
```dart
/// HoldActionButton - A custom button that sends BLE commands on press/release
/// 
/// This widget replicates the TouchDown/TouchUp behavior from MIT App Inventor:
/// - **onTapDown (TouchDown)**: Sends the "press" command (e.g., 0x01 for forward)
/// - **onTapUp (TouchUp)**: Sends the "release" command (e.g., 0x00 for stop)
/// - **onTapCancel**: Handles edge case when finger slides out of button area
/// 
/// Desktop support:
/// - MouseRegion adds "click" cursor on hover
/// - GestureDetector handles left mouse button as touch
/// 
/// Visual feedback includes scale animation and color change to simulate
/// physical button feel.
library;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Callback type for BLE command actions
typedef BleCommandCallback = Future<void> Function(List<int> data);

/// A button that executes different actions on press and release
/// 
/// Mimics the MIT App Inventor TouchDown/TouchUp pattern for BLE control.
/// 
/// Example usage:
/// ```dart
/// HoldActionButton(
///   label: 'FORWARD',
///   icon: Icons.arrow_upward,
///   pressCommand: [0x01],    // Send on TouchDown
///   releaseCommand: [0x00],  // Send on TouchUp/Cancel
///   onCommand: (data) async {
///     await bleService.writeBytes('FFE0', 'FFE1', data);
///   },
/// )
/// ```
class HoldActionButton extends StatefulWidget {
  /// Button label text
  final String label;
  
  /// Optional icon displayed above/beside the label
  final IconData? icon;
  
  /// Command bytes to send when button is pressed (TouchDown)
  /// Default: [0x01] (forward command)
  final List<int> pressCommand;
  
  /// Command bytes to send when button is released (TouchUp/Cancel)
  /// Default: [0x00] (stop command)
  final List<int> releaseCommand;
  
  /// Callback to execute BLE write operation
  /// Receives the command bytes to send
  final BleCommandCallback onCommand;
  
  /// Button size (width and height)
  final double size;
  
  /// Active color when button is pressed
  final Color activeColor;
  
  /// Inactive color when button is released
  final Color inactiveColor;
  
  /// Whether the button is enabled
  final bool enabled;
  
  /// Enable haptic feedback on press/release
  final bool hapticFeedback;

  const HoldActionButton({
    super.key,
    required this.label,
    required this.onCommand,
    this.icon,
    this.pressCommand = const [0x01],
    this.releaseCommand = const [0x00],
    this.size = 80.0,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.enabled = true,
    this.hapticFeedback = true,
  });

  @override
  State<HoldActionButton> createState() => _HoldActionButtonState();
}

class _HoldActionButtonState extends State<HoldActionButton>
    with SingleTickerProviderStateMixin {
  
  /// Tracks whether the button is currently being pressed
  bool _isPressed = false;
  
  /// Animation controller for scale effect
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Setup scale animation for visual feedback
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.92, // Shrink to 92% when pressed
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Handle button press (TouchDown equivalent)
  /// 
  /// This is called when the user's finger touches the button.
  /// Sends the pressCommand (e.g., 0x01 for forward).
  void _handleTapDown(TapDownDetails details) {
    if (!widget.enabled) return;
    
    setState(() => _isPressed = true);
    _animationController.forward();
    
    // Haptic feedback for tactile response (mobile only)
    // Desktop platforms don't support haptic feedback
    if (widget.hapticFeedback && !_isDesktop) {
      HapticFeedback.mediumImpact();
    }
    
    // Send press command via BLE
    _sendCommand(widget.pressCommand);
  }
  
  /// Check if running on desktop platform
  bool get _isDesktop => 
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  /// Handle button release (TouchUp equivalent)
  /// 
  /// This is called when the user lifts their finger from the button.
  /// Sends the releaseCommand (e.g., 0x00 for stop).
  void _handleTapUp(TapUpDetails details) {
    _release();
  }

  /// Handle finger sliding out of button area (TouchCancel equivalent)
  /// 
  /// IMPORTANT: This edge case is critical for control applications!
  /// 
  /// Scenario: User presses button, then slides finger outside the button
  /// area before lifting. Without handling this:
  /// - onTapUp would never fire
  /// - The device would continue executing the press command indefinitely
  /// 
  /// Solution: onTapCancel fires when the gesture is interrupted, ensuring
  /// the release command is ALWAYS sent.
  void _handleTapCancel() {
    _release();
  }

  /// Common release logic for both TapUp and TapCancel
  void _release() {
    if (!_isPressed) return;
    
    setState(() => _isPressed = false);
    _animationController.reverse();
    
    // Always send release command to ensure device stops
    _sendCommand(widget.releaseCommand);
  }

  /// Execute the BLE command callback
  Future<void> _sendCommand(List<int> command) async {
    try {
      await widget.onCommand(command);
    } catch (e) {
      // Log error but don't crash the UI
      debugPrint('HoldActionButton: Failed to send command $command: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // MouseRegion: Enables desktop "Vue-like" experience
      // - Cursor changes to pointer (hand) on hover
      // - GestureDetector still handles mouse clicks
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      child: MouseRegion(
        cursor: widget.enabled 
            ? SystemMouseCursors.click  // Hand cursor on hover
            : SystemMouseCursors.forbidden,
        child: GestureDetector(
          // Core touch/click event handlers:
          // - Mobile: finger touch
          // - Desktop: left mouse button
          onTapDown: _handleTapDown,   // TouchDown / MouseDown -> Send pressCommand
          onTapUp: _handleTapUp,       // TouchUp / MouseUp -> Send releaseCommand
          onTapCancel: _handleTapCancel, // Edge case: drag out of bounds
          
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              // Color changes based on press state
              color: _getButtonColor(),
              borderRadius: BorderRadius.circular(widget.size / 4),
              boxShadow: _isPressed
                  ? [] // No shadow when pressed (appears "pushed in")
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
              border: Border.all(
                color: _isPressed 
                    ? widget.activeColor.withOpacity(0.8)
                    : Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: widget.size * 0.4,
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.size * 0.15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Determine button color based on state
  Color _getButtonColor() {
    if (!widget.enabled) {
      return widget.inactiveColor.withOpacity(0.5);
    }
    return _isPressed ? widget.activeColor : widget.inactiveColor;
  }
}

/// A directional pad composed of multiple HoldActionButtons
/// 
/// Provides a classic D-pad layout for directional control.
class DirectionalPad extends StatelessWidget {
  final BleCommandCallback onCommand;
  final double buttonSize;
  final bool enabled;

  const DirectionalPad({
    super.key,
    required this.onCommand,
    this.buttonSize = 70.0,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize * 3.5,
      height: buttonSize * 3.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // UP button
          Positioned(
            top: 0,
            child: HoldActionButton(
              label: 'UP',
              icon: Icons.arrow_upward,
              pressCommand: const [0x01],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // DOWN button
          Positioned(
            bottom: 0,
            child: HoldActionButton(
              label: 'DOWN',
              icon: Icons.arrow_downward,
              pressCommand: const [0x02],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // LEFT button
          Positioned(
            left: 0,
            child: HoldActionButton(
              label: 'LEFT',
              icon: Icons.arrow_back,
              pressCommand: const [0x03],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // RIGHT button
          Positioned(
            right: 0,
            child: HoldActionButton(
              label: 'RIGHT',
              icon: Icons.arrow_forward,
              pressCommand: const [0x04],
              releaseCommand: const [0x00],
              onCommand: onCommand,
              size: buttonSize,
              activeColor: Colors.blue,
              enabled: enabled,
            ),
          ),
          // Center indicator
          Container(
            width: buttonSize * 0.6,
            height: buttonSize * 0.6,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```

---
## File: ui\widgets\temperature_chart.dart
```dart
/// Temperature Chart Widget
/// 
/// Displays real-time temperature data from PhysTrigger Vest
library;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> temperatureData;
  final double currentTemperature;

  const TemperatureChart({
    super.key,
    required this.temperatureData,
    required this.currentTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF30363D),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Temperature Display
          Row(
            children: [
              const Icon(
                Icons.thermostat,
                color: Color(0xFFF0883E),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                '${currentTemperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  color: Color(0xFFF0883E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '实时温度',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Line Chart
          Expanded(
            child: temperatureData.isEmpty
                ? Center(
                    child: Text(
                      '等待温度数据...',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 5,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: const Color(0xFF30363D),
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B949E),
                                  fontSize: 10,
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 29,
                      minY: _calculateMinY(),
                      maxY: _calculateMaxY(),
                      lineBarsData: [
                        LineChartBarData(
                          spots: _buildSpots(),
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF0883E),
                              Color(0xFFDA3633),
                            ],
                          ),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF0883E).withOpacity(0.3),
                                const Color(0xFFDA3633).withOpacity(0.1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    return List.generate(
      temperatureData.length,
      (index) => FlSpot(index.toDouble(), temperatureData[index]),
    );
  }

  double _calculateMinY() {
    if (temperatureData.isEmpty) return 0;
    final min = temperatureData.reduce((a, b) => a < b ? a : b);
    return (min - 5).floorToDouble();
  }

  double _calculateMaxY() {
    if (temperatureData.isEmpty) return 50;
    final max = temperatureData.reduce((a, b) => a > b ? a : b);
    return (max + 5).ceilToDouble();
  }
}

```

---
