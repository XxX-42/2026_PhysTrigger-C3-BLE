/// Theme Provider for Light/Dark Mode Management
///
/// Manages theme state with SharedPreferences persistence.
library;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides theme mode state with persistence.
class ThemeProvider extends ChangeNotifier {
  static const String _prefsKey = 'theme_mode';

  ThemeMode _themeMode = ThemeMode.system;

  /// Current theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Whether dark mode is currently active.
  bool get isDark => _themeMode == ThemeMode.dark;

  /// Load saved theme preference from SharedPreferences.
  Future<void> loadPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedMode = prefs.getString(_prefsKey);

      if (savedMode != null) {
        _themeMode = _parseThemeMode(savedMode);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('ThemeProvider: Failed to load preference: $e');
    }
  }

  /// Toggle between light and dark mode.
  ///
  /// [isDark] - true for dark mode, false for light mode.
  Future<void> toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, _themeMode.name);
    } catch (e) {
      debugPrint('ThemeProvider: Failed to save preference: $e');
    }
  }

  /// Set theme mode directly.
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, mode.name);
    } catch (e) {
      debugPrint('ThemeProvider: Failed to save preference: $e');
    }
  }

  ThemeMode _parseThemeMode(String value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}
