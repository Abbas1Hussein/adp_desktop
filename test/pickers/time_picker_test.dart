import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults(DesktopTargetPlatform.macOS);

  testWidgets(
    'AdaptiveTimePicker render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapApp(child: const Center(child: AdaptiveTimePicker())),
      );
      await tester.pumpAndSettle();
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
}
