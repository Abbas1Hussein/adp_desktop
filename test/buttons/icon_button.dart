import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultPlatforms.initialize(AdaptiveTargetPlatform.windows,
      isDebugging: true);

  testWidgets(
    'AdaptiveIconButton renders correctly with custom properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const AdpApp(
          home: AdaptiveIconButton(
            properties: Properties(
              windows: IconButtonWindowsProperty(),
              macos: IconButtonMacosProperty(),
            ),
            icon: AdaptiveIcon(AdaptiveIcons.add),
          ),
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
        AdpApp(
          home: AdaptiveIconButton(
            onPressed: () => checkValue = true,
            icon: const AdaptiveIcon(AdaptiveIcons.add),
          ),
        ),
      );

      await tester.tap(find.byType(AdaptiveIcon));
      await tester.pumpAndSettle();
      expect(checkValue, true);
    },
  );
}
