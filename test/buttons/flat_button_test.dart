import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();


  testWidgets(
    'AdaptiveFlatButton renders correctly with custom properties',
    (WidgetTester tester) async {
      await tester.pumpWidget(
         wrapApp(
          child:  AdaptiveFlatButton(
            properties: Properties(
              windows: const FlatButtonWindowsProperty(),
              macos: const FlatButtonMacosProperty(),
            ),
            child: const Text('AdaptiveFlatButton'),
          ),
        ),
      );

      adaptiveValue(
        macos: () {
          // Expect the macOS version of the text button with custom properties to be rendered
          expect(find.byType(PushButton), findsOneWidget);
          expect(find.byType(Button), findsNothing);
        },
        windows: () {
          // Expect the windows version of the text button with custom properties to be rendered
          expect(find.byType(Button), findsOneWidget);
          expect(find.byType(PushButton), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveFlatButton calls onPressed and onLongPress callbacks',
    (WidgetTester tester) async {
      bool checkValue = false;

      await tester.pumpWidget(
        wrapApp(
          child:AdaptiveFlatButton(
            onPressed: () => checkValue = true,
            onLongPress: () => checkValue = false,
            child: const Text('Test FlatButton'),
          ),
        ),
      );

      await tester.tap(find.text('Test FlatButton'));
      await tester.pumpAndSettle();
      expect(checkValue, true);

      await tester.longPress(find.text('Test FlatButton'));
      await tester.pumpAndSettle();
      expect(checkValue, false);
    },
  );
}
