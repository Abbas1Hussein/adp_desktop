import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveIconButton renders correctly with custom properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: const AdaptiveIconButton(icon: AdaptiveIcon(AdpIcons.add)),
        ),
      );

      adaptiveValue(
        macos: () {
          // Expect the macOS version of the text button with custom properties to be rendered
          expect(find.byType(MacosIconButton), findsOneWidget);
          expect(find.byType(IconButton), findsNothing);
        },
        windows: () {
          // Expect the windows version of the text button with custom properties to be rendered
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
