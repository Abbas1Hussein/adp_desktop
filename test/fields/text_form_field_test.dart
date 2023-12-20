import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();

  late TextEditingController controller;
  late GlobalKey<FormState> key;

  setUp(() {
    controller = TextEditingController(text: 'AdaptiveTextFormField');
    key = GlobalKey<FormState>();
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

  testWidgets('AdaptiveTextFormField Entered text matches', (tester) async {
    const input = '- *** - {-(@AbbasHussein@)-} - *** -';

    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: Center(child: AdaptiveTextFormField(controller: controller)),
      ),
    );

    final textField = find.byType(AdaptiveTextFormField);

    await tester.enterText(textField, input);
    expect(controller.text, input);
  });

  testWidgets(
    'AdaptiveTextFormField validation and login',
    (tester) async {
      String? validateField(String? value, String errorMessage) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      }

      void handleLogin() {
        if (key.currentState?.validate() ?? false) {
          // Validation successful, proceed with login logic
          print('Login successful!');
        } else {
          // Validation failed, show an error message or perform error handling
          print('Login failed. Please check your credentials.');
        }
      }

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
                  ),
                  const SizedBox(height: 8.0),
                  AdaptiveTextFormField(
                    placeholder: 'Enter your password',
                    obscureText: true,
                    validator: (value) =>
                        validateField(value, 'Please enter a password'),
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
      final textUsernameField = find.widgetWithText(AdaptiveTextFormField, 'Enter a username');
      final textPasswordField = find.widgetWithText(AdaptiveTextFormField, 'Enter your password');

      // Enter valid text to remove the validation error
      await tester.enterText(textUsernameField, 'ValidText');
      await tester.pumpAndSettle();

      // Enter unValid text to show validation error
      await tester.enterText(textPasswordField, '');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(AdaptiveFlatButton));
      await tester.pumpAndSettle();

      expect(find.text('Please enter a username'), findsNothing);
      expect(find.text('Please enter a password'), findsOneWidget);
    },
  );
}
