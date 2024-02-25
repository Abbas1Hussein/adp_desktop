import 'package:adp_desktop/adp_desktop.dart';
import 'package:adp_desktop/src/components/buttons/window_button/platforms/platforms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveWindowButtons renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(child: AdaptiveWindowButtons()),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(WindowCloseButtonsMacos), findsOneWidget);
          expect(find.byType(WindowMinimizeButtonsMacos), findsOneWidget);
          expect(find.byType(WindowMaximizeButtonsMacos), findsOneWidget);

          expect(find.byType(WindowCloseButtonsWindows), findsNothing);
          expect(find.byType(WindowMinimizeButtonsWindows), findsNothing);
          expect(find.byType(WindowMaximizeButtonsWindows), findsNothing);
        },
        windows: () {
          expect(find.byType(WindowCloseButtonsWindows), findsOneWidget);
          expect(find.byType(WindowMinimizeButtonsWindows), findsOneWidget);
          expect(find.byType(WindowMaximizeButtonsWindows), findsOneWidget);

          expect(find.byType(WindowCloseButtonsMacos), findsNothing);
          expect(find.byType(WindowMinimizeButtonsMacos), findsNothing);
          expect(find.byType(WindowMaximizeButtonsMacos), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveCloseWindowButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(child: AdaptiveCloseWindowButton()),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(WindowCloseButtonsMacos), findsOneWidget);
          expect(find.byType(WindowCloseButtonsWindows), findsNothing);
        },
        windows: () {
          expect(find.byType(WindowCloseButtonsWindows), findsOneWidget);
          expect(find.byType(WindowCloseButtonsMacos), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveMinimizeWindowButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(child: AdaptiveMinimizeWindowButton()),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(WindowMinimizeButtonsMacos), findsOneWidget);
          expect(find.byType(WindowMinimizeButtonsWindows), findsNothing);
        },
        windows: () {
          expect(find.byType(WindowMinimizeButtonsWindows), findsOneWidget);
          expect(find.byType(WindowMinimizeButtonsMacos), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveMaximizeWindowButton renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(child: AdaptiveMaximizeWindowButton()),
        ),
      );
      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(WindowMaximizeButtonsMacos), findsOneWidget);
          expect(find.byType(WindowMaximizeButtonsWindows), findsNothing);
        },
        windows: () {
          expect(find.byType(WindowMaximizeButtonsWindows), findsOneWidget);
          expect(find.byType(WindowMaximizeButtonsMacos), findsNothing);
        },
      );
    },
  );
}
