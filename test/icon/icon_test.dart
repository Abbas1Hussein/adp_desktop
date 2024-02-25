import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveIcon renders on both platforms',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(child: const AdaptiveIcon(AdpIcons.add)),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosIcon), findsOneWidget);
          expect(find.byType(Icon), findsNothing);
        },
        windows: () {
          expect(find.byType(MacosIcon), findsNothing);
          expect(find.byType(Icon), findsOneWidget);
        },
      );
    },
  );
}
