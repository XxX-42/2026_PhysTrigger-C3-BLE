/// Security Service for IP Protection
///
/// Implements expiry date check with network time verification.
library;

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Security service for license expiry management.
class SecurityService {
  /// Hardcoded expiry date - one month delivery period.
  static final DateTime expiryDate = DateTime(2026, 2, 15);

  /// Check if the application license has expired.
  ///
  /// Attempts to fetch accurate time from network API first,
  /// falls back to local device time if network unavailable.
  Future<bool> isExpired() async {
    DateTime currentDate;

    try {
      // Try to get accurate time from network
      currentDate = await _fetchNetworkTime();
    } catch (e) {
      // Fallback to device time if network fails
      if (kDebugMode) {
        debugPrint('SecurityService: Network time fetch failed, using local time');
      }
      currentDate = DateTime.now();
    }

    return currentDate.isAfter(expiryDate);
  }

  /// Fetch current time from WorldTimeAPI.
  Future<DateTime> _fetchNetworkTime() async {
    final response = await http
        .get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Shanghai'))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final dateTimeString = data['datetime'] as String;
      return DateTime.parse(dateTimeString);
    }

    throw Exception('Failed to fetch network time');
  }

  /// Get formatted expiry date string.
  String get expiryDateString {
    return '${expiryDate.year}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}';
  }
}
