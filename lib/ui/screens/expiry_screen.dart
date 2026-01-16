/// Expiry Screen - License Expired UI
///
/// Professional screen shown when the trial license has expired.
library;

import 'package:flutter/material.dart';

import '../../core/services/security_service.dart';

/// Screen displayed when application license has expired.
class ExpiryScreen extends StatelessWidget {
  const ExpiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Warning Icon
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.errorContainer,
                  ),
                  child: Icon(
                    Icons.lock_clock,
                    size: 50,
                    color: colorScheme.onErrorContainer,
                  ),
                ),

                const SizedBox(height: 32),

                // Title
                Text(
                  '授权已过期',
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Message
                Text(
                  '当前版本为测试交付版，授权已过期。\n请联系开发者获取正式版授权。',
                  style: TextStyle(
                    color: colorScheme.onSurface.withOpacity(0.7),
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // Expiry Date Info
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '授权截止日期: ${SecurityService().expiryDateString}',
                    style: TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.6),
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),

                const Spacer(),

                // Footer
                Column(
                  children: [
                    Text(
                      '乐山市欣欣艺术职业高中',
                      style: TextStyle(
                        color: colorScheme.onSurface.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '技术支持',
                      style: TextStyle(
                        color: colorScheme.onSurface.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
