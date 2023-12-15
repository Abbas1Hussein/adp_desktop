import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.windows,
    isDebugging: true,
  );

  testWidgets(
    'AdaptiveDialog should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveFlatButton(
                child: const Text('Show Dialog'),
                onPressed: () {
                  showAdpDialog(
                    context: context,
                    child: AdaptiveDialog(
                      title: Text(DummyText.generateQuestion),
                      content: Text(DummyText.generateAnswer),
                      primary: AdaptiveFlatButton(
                        child: const Text('Yes'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      secondary: AdaptiveFlatButton(
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
}
