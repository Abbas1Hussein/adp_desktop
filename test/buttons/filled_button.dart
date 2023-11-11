import 'package:adp_desktop/adp_desktop.dart';
import 'package:adp_desktop/src/components/buttons/filled_button/platforms/platforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DefaultPlatforms.initialize(AdaptiveTargetPlatform.macOS, isDebugging: true);

  testWidgets(
    'AdaptiveFilledButton renders correctly with custom properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const AdpApp(
          home: AdaptiveFilledButton(
            properties: Properties(
              windows: FilledButtonWindowsProperty(autofocus: true),
              macos: FilledButtonMacosProperty(pressedOpacity: 0.6),
            ),
            child: Text('AdaptiveFilledButton'),
          ),
        ),
      );

      adaptiveValue(
        macos: () {
          // Expect the macOS version of the button with custom properties to be rendered
          expect(find.byType(FilledButtonMacos), findsOneWidget);
          expect(find.byType(FilledButtonWindows), findsNothing);
        },
        windows: () {
          // Expect the windows version of the button with custom properties to be rendered
          expect(find.byType(FilledButtonWindows), findsOneWidget);
          expect(find.byType(FilledButtonMacos), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveFilledButton calls onPressed and onLongPress callbacks',
    (WidgetTester tester) async {
      bool checkValue = false;

      await tester.pumpWidget(
        AdpApp(
          home: AdaptiveFilledButton(
            onPressed: () => checkValue = true,
            onLongPress: () => checkValue = false,
            child: const Text('Test FilledButton'),
          ),
        ),
      );

      await tester.tap(find.text('Test FilledButton'));
      await tester.pumpAndSettle();
      expect(checkValue, true);

      await tester.longPress(find.text('Test FilledButton'));
      await tester.pumpAndSettle();
      expect(checkValue, false);
    },
  );
}
