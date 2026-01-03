import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:win_ble/win_ble.dart';
import 'package:win_ble/win_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize win_ble for Windows
  await WinBle.initialize(serverPath: await WinServer.path());
  
  runApp(const PhysTriggerApp());
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhysTrigger',
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
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // Windows BLE state
  String? targetDeviceAddress;
  String? targetDeviceName;
  bool isConnected = false;
  String? targetCharacteristicId;
  
  bool isScanning = false;
  String statusMessage = 'Ready to connect';

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  
  StreamSubscription? _scanSubscription;
  StreamSubscription? _connectionSubscription;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    
    // Listen for connection state changes
    _connectionSubscription = WinBle.connectionStreamOf(targetDeviceAddress ?? '').listen((event) {
      debugPrint('[BLE] Connection state: $event');
      if (mounted) {
        setState(() {
          isConnected = event;
          if (!event) {
            statusMessage = 'Disconnected';
            targetCharacteristicId = null;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scanSubscription?.cancel();
    _connectionSubscription?.cancel();
    WinBle.dispose();
    super.dispose();
  }

  void startScan() async {
    setState(() {
      isScanning = true;
      statusMessage = 'Scanning for devices...';
      targetDeviceAddress = null;
      targetDeviceName = null;
    });
    _pulseController.repeat(reverse: true);

    try {
      // Start BLE scan
      WinBle.startScanning();
      
      // Listen for scan results
      _scanSubscription = WinBle.scanStream.listen((device) {
        debugPrint('[SCAN] Found: ${device.name} (${device.address})');
        
        final name = device.name;
        final address = device.address;
        
        // Match by name OR by MAC address
        if (name == "PhysTrigger_Device" || 
            name.contains("PhysTrigger") ||
            address.toUpperCase().contains("1C:DB:D4:E0:A6:AE") ||
            address.toUpperCase().replaceAll(':', '').contains("1CDBD4E0A6AE")) {
          
          WinBle.stopScanning();
          _scanSubscription?.cancel();
          
          setState(() {
            targetDeviceAddress = address;
            targetDeviceName = name.isNotEmpty ? name : 'PhysTrigger_Device';
            statusMessage = 'Device found! Tap to connect.';
            isScanning = false;
          });
          
          _pulseController.stop();
          _pulseController.reset();
        }
      });
      
      // Timeout after 10 seconds
      await Future.delayed(const Duration(seconds: 10));
      
      if (targetDeviceAddress == null && mounted) {
        WinBle.stopScanning();
        _scanSubscription?.cancel();
        setState(() {
          statusMessage = 'No device found. Try again.';
          isScanning = false;
        });
        _pulseController.stop();
        _pulseController.reset();
      }
    } catch (e) {
      debugPrint('[ERROR] Scan failed: $e');
      if (mounted) {
        setState(() {
          statusMessage = 'Scan error: $e';
          isScanning = false;
        });
      }
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  Future<void> connect() async {
    if (targetDeviceAddress == null) return;
    
    setState(() => statusMessage = 'Connecting...');
    
    try {
      // Connect to device
      await WinBle.connect(targetDeviceAddress!);
      
      setState(() {
        isConnected = true;
        statusMessage = 'Connected! Discovering services...';
      });
      
      // Discover services
      List<dynamic> services = await WinBle.discoverServices(targetDeviceAddress!);
      debugPrint('[BLE] Services: $services');
      
      for (var serviceId in services) {
        debugPrint('[BLE] Service: $serviceId');
        
        // Look for our target service - exact 128-bit UUID match
        if (serviceId.toString().toLowerCase() == '4fafc201-1fb5-459e-8fcc-c5c9c331914b') {
          // Discover characteristics
          List<dynamic> characteristics = await WinBle.discoverCharacteristics(
            address: targetDeviceAddress!,
            serviceId: serviceId.toString(),
          );
          
          for (var char in characteristics) {
            debugPrint('[BLE] Characteristic: ${char.uuid}');
            if (char.uuid.toString().toLowerCase() == 'beb5483e-36e1-4688-b7f5-ea07361b26a8') {
              setState(() {
                targetCharacteristicId = char.uuid.toString();
                statusMessage = 'Connected! Ready to control.';
              });
              break;
            }
          }
        }
      }
      
      if (targetCharacteristicId == null && mounted) {
        setState(() {
          statusMessage = 'Connected but characteristic not found.';
        });
      }
    } catch (e) {
      debugPrint('[ERROR] Connection failed: $e');
      if (mounted) {
        setState(() {
          statusMessage = 'Connection failed: $e';
          isConnected = false;
        });
      }
    }
  }

  // BLE Command Constants - Raw hex bytes matching ESP32 firmware expectations
  static const List<int> CMD_PRESS = [0x01];
  static const List<int> CMD_RELEASE = [0x00];

  void sendCmd(bool press) async {
    if (targetDeviceAddress == null || targetCharacteristicId == null) return;
    
    final command = press ? CMD_PRESS : CMD_RELEASE;
    
    try {
      // Write raw byte command to characteristic
      // writeWithResponse: true = ACK required for reliability
      await WinBle.write(
        address: targetDeviceAddress!,
        service: "4fafc201-1fb5-459e-8fcc-c5c9c331914b", // ESP32 Service UUID
        characteristic: targetCharacteristicId!,
        data: Uint8List.fromList(command),
        writeWithResponse: false, // No ACK wait for faster response
      );
      debugPrint('[BLE] Sent command: ${press ? "PRESS (0x01)" : "RELEASE (0x00)"}');
    } on StateError catch (e) {
      // Handle disconnection during write
      debugPrint('[ERROR] Device disconnected during write: $e');
      if (mounted) {
        setState(() {
          isConnected = false;
          targetCharacteristicId = null;
          statusMessage = 'Device disconnected. Please reconnect.';
        });
      }
    } catch (e) {
      debugPrint('[ERROR] Write failed: $e');
      if (mounted) {
        setState(() {
          statusMessage = 'Write error: ${e.toString()}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    // Show control panel when connected with characteristic
    if (isConnected && targetCharacteristicId != null) {
      return _buildControlCard();
    }

    // Show connect button when device found
    if (targetDeviceAddress != null && !isConnected) {
      return _buildConnectCard();
    }

    // Default: Show scan card
    return _buildScanCard();
  }

  /// Main Action Card - Scan for device
  Widget _buildScanCard() {
    return Card(
      elevation: 12,
      shadowColor: const Color(0xFF58A6FF).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: const Color(0xFF30363D).withOpacity(0.8),
          width: 1,
        ),
      ),
      color: const Color(0xFF161B22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Large Bluetooth Icon with glow effect
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: isScanning ? _pulseAnimation.value : 1.0,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF58A6FF).withOpacity(0.3),
                          const Color(0xFF58A6FF).withOpacity(0.05),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF58A6FF),
                              Color(0xFF1F6FEB),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF58A6FF).withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.bluetooth,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // Headline
            const Text(
              'Connect to PhysTrigger',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Subtitle
            Text(
              'Scan for your ESP32 device to start controlling.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.6),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Status indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF21262D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isScanning
                          ? const Color(0xFFF0883E)
                          : const Color(0xFF8B949E),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      statusMessage,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Start Scanning Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isScanning ? null : startScan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF238636),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF238636).withOpacity(0.5),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isScanning)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    else
                      const Icon(Icons.search, size: 22),
                    const SizedBox(width: 10),
                    Text(
                      isScanning ? 'Scanning...' : 'Start Scanning',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Connect Card - Device found, tap to connect
  Widget _buildConnectCard() {
    return Card(
      elevation: 12,
      shadowColor: const Color(0xFF238636).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: const Color(0xFF238636).withOpacity(0.5),
          width: 1,
        ),
      ),
      color: const Color(0xFF161B22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF238636),
                    Color(0xFF2EA043),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF238636).withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.bluetooth_connected,
                size: 40,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Device Found!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              targetDeviceName ?? 'PhysTrigger_Device',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            
            const SizedBox(height: 4),
            
            Text(
              targetDeviceAddress ?? '',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Colors.white.withOpacity(0.4),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: connect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF238636),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.link, size: 22),
                    SizedBox(width: 10),
                    Text(
                      'Connect Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Control Card - Connected and ready to use
  Widget _buildControlCard() {
    return Card(
      elevation: 12,
      shadowColor: const Color(0xFF238636).withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: const Color(0xFF238636).withOpacity(0.5),
          width: 1,
        ),
      ),
      color: const Color(0xFF161B22),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Connected status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF238636).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF238636).withOpacity(0.5),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Color(0xFF3FB950),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Connected',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3FB950),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'PhysTrigger Control',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 32),

            // Large trigger button
            GestureDetector(
              onLongPressStart: (_) => sendCmd(true),
              onLongPressEnd: (_) => sendCmd(false),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF58A6FF),
                      Color(0xFF1F6FEB),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF58A6FF).withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app,
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'HOLD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Press and hold to trigger',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
