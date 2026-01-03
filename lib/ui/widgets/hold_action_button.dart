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
