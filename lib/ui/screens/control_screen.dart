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
                pressCommand: BleCommands.stop,
                releaseCommand: BleCommands.stop,
                onCommand: viewModel.sendCommand,
                size: 70,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade900,
                enabled: viewModel.isConnected,
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
