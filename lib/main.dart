/// PhysTrigger Heating Vest - Main Entry Point
///
/// Implements robust error handling via runZonedGuarded and strict initialization order.
library;

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'core/services/security_service.dart';
import 'ui/ui.dart';
import 'ui/screens/device_scan_page.dart';
import 'ui/screens/expiry_screen.dart';

/// Global flag for license expiry status.
bool _isLicenseExpired = false;

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Security Check: Verify license expiry
    final securityService = SecurityService();
    _isLicenseExpired = await securityService.isExpired();
    
    // Catch-all for Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      if (kDebugMode) {
        debugPrint('[FLUTTER ERROR] ${details.exception}');
        debugPrint('[STACK TRACE] ${details.stack}');
      }
    };

    runApp(const PhysTriggerApp());
  }, (Object error, StackTrace stack) {
    // Catch-all for async/Dart errors
    if (kDebugMode) {
      debugPrint('[FATAL APP ERROR] $error');
      debugPrint('[STACK TRACE] $stack');
    }
  });
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // If license expired, show expiry screen with minimal providers
    if (_isLicenseExpired) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) {
              final provider = ThemeProvider();
              provider.loadPreference();
              return provider;
            },
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            return MaterialApp(
              title: 'PhysTrigger - License Expired',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeProvider.themeMode,
              home: const ExpiryScreen(),
            );
          },
        ),
      );
    }

    // Normal app with full providers
    return MultiProvider(
      providers: [
        // Layer 0: Theme Provider
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) {
            final provider = ThemeProvider();
            provider.loadPreference();
            return provider;
          },
        ),

        // Layer 1: BLE Service
        Provider<IBleService>(
          create: (_) => FlutterBluePlusService(),
          dispose: (_, service) => service.dispose(),
        ),

        // Layer 2: ViewModel
        ChangeNotifierProxyProvider<IBleService, BleControllerViewModel>(
          create: (context) {
            final viewModel = BleControllerViewModel(
              context.read<IBleService>(),
            );
            viewModel.initialize();
            return viewModel;
          },
          update: (_, service, viewModel) =>
              viewModel ?? BleControllerViewModel(service),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'PhysTrigger Heating Vest',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeProvider.themeMode,
            home: const DeviceScanPage(),
          );
        },
      ),
    );
  }
}
