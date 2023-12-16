import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();

  testWidgets(
    'AdaptiveListTile should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: const AdaptiveListTile(
            title: Text('title'),
            leading: Text('leading'),
            trailing: Text('trailing'),
            subtitle: Text('subtitle'),
          ),
        ),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosListTile), findsOneWidget);
          expect(find.byType(ListTile), findsNothing);
        },
        windows: () {
          expect(find.byType(ListTile), findsOneWidget);
          expect(find.byType(MacosListTile), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveListTile should handle tap and long press events',
    (widgetTester) async {
      bool tapped = false;
      bool longPressed = false;

      asyncTest(bool isEnabled) async {
        await widgetTester.pumpWidget(
          wrapApp(
            child: StatefulBuilder(
              builder: (context, setState) => AdaptiveListTile(
                title: const Text('title'),
                onTap: () => setState(() => tapped = true),
                onLongPress: () => setState(() => longPressed = true),
                enabled: isEnabled,
              ),
            ),
          ),
        );

        await widgetTester.tap(find.byType(AdaptiveListTile));
        expect(tapped, isEnabled);

        await widgetTester.longPress(find.byType(AdaptiveListTile));
        expect(longPressed, isEnabled);
      }

      // Test when AdaptiveListTile is disabled
      await asyncTest(false);

      // Test when AdaptiveListTile is enabled
      await asyncTest(true);
    },
  );
}
