/// Byte conversion utilities for BLE communication
/// 
/// Ensures data format strictly conforms to the protocol:
/// - All data must be List<int> (Byte Array)
/// - Each element must be in range 0-255 (unsigned byte)
library;

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

/// Common command constants based on BLE Protocol Summary
/// 
/// These values correspond to the Hex commands in the protocol table:
/// | Action  | Hex  | Decimal |
/// |---------|------|---------|
/// | Stop    | 0x00 | [0]     |
/// | Forward | 0x01 | [1]     |
/// | Back    | 0x02 | [2]     |
/// | Left    | 0x03 | [3]     |
/// | Right   | 0x04 | [4]     |
abstract class BleCommands {
  static const List<int> stop = [0x00];
  static const List<int> forward = [0x01];
  static const List<int> backward = [0x02];
  static const List<int> left = [0x03];
  static const List<int> right = [0x04];
}

/// BLE UUID constants from the protocol
abstract class BleUuids {
  /// Default HM-10/ESP32 Serial Service UUID
  static const String serviceUuid = '0000FFE0-0000-1000-8000-00805F9B34FB';
  static const String serviceUuidShort = 'FFE0';
  
  /// Default Data Characteristic UUID (Read/Write/Notify)
  static const String characteristicUuid = '0000FFE1-0000-1000-8000-00805F9B34FB';
  static const String characteristicUuidShort = 'FFE1';
}
