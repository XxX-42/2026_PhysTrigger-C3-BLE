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

  /// AppBar with connection status badge and theme toggle
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AppBar(
      title: const Text(
        'PhysTrigger Heating Vest',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        // Theme Toggle Button
        IconButton(
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          tooltip: isDark ? '切换至浅色模式' : '切换至深色模式',
          onPressed: () => themeProvider.toggleTheme(!isDark),
        ),
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
            ] else if (viewModel.errorMessage case String msg) ...[
              Text(
                msg,
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
        Text(
          '加热强度',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
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
                  Theme.of(context).colorScheme.surface,
                  const Color(0xFFF0883E),
                  _currentValue / 100,
                )!,
                Theme.of(context).colorScheme.surface,
              ],
            ),
            border: Border.all(
              color: Color.lerp(
                Theme.of(context).colorScheme.outlineVariant,
                const Color(0xFFF0883E),
                _currentValue / 100,
              )!,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              '${_currentValue.toInt()}%',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
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
            // Different colors when thermostat is active
            activeTrackColor: viewModel.isThermostatActive 
                ? const Color(0xFF58A6FF) 
                : const Color(0xFFF0883E),
            inactiveTrackColor: viewModel.isThermostatActive 
                ? Theme.of(context).colorScheme.surfaceContainerHighest 
                : Theme.of(context).colorScheme.outlineVariant,
            thumbColor: viewModel.isThermostatActive 
                ? const Color(0xFF58A6FF) 
                : const Color(0xFFF0883E),
            overlayColor: viewModel.isThermostatActive 
                ? const Color(0xFF58A6FF).withOpacity(0.2) 
                : const Color(0xFFF0883E).withOpacity(0.2),
            valueIndicatorColor: viewModel.isThermostatActive 
                ? const Color(0xFF58A6FF) 
                : const Color(0xFFF0883E),
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
            label: viewModel.isThermostatActive 
                ? '🌡️ 自动' 
                : '${_currentValue.toInt()}%',
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
            onChangeEnd: (value) {
              // Send to BLE when user finishes adjusting
              // This will also disable thermostat via writeSliderValue
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
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '50%',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            Text(
              '100%',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Smart Thermostat Mode Label
        Text(
          '智能恒温模式',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.54),
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),

        // 3-Preset Thermostat Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ThermostatButton(temp: 40.0, viewModel: viewModel),
            _ThermostatButton(temp: 50.0, viewModel: viewModel),
            _ThermostatButton(temp: 60.0, viewModel: viewModel),
          ],
        ),

        // Thermostat Active Indicator
        if (viewModel.isThermostatActive)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.thermostat_auto, color: Color(0xFFF0883E), size: 16),
                const SizedBox(width: 8),
                Text(
                  '恒温中... 滑动滑块可手动关闭',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

        const SizedBox(height: 24),

        // Last Sent Command Debug Info
        if (viewModel.lastSentCommandHex != '--')
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
        ),
        const SizedBox(height: 16),
        Text(
          '设备未连接',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            fontSize: 18,
            fontWeight: FontWeight.bold,
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

/// Helper widget for thermostat preset buttons.
class _ThermostatButton extends StatelessWidget {
  final double temp;
  final BleControllerViewModel viewModel;

  const _ThermostatButton({
    required this.temp,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    // Active if thermostat is ON AND target matches this button
    final isActive = viewModel.isThermostatActive &&
        viewModel.targetTemperature == temp;

    return ElevatedButton(
      onPressed: () => viewModel.enableThermostat(temp),
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? const Color(0xFFF0883E)
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        foregroundColor: isActive 
            ? Colors.black 
            : Theme.of(context).colorScheme.onSurface,
        side: BorderSide(
          color: isActive 
              ? const Color(0xFFF0883E) 
              : Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        elevation: isActive ? 4 : 0,
      ),
      child: Text(
        '${temp.toInt()}°C',
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
