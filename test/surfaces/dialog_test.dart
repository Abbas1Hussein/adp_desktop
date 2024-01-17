import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveDialog should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveButton(
                child: const Text('Show Dialog'),
                onPressed: () {
                  showAdpDialog(
                    context: context,
                    builder: (context) => AdaptiveDialog(
                      title: Text(DummyText.generateQuestion),
                      content: Text(DummyText.generateAnswer),
                      primary: AdaptiveButton(
                        child: const Text('Yes'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      secondary: AdaptiveButton(
                        child: const Text('No'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

      await widgetTester.tap(find.text('Show Dialog'));
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosAlertDialog), findsOneWidget);
          expect(find.byType(ContentDialog), findsNothing);
        },
        windows: () {
          expect(find.byType(ContentDialog), findsOneWidget);
          expect(find.byType(MacosAlertDialog), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'DialogPresenter - Show Confirmation Dialog',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveButton(
                child: const Text('Show Confirmation Dialog'),
                onPressed: () async {
                  final result = await DialogPresenter.showConfirmationDialog(
                    context,
                    title: DummyText.generateQuestion,
                    message: DummyText.generateAnswer,
                    confirmLabel: 'Confirm',
                  );

                  // Ensure that the dialog was closed with the correct result.
                  expect(result, true);
                },
              );
            },
          ),
        ),
      );

      // Trigger the dialog.
      await tester.tap(find.text('Show Confirmation Dialog'));
      await tester.pumpAndSettle();

      // Confirm the dialog.
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      // Ensure that the dialog is closed.
      expect(find.byType(AdaptiveDialog), findsNothing);
    },
  );

  testWidgets(
    'DialogPresenter - Show Information Dialog',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (BuildContext context) {
              return AdaptiveButton(
                onPressed: () async {
                  await DialogPresenter.showInformationDialog(
                    context,
                    title: DummyText.generateQuestion,
                    message: DummyText.generateAnswer,
                    confirmLabel: 'OK',
                  );

                  expect(find.byType(AdaptiveButton), findsOneWidget);
                },
                child: const Text('Show Information Dialog'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Information Dialog'));
      await tester.pumpAndSettle();
    },
  );

}
