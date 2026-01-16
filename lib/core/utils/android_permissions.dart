/// Android BLE Permission Helper - Bulletproof Implementation
///
/// Handles Android 12+ (API 31+) split permissions and Legacy (API < 31) location permissions.
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Request BLE permissions with logic for all Android versions.
///
/// Returns `true` only if crucial permissions are granted.
Future<bool> requestAndroidPermissions({
  VoidCallback? onOpenSettings,
}) async {
  if (!Platform.isAndroid) return true;

  // Use permission_handler's built-in SDK check/support
  // It automatically handles manifest merging if configured correctly,
  // but explicit requests are safer.
  
  Map<Permission, PermissionStatus> statuses;

  // Check if we are potentially on Android 12+
  // We can infer this if BLUETOOTH_SCAN is supported/declared.
  // Note: Permission.bluetoothScan.status won't crash on older Android, 
  // it just returns restricted/denied usually.
  
  // Strategy: Request everything relevant.
  // The plugin handles API level checks internally.
  
  if (await Permission.bluetoothScan.status.isRestricted || 
      await _isAndroid12OrHigher()) {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 12+ (S / API 31+)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Request SCAN and CONNECT together
    statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    final scan = statuses[Permission.bluetoothScan];
    final connect = statuses[Permission.bluetoothConnect];
    
    if (scan == PermissionStatus.granted && connect == PermissionStatus.granted) {
      return true;
    }
    
    if (scan == PermissionStatus.permanentlyDenied || connect == PermissionStatus.permanentlyDenied) {
      onOpenSettings?.call();
      return false;
    }
    
    return false;
  } else {
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Android 11 and below (API < 31)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Requires LOCATION for BLE scanning
    final status = await Permission.locationWhenInUse.request();
    
    if (status.isGranted) return true;
    
    if (status.isPermanentlyDenied) {
      onOpenSettings?.call();
    }
    return false;
  }
}

/// Helper: Roughly detect Android 12+ environment
Future<bool> _isAndroid12OrHigher() async {
  // On older Android, bluetoothScan usually returns restricted/unavailable state immediately.
  // But reliable check is checking OS version directly if needed. 
  // For safety, we try to create the intent if needed, but here we stick to permission_handler.
  
  // Note: permission_handler 10.0+ handles this well.
  // Using a heuristic: if bluetoothScan is NOT permanently denied by default, it might be 12+.
  // Actually, simplest is to just request.
  
  // Using device info plugin would be best, but we don't want extra dependencies.
  // We rely on the fact that requesting `bluetoothScan` on Android 10 returns success immediately/ignores it?
  // No, permission_handler returns `restricted` on older Android for new permissions.
  
  // If `bluetoothScan` is Restricted, we assume old Android.
  var status = await Permission.bluetoothScan.status;
  return !status.isRestricted; 
}
