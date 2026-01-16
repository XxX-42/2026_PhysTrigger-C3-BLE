/// Domain model representing a discovered BLE device.
///
/// This is a pure data class with no dependencies on third-party libraries,
/// ensuring the UI layer remains decoupled from BLE implementation details.
library;

import 'package:flutter/foundation.dart';

/// Immutable representation of a discovered BLE device.
@immutable
class BleDevice {
  /// Unique identifier (MAC address on Android, UUID on iOS/Windows).
  final String id;

  /// Advertised device name (may be empty if not advertised).
  final String name;

  /// Signal strength in dBm (typically -30 to -100).
  final int rssi;

  /// List of advertised service UUIDs.
  final List<String> serviceUuids;

  /// Raw manufacturer-specific data keyed by company identifier.
  final Map<int, List<int>> manufacturerData;

  const BleDevice({
    required this.id,
    this.name = '',
    this.rssi = 0,
    this.serviceUuids = const [],
    this.manufacturerData = const {},
  });

  /// Whether this device has a valid advertised name.
  bool get hasName => name.isNotEmpty;

  /// Signal strength category based on RSSI.
  BleSignalStrength get signalStrength {
    if (rssi >= -50) return BleSignalStrength.excellent;
    if (rssi >= -60) return BleSignalStrength.good;
    if (rssi >= -70) return BleSignalStrength.fair;
    return BleSignalStrength.weak;
  }

  /// Create a copy with updated values.
  BleDevice copyWith({
    String? id,
    String? name,
    int? rssi,
    List<String>? serviceUuids,
    Map<int, List<int>>? manufacturerData,
  }) {
    return BleDevice(
      id: id ?? this.id,
      name: name ?? this.name,
      rssi: rssi ?? this.rssi,
      serviceUuids: serviceUuids ?? this.serviceUuids,
      manufacturerData: manufacturerData ?? this.manufacturerData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BleDevice && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'BleDevice(id: $id, name: $name, rssi: $rssi)';
}

/// Signal strength categories based on RSSI values.
enum BleSignalStrength {
  /// RSSI >= -50 dBm
  excellent,

  /// RSSI >= -60 dBm
  good,

  /// RSSI >= -70 dBm
  fair,

  /// RSSI < -70 dBm
  weak,
}
