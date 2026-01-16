/// Domain models for BLE service and characteristic discovery results.
///
/// These models abstract away the underlying BLE library's data structures,
/// providing a clean interface for the UI layer.
library;

import 'package:flutter/foundation.dart';

/// Represents a discovered BLE service.
@immutable
class BleServiceInfo {
  /// Service UUID (typically in 128-bit or 16-bit format).
  final String uuid;

  /// List of characteristics discovered within this service.
  final List<BleCharacteristicInfo> characteristics;

  const BleServiceInfo({
    required this.uuid,
    this.characteristics = const [],
  });

  /// Find a characteristic by UUID.
  BleCharacteristicInfo? findCharacteristic(String characteristicUuid) {
    final normalizedUuid = characteristicUuid.toLowerCase();
    return characteristics.cast<BleCharacteristicInfo?>().firstWhere(
          (c) => c!.uuid.toLowerCase() == normalizedUuid,
          orElse: () => null,
        );
  }

  @override
  String toString() =>
      'BleServiceInfo(uuid: $uuid, characteristics: ${characteristics.length})';
}

/// Represents a discovered BLE characteristic.
@immutable
class BleCharacteristicInfo {
  /// Characteristic UUID.
  final String uuid;

  /// Whether this characteristic supports read operations.
  final bool canRead;

  /// Whether this characteristic supports write with response.
  final bool canWrite;

  /// Whether this characteristic supports write without response.
  final bool canWriteWithoutResponse;

  /// Whether this characteristic supports notifications.
  final bool canNotify;

  /// Whether this characteristic supports indications.
  final bool canIndicate;

  const BleCharacteristicInfo({
    required this.uuid,
    this.canRead = false,
    this.canWrite = false,
    this.canWriteWithoutResponse = false,
    this.canNotify = false,
    this.canIndicate = false,
  });

  /// Whether any write operation is supported.
  bool get isWriteable => canWrite || canWriteWithoutResponse;

  /// Whether any subscription mode is supported.
  bool get isSubscribable => canNotify || canIndicate;

  @override
  String toString() => 'BleCharacteristicInfo(uuid: $uuid, '
      'read: $canRead, write: $canWrite, notify: $canNotify)';
}
