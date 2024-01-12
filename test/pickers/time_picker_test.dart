import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveTimePicker render correctly',
    (tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            wrapApp(
              child: Center(
                child: AdaptiveTimePicker(
                  initialTime: TimeOfDay.now(),
                  onSelected: (value) {},
                  onCancel: () {},
                ),
              ),
            ),
          );

          await tester.tap(find.byType(AdaptiveTimePicker));
          await tester.pumpAndSettle();

          adaptiveValue(
            macos: () {
              expect(find.byType(MacosTimePicker), findsOneWidget);
              expect(find.byType(TimePicker), findsNothing);
            },
            windows: () {
              expect(find.byType(TimePicker), findsOneWidget);
              expect(find.byType(MacosTimePicker), findsNothing);
            },
          );
        },
      );
    },
  );
}
