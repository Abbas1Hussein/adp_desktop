import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveDatePicker render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: const SizedBox(
            width: 200,
            height: 45.0,
            child: AdaptiveDatePicker(),
          ),
        ),
      );

      await tester.tap(find.byType(AdaptiveDatePicker));
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosDatePicker), findsOneWidget);
          expect(find.byType(DatePicker), findsNothing);
        },
        windows: () {
          expect(find.byType(DatePicker), findsOneWidget);
          expect(find.byType(MacosDatePicker), findsNothing);
        },
      );
    },
  );
}
