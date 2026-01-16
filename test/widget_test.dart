/// Widget tests for PhysTrigger Heating Vest
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:phys_trigger_ble/main.dart';

void main() {
  testWidgets('PhysTrigger app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PhysTriggerApp());

    // Verify that the app bar title is present
    expect(find.text('PhysTrigger Heating Vest'), findsOneWidget);
  });
}
