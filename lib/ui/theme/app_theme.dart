/// App Theme Definitions
///
/// Provides Light and Dark theme configurations for Material 3.
library;

import 'package:flutter/material.dart';

/// Centralized theme definitions for the app.
abstract class AppTheme {
  // ═══════════════════════════════════════════════════════════════════════════
  // Color Palette
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary brand color (Orange)
  static const Color primary = Color(0xFFF0883E);

  /// Accent color (Blue)
  static const Color accent = Color(0xFF58A6FF);

  /// Success color (Green)
  static const Color success = Color(0xFF238636);

  /// Error color (Red)
  static const Color error = Color(0xFFDA3633);

  // ═══════════════════════════════════════════════════════════════════════════
  // Light Theme
  // ═══════════════════════════════════════════════════════════════════════════

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: 'Segoe UI',

        // Colors
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        colorScheme: const ColorScheme.light(
          primary: primary,
          secondary: accent,
          tertiary: success,
          error: error,
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF1C1C1E),
          onPrimary: Colors.white,
          surfaceContainerHighest: Color(0xFFE5E5EA), // surfaceVariant replacement
        ),

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          foregroundColor: Color(0xFF1C1C1E),
          elevation: 0,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
        ),

        // Cards
        cardTheme: CardThemeData(
          color: const Color(0xFFFFFFFF),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          surfaceTintColor: Colors.transparent,
        ),

        // Elevated Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),

        // Slider
        sliderTheme: const SliderThemeData(
          activeTrackColor: primary,
          inactiveTrackColor: Color(0xFFE5E5EA),
          thumbColor: primary,
          overlayColor: Color(0x33F0883E),
          valueIndicatorColor: primary,
        ),

        // Divider
        dividerTheme: const DividerThemeData(
          color: Color(0xFFE5E5EA),
          thickness: 1,
        ),
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // Dark Theme
  // ═══════════════════════════════════════════════════════════════════════════

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: 'Segoe UI',

        // Colors
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: accent,
          tertiary: success,
          error: error,
          surface: Color(0xFF161B22),
          onSurface: Color(0xFFE6EDF3),
          onPrimary: Colors.black,
          surfaceContainerHighest: Color(0xFF21262D), // surfaceVariant replacement
        ),

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161B22),
          foregroundColor: Color(0xFFE6EDF3),
          elevation: 0,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
        ),

        // Cards
        cardTheme: CardThemeData(
          color: const Color(0xFF161B22),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFF30363D)),
          ),
          surfaceTintColor: Colors.transparent,
        ),

        // Elevated Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),

        // Slider
        sliderTheme: const SliderThemeData(
          activeTrackColor: primary,
          inactiveTrackColor: Color(0xFF30363D),
          thumbColor: primary,
          overlayColor: Color(0x33F0883E),
          valueIndicatorColor: primary,
        ),

        // Divider
        dividerTheme: const DividerThemeData(
          color: Color(0xFF30363D),
          thickness: 1,
        ),
      );
}
