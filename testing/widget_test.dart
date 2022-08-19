import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing_app/main.dart';

void main() {
  group(
    'Test Counter Widget',
    () {
      testWidgets(
        'Increment Counter Widget',
        (WidgetTester tester) async {
          // Setup
          await tester.pumpWidget(const MyApp());
          // Do
          await tester.tap(
            find.byIcon(Icons.add),
          );
          await tester.pump(); // Like setState
          // Test
          expect(find.text('1'), findsOneWidget);
        },
      );
      testWidgets(
        'Decrement Counter Widget',
        (WidgetTester tester) async {
          // Setup
          await tester.pumpWidget(const MyApp());
          // Do
          await tester.tap(
            find.byIcon(Icons.remove),
          );
          await tester.pump(); // Like setState
          // Test
          expect(find.text('-1'), findsOneWidget);

          // If you expect to not find this widget, use the following:
          expect(find.text('0'), findsNothing);
        },
      );
    },
  );
}
