import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();

  testWidgets(
    'AdaptiveBottomSheet should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveFlatButton(
                child: const Text('Show BottomSheet'),
                onPressed: () {
                  showAdpBottomSheet(
                    context: context,
                    builder: (context) => AdaptiveBottomSheet(
                      child: Column(
                        children: [
                          Text(DummyText.generateQuestion),
                          Text(DummyText.generateAnswer),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

      await widgetTester.tap(find.text('Show BottomSheet'));
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosSheet), findsOneWidget);
        },
        windows: () {
          expect(find.byType(MacosSheet), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'BottomSheetPresenter - Show Confirmation Sheet',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveFlatButton(
                child: const Text('Show Confirmation Sheet'),
                onPressed: () async {
                  final result =
                      await BottomSheetPresenter.showConfirmationSheet(
                    context,
                    title: DummyText.generateQuestion,
                    content: Text(DummyText.generateAnswer),
                    confirmLabel: 'Confirm',
                  );

                  // Ensure that the sheet was closed with the correct result.
                  expect(result, true);
                },
              );
            },
          ),
        ),
      );

      // Trigger the Bottom Sheet.
      await tester.tap(find.text('Show Confirmation Sheet'));
      await tester.pumpAndSettle();

      // Confirm the Bottom Sheet.
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Ensure that the Bottom Sheet is closed.
      expect(find.byType(AdaptiveBottomSheet), findsNothing);
    },
  );

  testWidgets(
    'BottomSheetPresenter - Show Information Sheet',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (BuildContext context) {
              return AdaptiveFlatButton(
                onPressed: () async {
                  await BottomSheetPresenter.showInformationSheet(
                    context,
                    title: DummyText.generateQuestion,
                    message: DummyText.generateAnswer,
                    position: BottomSheetPosition.top,
                  );
                },
                child: const Text('Show Information Sheet'),
              );
            },
          ),
        ),
      );

      // Trigger the Bottom Sheet.
      await tester.tap(find.text('Show Information Sheet'));
      await tester.pumpAndSettle();

      // Close the Bottom Sheet.
      await tester.tap(find.byType(AdaptiveIconButton));
      await tester.pumpAndSettle();

      // Ensure that the Bottom Sheet is closed.
      expect(find.byType(AdaptiveBottomSheet), findsNothing);
    },
  );
}
