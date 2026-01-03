/// BLE Controller ViewModel - Complete Implementation
///
/// MVVM ViewModel layer that bridges UI with BleService.
/// Manages scanning, connection, and command state.
library;

import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/ble_service.dart';
import '../utils/byte_utils.dart';

/// ViewModel for BLE control operations
///
/// Usage with Provider:
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => BleControllerViewModel(BleServiceImpl()),
/// )
/// ```
class BleControllerViewModel extends ChangeNotifier {
  final BleService _bleService;

  // ============================================================
  // State Properties
  // ============================================================

  /// List of discovered devices from scan
  List<BleDevice> _scanResults = [];
  List<BleDevice> get scanResults => List.unmodifiable(_scanResults);

  /// Current connection state
  BleConnectionState _connectionState = BleConnectionState.disconnected;
  BleConnectionState get connectionState => _connectionState;

  /// Currently connected device
  BleDevice? _connectedDevice;
  BleDevice? get connectedDevice => _connectedDevice;

  /// Whether a scan is in progress
  bool _isScanning = false;
  bool get isScanning => _isScanning;

  /// Convenience getter for connection status
  bool get isConnected => _connectionState == BleConnectionState.connected;
  bool get isConnecting => _connectionState == BleConnectionState.connecting;

  /// Last error message (for UI display)
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  /// Last sent command (for debug display)
  List<int>? _lastSentCommand;
  List<int>? get lastSentCommand => _lastSentCommand;
  String get lastSentCommandHex =>
      _lastSentCommand != null ? bytesToHexString(_lastSentCommand!) : '--';

  // ============================================================
  // Stream Subscriptions (must be disposed!)
  // ============================================================

  StreamSubscription<BleConnectionState>? _connectionStateSubscription;
  StreamSubscription<BleDevice>? _scanSubscription;
  Timer? _scanTimeoutTimer;

  // ============================================================
  // Constructor & Initialization
  // ============================================================

  BleControllerViewModel(this._bleService) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await _bleService.initialize();

      // Subscribe to connection state changes from service
      _connectionStateSubscription =
          _bleService.connectionStateStream.listen((state) {
        _connectionState = state;

        if (state == BleConnectionState.connected) {
          _connectedDevice = _bleService.connectedDevice;
          _errorMessage = null;
        } else if (state == BleConnectionState.disconnected) {
          _connectedDevice = null;
        }

        notifyListeners();
      });
    } on BleConnectionException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
    }
  }

  // ============================================================
  // Scanning
  // ============================================================

  /// Start scanning for BLE devices
  ///
  /// - Clears previous results
  /// - Auto-stops after 5 seconds
  /// - Filters for devices with Service UUID FFE0
  Future<void> startScan() async {
    if (_isScanning) return;

    _isScanning = true;
    _scanResults = [];
    _errorMessage = null;
    notifyListeners();

    try {
      // Start the scan stream
      _scanSubscription = _bleService
          .scan(
        serviceUuids: [BleUuids.serviceUuidShort],
        timeout: const Duration(seconds: 5),
      )
          .listen(
        (device) {
          // Avoid duplicates by checking device ID
          if (!_scanResults.any((d) => d.id == device.id)) {
            _scanResults.add(device);
            notifyListeners();
          }
        },
        onError: (error) {
          _errorMessage = error.toString();
          _isScanning = false;
          notifyListeners();
        },
        onDone: () {
          _isScanning = false;
          notifyListeners();
        },
      );

      // Auto-stop after 5 seconds as safety net
      _scanTimeoutTimer = Timer(const Duration(seconds: 5), () {
        stopScan();
      });
    } catch (e) {
      _errorMessage = e.toString();
      _isScanning = false;
      notifyListeners();
    }
  }

  /// Stop the current scan
  Future<void> stopScan() async {
    _scanTimeoutTimer?.cancel();
    _scanTimeoutTimer = null;

    await _scanSubscription?.cancel();
    _scanSubscription = null;

    await _bleService.stopScan();

    _isScanning = false;
    notifyListeners();
  }

  // ============================================================
  // Connection
  // ============================================================

  /// Connect to a discovered device
  Future<bool> connect(BleDevice device) async {
    _errorMessage = null;
    notifyListeners();

    try {
      await _bleService.connect(device.id);
      return true;
    } on BleConnectionException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      return false;
    }
  }

  /// Disconnect from the current device
  Future<void> disconnect() async {
    _errorMessage = null;
    try {
      await _bleService.disconnect();
    } on BleConnectionException catch (e) {
      _errorMessage = e.message;
    }
    notifyListeners();
  }

  // ============================================================
  // Command Sending
  // ============================================================

  /// Send raw bytes to the connected device
  ///
  /// This is the core method called by HoldActionButton.
  /// Updates [lastSentCommand] for debug display.
  Future<void> sendCommand(List<int> bytes) async {
    if (!isConnected) {
      debugPrint('BleControllerViewModel: Cannot send - not connected');
      return;
    }

    try {
      validateBytes(bytes);

      await _bleService.writeBytes(
        BleUuids.serviceUuidShort,
        BleUuids.characteristicUuidShort,
        bytes,
      );

      _lastSentCommand = bytes;
      _errorMessage = null;
      notifyListeners();

      debugPrint('BleControllerViewModel: Sent ${bytesToHexString(bytes)}');
    } on BleWriteException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
    }
  }

  /// Convenience: Send forward command
  Future<void> forward() => sendCommand(BleCommands.forward);

  /// Convenience: Send backward command
  Future<void> backward() => sendCommand(BleCommands.backward);

  /// Convenience: Send left command
  Future<void> left() => sendCommand(BleCommands.left);

  /// Convenience: Send right command
  Future<void> right() => sendCommand(BleCommands.right);

  /// Convenience: Send stop command
  Future<void> stop() => sendCommand(BleCommands.stop);

  // ============================================================
  // Lifecycle - CRITICAL: Dispose subscriptions to prevent leaks!
  // ============================================================

  @override
  void dispose() {
    // Cancel all stream subscriptions
    _connectionStateSubscription?.cancel();
    _scanSubscription?.cancel();
    _scanTimeoutTimer?.cancel();

    // Dispose the underlying service
    _bleService.dispose();

    super.dispose();
  }
}
