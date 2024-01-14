import 'package:adp_desktop/adp_desktop.dart';
import 'package:adp_desktop/src/components/buttons/button/macos.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveTextButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveTextButton(
              onPressed: () {},
              child: const Text('AdaptiveTextButton'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosButton), findsOneWidget);
          expect(find.byType(HyperlinkButton), findsNothing);
        },
        windows: () {
          expect(find.byType(HyperlinkButton), findsOneWidget);
          expect(find.byType(MacosButton), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveTextButton calls onPressed and onLongPress callbacks',
    (WidgetTester tester) async {
      bool onPressed = false;
      bool onLongPress = false;

      await tester.pumpWidget(
        wrapApp(
          child: AdaptiveTextButton(
            onLongPress: () => onLongPress = true,
            onPressed: () => onPressed = true,
            child: const Text('AdaptiveTextButton'),
          ),
        ),
      );

      await tester.tap(find.byType(AdaptiveTextButton));
      await tester.pumpAndSettle();
      expect(onPressed, true);

      await tester.longPress(find.byType(AdaptiveTextButton));
      await tester.pumpAndSettle();
      expect(onLongPress, true);
    },
  );

  testWidgets(
    'AdaptiveTextButton disabled state',
    (WidgetTester tester) async  {
      await tester.pumpWidget(
        wrapApp(
          child: const AdaptiveTextButton(
            onPressed: null,
            onLongPress: null,
            child: Text('AdaptiveTextButton'),
          ),
        ),
      );

      // Verify that the button is disabled and not tappable
      expect(find.byType(AdaptiveTextButton), findsOneWidget);

      final textButton =
          tester.widget<AdaptiveTextButton>(find.byType(AdaptiveTextButton));

      expect(textButton.onPressed, isNull);
      expect(textButton.onLongPress, isNull);

      // tap the disabled button
      await tester.tap(find.byType(AdaptiveTextButton));
      await tester.pumpAndSettle();

      // Ensure that the onPressed callback is still null and no action is taken
      expect(textButton.onPressed, isNull);

      await tester.longPress(find.byType(AdaptiveTextButton));
      await tester.pumpAndSettle();

      // Ensure that the onLongPress callback is still null and no action is taken
      expect(textButton.onLongPress, isNull);
    },
  );
}
