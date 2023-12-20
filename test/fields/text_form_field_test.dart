import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();

  late GlobalKey<FormState> key;
  late TextEditingController controller;

  setUp(() {
    key = GlobalKey<FormState>();

    controller = TextEditingController(text: 'AdaptiveTextFormField');
  });

  testWidgets(
    'AdaptiveTextFormField render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: const Center(child: AdaptiveTextFormField()),
        ),
      );

      await tester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(TextFormBox), findsNothing);
        },
        windows: () {
          expect(find.byType(TextFormBox), findsOneWidget);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveTextFormField Entered text matches',
    (tester) async {
      const input = '- *** - {-(@AbbasHussein@)-} - *** -';

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(child: AdaptiveTextFormField(controller: controller)),
        ),
      );

      final textField = find.byType(AdaptiveTextFormField);

      await tester.enterText(textField, input);
      expect(controller.text, input);
    },
  );

  testWidgets(
    'AdaptiveTextFormField callbacks are triggered correctly',
    (tester) async {
      bool tapTriggered = false;
      bool changedTriggered = false;
      bool fieldSubmittedTriggered = false;
      bool editingCompleteTriggered = false;

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveTextFormField(
              onTap: () {
                tapTriggered = true;
              },
              onChanged: (value) {
                changedTriggered = true;
              },
              onFieldSubmitted: (value) {
                fieldSubmittedTriggered = true;
              },
              onEditingComplete: () {
                editingCompleteTriggered = true;
              },
            ),
          ),
        ),
      );

      // Simulate user interactions
      await tester.tap(find.byType(AdaptiveTextFormField));
      await tester.enterText(find.byType(AdaptiveTextFormField), 'TestText');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(tapTriggered, isTrue);
      expect(changedTriggered, isTrue);
      expect(fieldSubmittedTriggered, isTrue);
      expect(editingCompleteTriggered, isTrue);
    },
  );

  group(
    'AdaptiveTextFormField Validation and Login Tests',
    () {
      void handleLogin() {
        if (key.currentState?.validate() ?? false) {
          // Validation successful, proceed with login logic
          key.currentState?.save();
        } else {
          // Validation failed, show an error message or perform error handling
        }
      }

      // validate a form field value and return an error message if necessary
      String? validateField(String? value, String errorMessage) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      }

      testWidgets(
        'Validation and Login with AdaptiveTextFormField',
        (tester) async {
          await tester.pumpWidget(
            wrapAppWithScaffold(
              child: Center(
                child: Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AdaptiveTextFormField(
                        placeholder: 'Enter a username',
                        validator: (value) {
                          return validateField(
                              value, 'Please enter a username');
                        },
                      ),
                      const SizedBox(height: 8.0),
                      AdaptiveTextFormField(
                        placeholder: 'Enter your password',
                        obscureText: true,
                        validator: (value) {
                          return validateField(
                              value, 'Please enter a password');
                        },
                      ),
                      const SizedBox(height: 8.0),
                      AdaptiveFlatButton(
                        onPressed: handleLogin,
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

          // Find the username and password form fields
          final textUsernameField =
              find.widgetWithText(AdaptiveTextFormField, 'Enter a username');
          final textPasswordField =
              find.widgetWithText(AdaptiveTextFormField, 'Enter your password');

          // Enter valid text to remove the validation error
          await tester.enterText(textUsernameField, 'ValidText');
          await tester.pumpAndSettle();

          // Enter invalid text to show the validation error
          await tester.enterText(textPasswordField, '');
          await tester.pumpAndSettle();

          // Tap the login button
          await tester.tap(find.byType(AdaptiveFlatButton));
          await tester.pumpAndSettle();

          // Expect the validation error for password to be displayed
          expect(find.text('Please enter a username'), findsNothing);
          expect(find.text('Please enter a password'), findsOneWidget);
        },
      );

      testWidgets(
        'Validation, Login, and onSaved with AdaptiveTextFormField',
        (tester) async {
          String? username;
          String? password;

          await tester.pumpWidget(
            wrapAppWithScaffold(
              child: Center(
                child: Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AdaptiveTextFormField(
                        placeholder: 'Enter a username',
                        validator: (value) =>
                            validateField(value, 'Please enter a username'),
                        onSaved: (newValue) => username = newValue,
                      ),
                      const SizedBox(height: 8.0),
                      AdaptiveTextFormField(
                        placeholder: 'Enter your password',
                        obscureText: true,
                        validator: (value) =>
                            validateField(value, 'Please enter a password'),
                        onSaved: (newValue) => password = newValue,
                      ),
                      const SizedBox(height: 8.0),
                      AdaptiveFlatButton(
                        onPressed: handleLogin,
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

          // Find the username and password form fields
          final textUsernameField =
              find.widgetWithText(AdaptiveTextFormField, 'Enter a username');
          final textPasswordField =
              find.widgetWithText(AdaptiveTextFormField, 'Enter your password');

          // Enter valid text for both fields
          await tester.enterText(textUsernameField, 'ValidTextUsernameField');
          await tester.enterText(textPasswordField, 'ValidTextPasswordField');
          await tester.pumpAndSettle();

          // Tap the login button
          await tester.tap(find.byType(AdaptiveFlatButton));
          await tester.pumpAndSettle();

          // Expect the saved values to match the entered text
          expect(username, 'ValidTextUsernameField');
          expect(password, 'ValidTextPasswordField');
        },
      );
    },
  );
}
