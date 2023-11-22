import 'package:adp_desktop/adp_desktop.dart';
import 'package:adp_desktop/src/components/buttons/text_button/platforms/platforms.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  DefaultPlatforms.initialize(AdaptiveTargetPlatform.macOS, isDebugging: true);

  testWidgets(
    'AdaptiveTextButton renders correctly with custom properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: const AdaptiveTextButton(
            properties: Properties(
              windows: TextButtonWindowsProperty(),
              macos: TextButtonMacosProperty(),
            ),
            child: Text('AdaptiveFilledButton'),
          ),
        ),
      );

      adaptiveValue(
        macos: () {
          // Expect the macOS version of the text button with custom properties to be rendered
          expect(find.byType(TextButtonMacos), findsOneWidget);
          expect(find.byType(TextButtonWindows), findsNothing);
        },
        windows: () {
          // Expect the windows version of the text button with custom properties to be rendered
          expect(find.byType(TextButtonWindows), findsOneWidget);
          expect(find.byType(TextButtonMacos), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveTextButton calls onPressed and onLongPress callbacks',
    (WidgetTester tester) async {
      bool checkValue = false;

      await tester.pumpWidget(
        wrapApp(
          child:  AdaptiveTextButton(
            onPressed: () => checkValue = true,
            onLongPress: () => checkValue = false,
            child: const Text('Test TextButton'),
          ),
        ),
      );

      await tester.tap(find.text('Test TextButton'));
      await tester.pumpAndSettle();
      expect(checkValue, true);

      await tester.longPress(find.text('Test TextButton'));
      await tester.pumpAndSettle();
      expect(checkValue, false);
    },
  );
}
