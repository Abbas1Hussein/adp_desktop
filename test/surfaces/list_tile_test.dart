import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveListTile should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveListTile(
            onTap: () {},
            onLongPress: () {},
            title: const Text('title'),
            leading: const Text('leading'),
            trailing: const Text('trailing'),
            subtitle: const Text('subtitle'),
          ),
        ),
      );
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(ListTile), findsNothing);
        },
        windows: () {
          expect(find.byType(ListTile), findsOneWidget);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveListTile should trigger onTap and onLongPress callback',
    (widgetTester) async {
      bool longPressTriggered = false;
      bool onTap = false;

      await widgetTester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveListTile(
            onTap: () => onTap = true,
            onLongPress: () => longPressTriggered = true,
            title: const Text('cloudDownload'),
            subtitle: const Text('your download from net.'),
            leading: const AdaptiveIcon(AdpIcons.cloudDownload),
          ),
        ),
      );
      await widgetTester.tap(find.byType(AdaptiveListTile));
      await widgetTester.pumpAndSettle();

      await widgetTester.longPress(find.byType(AdaptiveListTile));
      await widgetTester.pumpAndSettle();

      expect(onTap, true);
      expect(longPressTriggered, true);
    },
  );

  testWidgets(
    'AdaptiveListTile should not trigger when click onTap and onLongPress callback disabled state',
    (widgetTester) async {
      bool longPressTriggered = false;
      bool onTap = false;

      await widgetTester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveListTile(
            enabled: false,
            onTap: () => onTap = true,
            onLongPress: () => longPressTriggered = true,
            title: const Text('cloudDownload'),
            subtitle: const Text('your download from net.'),
            leading: const AdaptiveIcon(AdpIcons.cloudDownload),
          ),
        ),
      );

      await widgetTester.longPress(find.byType(AdaptiveListTile));
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(find.byType(AdaptiveListTile));
      await widgetTester.pumpAndSettle();

      expect(longPressTriggered, false);
      expect(onTap, false);
    },
  );
}
