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
  // Physics Safety Engine State
  // ═══════════════════════════════════════════════════════════════════════════

  /// Previous temperature reading for derivative calculation.
  double _prevTemp = 0.0;

  /// 1st Derivative: Temperature velocity (°C/s).
  double _prevVelocity = 0.0;

  /// Last temperature update timestamp.
  DateTime? _lastUpdateTime;

  /// Safety lockout flag - prevents heating after fault.
  bool _isSafetyLockout = false;

  /// Current PWM value for decoupling detection.
  int _currentPwmValue = 0;

  /// Duration with PWM>80% but no temperature rise (for Rule 3).
  Duration _noRiseDuration = Duration.zero;

  // Safety thresholds
  static const double _maxTemperature = 55.0;        // °C absolute limit
  static const double _maxAcceleration = 2.0;        // °C/s² runaway threshold
  static const double _minUpdateInterval = 0.1;      // seconds (noise filter)
  static const Duration _decouplingTimeout = Duration(seconds: 10);

  /// Whether safety lockout is active (exposed for UI).
  bool get isSafetyLockout => _isSafetyLockout;

  // ═══════════════════════════════════════════════════════════════════════════
  // Software Thermostat State
  // ═══════════════════════════════════════════════════════════════════════════

  /// Whether thermostat auto-control is active.
  bool _isThermostatActive = false;

  /// Target temperature for thermostat control.
  double _targetTemperature = 45.0;

  /// Last PWM value sent by thermostat (to avoid BLE spam).
  int _lastThermostatPwm = -1;

  /// Expose thermostat state to UI.
  bool get isThermostatActive => _isThermostatActive;
  double get targetTemperature => _targetTemperature;

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

    // Listen to data received (notifications) with Physics Safety Engine
    _dataReceivedSubscription = _bleService.dataReceived.listen((data) {
      if (data.isNotEmpty) {
        final temp = parseTemperature(data);
        if (temp > 0) {
          final now = DateTime.now();
          
          // Calculate derivatives if we have previous data
          if (_lastUpdateTime != null) {
            final dt = now.difference(_lastUpdateTime!).inMilliseconds / 1000.0;
            
            // Filter noise: only calculate if sufficient time passed
            if (dt >= _minUpdateInterval) {
              final velocity = (temp - _prevTemp) / dt;
              final acceleration = (velocity - _prevVelocity) / dt;
              
              // ⚠️ CRITICAL: Check safety BEFORE processing
              _executeSafetyChecks(temp, velocity, acceleration);
              
              // Update physics state
              _prevVelocity = velocity;
            }
          }
          
          // Update state
          _prevTemp = temp;
          _lastUpdateTime = now;
          _currentTemperature = temp;
          _temperatureHistory.add(temp);
          
          if (_temperatureHistory.length > 30) {
            _temperatureHistory.removeAt(0);
          }
          
          // Software Thermostat Control Loop
          if (_isThermostatActive && !_isSafetyLockout) {
            _executeThermostatControl(temp);
          }
          
          notifyListeners();
        }
      }
    });
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Physics Safety Engine
  // ═══════════════════════════════════════════════════════════════════════════

  /// Trigger emergency stop and lock out heating.
  void _triggerEmergencyStop(String reason) {
    debugPrint('🚨 EMERGENCY STOP: $reason');
    _isSafetyLockout = true;
    _errorMessage = reason;
    
    // Immediately cut power - bypass lockout check
    _emergencyWriteZero();
    
    notifyListeners();
  }

  /// Direct write of 0% - bypasses lockout for emergency use.
  Future<void> _emergencyWriteZero() async {
    if (!isConnected) return;
    try {
      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: [0],
        withResponse: false,
      );
      _currentPwmValue = 0;
      _lastSentCommand = [0];
      debugPrint('BleControllerViewModel: Emergency PWM=0 sent');
    } catch (e) {
      debugPrint('BleControllerViewModel: Emergency write failed: $e');
    }
  }

  /// Execute safety checks on temperature derivatives.
  /// 
  /// Rules:
  /// 1. Absolute Threshold: temp > 55°C
  /// 2. Acceleration Threshold: > 2°C/s² (runaway detection)
  /// 3. Decoupling Detection: PWM>80% but velocity<=0 for 10s
  void _executeSafetyChecks(double temp, double velocity, double acceleration) {
    // Already in lockout - skip checks
    if (_isSafetyLockout) return;

    // Rule 1: Absolute Temperature Threshold
    if (temp > _maxTemperature) {
      _triggerEmergencyStop('🔥 过热保护：温度超过 ${_maxTemperature.toInt()}°C');
      return;
    }
    
    // Rule 2: Acceleration Threshold (runaway/dry fire detection)
    if (acceleration > _maxAcceleration) {
      _triggerEmergencyStop('⚠️ 升温加速度异常：疑似干烧或热失控');
      return;
    }
    
    // Rule 3: Sensor Decoupling (high PWM but no temp rise)
    if (_currentPwmValue > 80 && velocity <= 0) {
      _noRiseDuration += const Duration(milliseconds: 500); // approx update interval
      if (_noRiseDuration >= _decouplingTimeout) {
        _triggerEmergencyStop('⚠️ 传感器可能已脱落');
        return;
      }
    } else {
      _noRiseDuration = Duration.zero;
    }
  }

  /// Reset safety lockout (requires manual acknowledgment).
  void resetSafetyLockout() {
    _isSafetyLockout = false;
    _noRiseDuration = Duration.zero;
    _errorMessage = null;
    debugPrint('BleControllerViewModel: Safety lockout reset');
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Software Thermostat Control
  // ═══════════════════════════════════════════════════════════════════════════

  /// Enable thermostat with target temperature.
  void enableThermostat(double target) {
    _targetTemperature = target.clamp(30.0, 60.0); // Safe range (below 55°C safety limit)
    _isThermostatActive = true;
    _lastThermostatPwm = -1; // Reset to force first command
    debugPrint('Thermostat: Enabled, target=$_targetTemperature°C');
    notifyListeners();
  }

  /// Disable thermostat auto-control.
  void disableThermostat() {
    if (!_isThermostatActive) return;
    _isThermostatActive = false;
    debugPrint('Thermostat: Disabled');
    notifyListeners();
  }

  /// Execute bang-bang thermostat control with hysteresis.
  void _executeThermostatControl(double currentTemp) {
    int targetPwm;
    
    // Bang-bang control with 1°C hysteresis
    if (currentTemp < _targetTemperature - 1.0) {
      targetPwm = 100; // Full heat - below target
    } else if (currentTemp > _targetTemperature) {
      targetPwm = 0; // Stop heat - above target
    } else {
      targetPwm = 30; // Maintenance mode - near target
    }
    
    // Only send if PWM changed (avoid BLE spam)
    if (targetPwm != _lastThermostatPwm) {
      _lastThermostatPwm = targetPwm;
      _internalWritePwm(targetPwm);
      debugPrint('Thermostat: ${currentTemp.toStringAsFixed(1)}°C → PWM $targetPwm%');
    }
  }

  /// Internal PWM write for thermostat (bypasses thermostat disable).
  Future<void> _internalWritePwm(int percentage) async {
    if (!isConnected || _isSafetyLockout) return;
    
    _currentPwmValue = percentage;
    
    try {
      await _bleService.writeBytes(
        serviceUuid: BleUuids.serviceUuid,
        characteristicUuid: BleUuids.characteristicUuid,
        data: [percentage],
        withResponse: false,
      );
      _lastSentCommand = [percentage];
    } catch (e) {
      debugPrint('Thermostat write failed: $e');
    }
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
        
        // Auto-subscribe to Temperature Characteristic
        try {
          debugPrint('BleControllerViewModel: Auto-subscribing to temperature data...');
          await subscribeToNotifications(
            serviceUuid: BleUuids.serviceUuid,
            characteristicUuid: BleUuids.tempCharacteristicUuid,
          );
          debugPrint('BleControllerViewModel: Temperature subscription successful ✅');
        } catch (e) {
          // Log warning but do not fail the connection
          debugPrint('BleControllerViewModel: Warning: Failed to subscribe to temperature: $e');
        }
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
  /// Blocked if safety lockout is active.
  Future<void> writeSliderValue(int percentage) async {
    // Manual control overrides thermostat
    if (_isThermostatActive) {
      disableThermostat();
    }
    
    // Track PWM for decoupling detection
    _currentPwmValue = percentage;

    // Block heating during safety lockout
    if (_isSafetyLockout && percentage > 0) {
      debugPrint('BleControllerViewModel: Blocked by safety lockout');
      return;
    }

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
