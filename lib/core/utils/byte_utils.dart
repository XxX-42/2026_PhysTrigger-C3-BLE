/// Byte conversion utilities for BLE communication
/// 
/// Ensures data format strictly conforms to the protocol:
/// - All data must be List<int> (Byte Array)
/// - Each element must be in range 0-255 (unsigned byte)
library;

import 'dart:convert'; // For utf8 decoder
import 'package:flutter/foundation.dart';

/// Converts a single hex value to a byte list
/// 
/// Example:
/// ```dart
/// hexToByte(0x01);  // Returns [1]
/// hexToByte(0xA5);  // Returns [165]
/// hexToByte(0xFF);  // Returns [255]
/// ```
List<int> hexToByte(int hexValue) {
  assert(hexValue >= 0 && hexValue <= 255, 
    'Hex value must be in range 0x00-0xFF (0-255)');
  return [hexValue];
}

/// Converts a hex string to a byte list
/// 
/// Supports formats:
/// - "A5" or "a5" (single byte)
/// - "A5DD02" or "A5 DD 02" (multi-byte)
/// - "0xA5" or "0XA5" (with prefix)
/// 
/// Example:
/// ```dart
/// hexStringToBytes("A5DD02");     // Returns [165, 221, 2]
/// hexStringToBytes("A5 DD 02");   // Returns [165, 221, 2]
/// hexStringToBytes("0xA5");       // Returns [165]
/// ```
List<int> hexStringToBytes(String hexString) {
  // Remove common prefixes and spaces
  String cleaned = hexString
      .replaceAll('0x', '')
      .replaceAll('0X', '')
      .replaceAll(' ', '')
      .toUpperCase();
  
  // Ensure even number of characters
  if (cleaned.length % 2 != 0) {
    cleaned = '0$cleaned';
  }
  
  final List<int> bytes = [];
  for (int i = 0; i < cleaned.length; i += 2) {
    final hexPair = cleaned.substring(i, i + 2);
    final value = int.parse(hexPair, radix: 16);
    bytes.add(value);
  }
  
  return bytes;
}

/// Converts a byte list to a hex string for debugging
/// 
/// Example:
/// ```dart
/// bytesToHexString([165, 221, 2]);  // Returns "A5 DD 02"
/// ```
String bytesToHexString(List<int> bytes) {
  return bytes
      .map((b) => b.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join(' ');
}

/// Validates that all bytes are in valid range (0-255)
/// 
/// Throws [ArgumentError] if any byte is out of range
void validateBytes(List<int> bytes) {
  for (int i = 0; i < bytes.length; i++) {
    if (bytes[i] < 0 || bytes[i] > 255) {
      throw ArgumentError(
        'Byte at index $i (value: ${bytes[i]}) is out of range 0-255'
      );
    }
  }
}

/// Converts slider percentage to byte array for BLE transmission
/// 
/// ESP32 firmware expects UINT8 (0-100) directly, no conversion needed.
/// The firmware internally maps this to PWM duty cycle (0-255).
/// 
/// Example:
/// ```dart
/// sliderValueToBytes(0);    // Returns [0]   - 0% heating
/// sliderValueToBytes(50);   // Returns [50]  - 50% heating
/// sliderValueToBytes(100);  // Returns [100] - 100% heating
/// ```
List<int> sliderValueToBytes(int percentage) {
  assert(percentage >= 0 && percentage <= 100, 
    'Slider value must be in range 0-100');
  return [percentage];
}

/// BLE UUID constants for PhysTrigger Heating Vest
/// 
/// These UUIDs match the ESP32 firmware in sketch_jan3a.ino
abstract class BleUuids {
  /// PhysTrigger Heating Vest Service UUID
  static const String serviceUuid = '4fafc201-1fb5-459e-8fcc-c5c9c331914b';
  
  /// PWM Control Characteristic UUID (Write/Write No Response)
  /// Accepts UINT8 values from 0-100 representing heating intensity percentage
  static const String characteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a8';
  
  /// Temperature Notification Characteristic UUID (Read/Notify)
  /// Broadcasts temperature readings as UTF8 string (e.g., "25.82")
  static const String tempCharacteristicUuid = 'beb5483e-36e1-4688-b7f5-ea07361b26a9';
  
  /// Target device name for scanning
  static const String targetDeviceName = 'PhysTrigger_Vest';
}

/// Parse temperature from UTF8 bytes
/// 
/// ESP32 sends temperature as UTF8 string (e.g., "25.82")
/// This function converts bytes to string and parses to double
double parseTemperature(List<int> bytes) {
  try {
    final str = utf8.decode(bytes);
    return double.tryParse(str) ?? 0.0;
  } catch (e) {
    debugPrint('Temperature parse error: $e');
    return 0.0;
  }
}
