/// PhysTrigger Heating Vest - Main Entry Point
///
/// Implements robust error handling via runZonedGuarded and strict initialization order.
library;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'ui/ui.dart';
import 'ui/screens/device_scan_page.dart';

Future<void> main() async {
  // Fix 2: Safety Wrapper
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Catch-all for Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint('[FLUTTER ERROR] ${details.exception}');
      debugPrint('[STACK TRACE] ${details.stack}');
    };

    runApp(const PhysTriggerApp());
  }, (Object error, StackTrace stack) {
    // Catch-all for async/Dart errors
    debugPrint('[FATAL APP ERROR] $error');
    debugPrint('[STACK TRACE] $stack');
  });
}

class PhysTriggerApp extends StatelessWidget {
  const PhysTriggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Layer 0: Theme Provider
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) {
            final provider = ThemeProvider();
            provider.loadPreference(); // Load saved preference
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
            // Critical: Initialize permission/scan logic AFTER creation
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
