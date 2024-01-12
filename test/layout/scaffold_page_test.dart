import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveScaffoldPage should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: const AdaptiveScaffoldPage(
            appBar: AdaptiveAppBarPage(
              title: Text('Adaptive ScaffoldPage'),
              leading: AdaptiveIcon(AdpIcons.home),
            ),
            content: Center(child: AdaptiveDatePicker()),
          ),
        ),
      );

      await widgetTester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosScaffold), findsOneWidget);
          expect(find.byType(ScaffoldPage), findsNothing);
        },
        windows: () {
          expect(find.byType(ScaffoldPage), findsOneWidget);
          expect(find.byType(MacosScaffold), findsNothing);
        },
      );
    },
  );
}
