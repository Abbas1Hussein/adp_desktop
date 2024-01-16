import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveIconButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(
            child: AdaptiveIconButton(
              icon: AdaptiveIcon(AdpIcons.add),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosIconButton), findsOneWidget);
          expect(find.byType(IconButton), findsNothing);
        },
        windows: () {
          expect(find.byType(IconButton), findsOneWidget);
          expect(find.byType(MacosIconButton), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveIconButton calls onPressed callbacks',
    (WidgetTester tester) async {
      bool checkValue = false;

      await tester.pumpWidget(
        wrapApp(
          child: AdaptiveIconButton(
            onPressed: () => checkValue = true,
            icon: const AdaptiveIcon(AdpIcons.add),
          ),
        ),
      );

      await tester.tap(find.byType(AdaptiveIcon));
      await tester.pumpAndSettle();
      expect(checkValue, true);
    },
  );
}
