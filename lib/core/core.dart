/// Core module exports
///
/// Provides a single import point for all core functionality.
/// This barrel file exposes the public API of the core module.
library;

// ═══════════════════════════════════════════════════════════════════════════
// Interfaces (Contracts)
// ═══════════════════════════════════════════════════════════════════════════
export 'interfaces/i_ble_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Domain Models
// ═══════════════════════════════════════════════════════════════════════════
export 'models/ble_device.dart';
export 'models/ble_connection_state.dart';
export 'models/ble_service_info.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Exceptions
// ═══════════════════════════════════════════════════════════════════════════
export 'exceptions/ble_exception.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Services (Implementations)
// ═══════════════════════════════════════════════════════════════════════════
export 'services/flutter_blue_plus_service.dart';

// ═══════════════════════════════════════════════════════════════════════════
// Utilities
// ═══════════════════════════════════════════════════════════════════════════
export 'utils/byte_utils.dart';
export 'utils/result.dart';
export 'utils/android_permissions.dart';

// ═══════════════════════════════════════════════════════════════════════════
// ViewModels
// ═══════════════════════════════════════════════════════════════════════════
export 'viewmodels/ble_controller_viewmodel.dart';
