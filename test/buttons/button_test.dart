import 'package:adp_desktop/adp_desktop.dart';
import 'package:adp_desktop/src/components/buttons/button/macos.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveButton(
              onPressed: () {},
              child: const Text('AdaptiveButton'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosButton), findsOneWidget);
          expect(find.byType(Button), findsNothing);
        },
        windows: () {
          expect(find.byType(Button), findsOneWidget);
          expect(find.byType(MacosButton), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveButton filled renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveButton.filled(
              onPressed: () {},
              child: const Text('AdaptiveButton filled'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosButton), findsOneWidget);
          expect(find.byType(FilledButton), findsNothing);
        },
        windows: () {
          expect(find.byType(FilledButton), findsOneWidget);
          expect(find.byType(MacosButton), findsNothing);
        },
      );
    },
  );
  testWidgets(
    'AdaptiveButton outlined renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveButton.outlined(
              onPressed: () {},
              child: const Text('AdaptiveButton outlined'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosButton), findsOneWidget);
          expect(find.byType(OutlinedButton), findsNothing);
        },
        windows: () {
          expect(find.byType(OutlinedButton), findsOneWidget);
          expect(find.byType(MacosButton), findsNothing);
        },
      );
    },
  );

  group(
    'AdaptiveButtons calls onPressed and onLongPress callbacks',
    () {
      bool onPressed = false;
      bool onLongPress = false;

      testWidgets(
        'AdaptiveButton calls callbacks',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapApp(
              child: AdaptiveButton(
                onLongPress: () => onLongPress = true,
                onPressed: () => onPressed = true,
                child: const Text('AdaptiveButton'),
              ),
            ),
          );

          await tester.tap(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();
          expect(onPressed, true);

          await tester.longPress(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();
          expect(onLongPress, true);
        },
      );

      onPressed = false;
      onLongPress = false;

      testWidgets(
        'AdaptiveButton filled calls callbacks',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapApp(
              child: AdaptiveButton.filled(
                onLongPress: () => onLongPress = true,
                onPressed: () => onPressed = true,
                child: const Text('AdaptiveButton filled'),
              ),
            ),
          );

          await tester.tap(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();
          expect(onPressed, true);

          await tester.longPress(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();
          expect(onLongPress, true);
        },
      );

      onPressed = false;
      onLongPress = false;

      testWidgets(
        'AdaptiveButton outlined calls callbacks',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapApp(
              child: AdaptiveButton.outlined(
                onLongPress: () => onLongPress = true,
                onPressed: () => onPressed = true,
                child: const Text('AdaptiveButton outlined'),
              ),
            ),
          );

          await tester.tap(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();
          expect(onPressed, true);

          await tester.longPress(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();
          expect(onLongPress, true);
        },
      );
    },
  );

  group(
    'AdaptiveButtons disabled states',
    () {
      testWidgets(
        'AdaptiveButton disabled state',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapApp(
              child: const AdaptiveButton(
                onPressed: null,
                onLongPress: null,
                child: Text('AdaptiveButton'),
              ),
            ),
          );

          // Verify that the button is disabled and not tappable
          expect(find.byType(AdaptiveButton), findsOneWidget);

          final textButton =
              tester.widget<AdaptiveButton>(find.byType(AdaptiveButton));

          expect(textButton.onPressed, isNull);
          expect(textButton.onLongPress, isNull);

          // tap the disabled button
          await tester.tap(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();

          // Ensure that the onPressed callback is still null and no action is taken
          expect(textButton.onPressed, isNull);

          await tester.longPress(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();

          // Ensure that the onLongPress callback is still null and no action is taken
          expect(textButton.onLongPress, isNull);
        },
      );

      testWidgets(
        'AdaptiveButton filled disabled state',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapApp(
              child: const AdaptiveButton.filled(
                onPressed: null,
                onLongPress: null,
                child: Text('AdaptiveButton filled'),
              ),
            ),
          );

          // Verify that the button is disabled and not tappable
          expect(find.byType(AdaptiveButton), findsOneWidget);

          final textButton =
              tester.widget<AdaptiveButton>(find.byType(AdaptiveButton));

          expect(textButton.onPressed, isNull);
          expect(textButton.onLongPress, isNull);

          // tap the disabled button
          await tester.tap(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();

          // Ensure that the onPressed callback is still null and no action is taken
          expect(textButton.onPressed, isNull);

          await tester.longPress(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();

          // Ensure that the onLongPress callback is still null and no action is taken
          expect(textButton.onLongPress, isNull);
        },
      );

      testWidgets(
        'AdaptiveButton outlined disabled state',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            wrapApp(
              child: const AdaptiveButton.outlined(
                onPressed: null,
                onLongPress: null,
                child: Text('AdaptiveButton outlined'),
              ),
            ),
          );

          // Verify that the button is disabled and not tappable
          expect(find.byType(AdaptiveButton), findsOneWidget);

          final textButton =
              tester.widget<AdaptiveButton>(find.byType(AdaptiveButton));

          expect(textButton.onPressed, isNull);
          expect(textButton.onLongPress, isNull);

          // tap the disabled button
          await tester.tap(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();

          // Ensure that the onPressed callback is still null and no action is taken
          expect(textButton.onPressed, isNull);

          await tester.longPress(find.byType(AdaptiveButton));
          await tester.pumpAndSettle();

          // Ensure that the onLongPress callback is still null and no action is taken
          expect(textButton.onLongPress, isNull);
        },
      );
    },
  );
}
