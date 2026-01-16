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

  Future<void> _startConnection(BleControllerViewModel viewModel) async {
    setState(() => _isConnecting = true);
    
    // Clear any previous error before starting
    viewModel.clearError();
    
    // Start scan
    viewModel.startScan();
    
    // Poll for PhysTrigger device every 500ms
    _scanTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
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
        // CRITICAL: Cancel timer IMMEDIATELY before any async work
        // to prevent multiple connection attempts or late state updates
        timer.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        
        debugPrint('[DeviceScanPage] Connecting to: ${targetDevice.name} [${targetDevice.id}]');
        
        // Await the connection result and handle failure immediately
        final success = await viewModel.connect(targetDevice);
        
        // Check mounted before setState to prevent dispose crash
        if (mounted) {
          setState(() => _isConnecting = false);
        }
        
        if (!success && mounted) {
          // Show SnackBar immediately on failure
          final errorMsg = viewModel.errorMessage ?? 'Connection failed';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(child: Text(errorMsg)),
                ],
              ),
              backgroundColor: const Color(0xFFDA3633),
              duration: const Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: '重试',
                textColor: Colors.white,
                onPressed: () => _startConnection(viewModel),
              ),
            ),
          );
        }
      }
    });
    
    // Timeout after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (_scanTimer?.isActive ?? false) {
        _scanTimer?.cancel();
        _scanTimer = null;
        viewModel.stopScan();
        
        // Check mounted before setState to prevent dispose crash
        if (mounted) {
          setState(() => _isConnecting = false);
        }
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.bluetooth_disabled, color: Colors.white),
                  SizedBox(width: 8),
                  Text('未找到 PhysTrigger 设备'),
                ],
              ),
              backgroundColor: const Color(0xFFDA3633),
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: '重试',
                textColor: Colors.white,
                onPressed: () => _startConnection(viewModel),
              ),
            ),
          );
        }
      }
    });
  }
}
