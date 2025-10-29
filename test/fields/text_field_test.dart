import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  late TextEditingController controller;

  setUp(() {
    controller = TextEditingController();
  });

  testWidgets(
    'AdaptiveTextField render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(child: AdaptiveTextField(controller: controller)),
        ),
      );

      await tester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosTextField), findsOneWidget);
          expect(find.byType(TextBox), findsNothing);
        },
        windows: () {
          expect(find.byType(TextBox), findsOneWidget);
          expect(find.byType(MacosTextField), findsNothing);
        },
      );
    },
  );

  testWidgets('AdaptiveTextField Entered text matches', (tester) async {
    const input = 'AbbasHussein';

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(child: AdaptiveTextField(controller: controller)),
      ),
    );

    final textField = find.byType(AdaptiveTextField);

    await tester.enterText(textField, input);
    expect(controller.text, input);
  });

  testWidgets('AdaptiveTextField functionality', (tester) async {
    String onChangedValue = '';
    String onSubmittedValue = '';
    bool onTapCallbackCalled = false;

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(
          child: AdaptiveTextField(
            controller: controller,
            onTap: () {
              onTapCallbackCalled = true;
            },
            onChanged: (value) {
              onChangedValue = value;
            },
            onSubmitted: (value) {
              onSubmittedValue = value;
            },
          ),
        ),
      ),
    );

    final textField = find.byType(AdaptiveTextField);

    //  Ensure onChanged callback is called when text changes
    await tester.enterText(textField, 'NewText');
    expect(onChangedValue, 'NewText');

    // Check if onTap callback is triggered
    await tester.tap(textField);
    expect(onTapCallbackCalled, true);

    // Submit the text and check if onSubmitted callback is triggered
    await tester.testTextInput.receiveAction(TextInputAction.done);
    expect(onSubmittedValue, 'NewText');
  });
}
