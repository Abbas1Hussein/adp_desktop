import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';
import 'main_menu.dart';

void main() {
  initializeDesktopDefaultsTests();

  late List<AdaptiveActionEntry>? actions;

  setUp(
    () {
      actions = [
        ...List.generate(
          mainMenuIcons.length - 3,
          (index) => AdaptiveActionButton(
            icon: AdaptiveIcon(mainMenuIcons[index]),
            label: mainMenuTexts[index],
          ),
        ),
        const AdaptiveActionDivider(),
        AdaptiveActionPulldownButton(
          label: 'menu',
          icon: AdpIcons.drop,
          items: [
            AdaptivePulldownMenuItem(
              child: const Text('Option 1'),
              onTap: () {},
            ),
            AdaptivePulldownMenuItem(
              child: const Text('Option 2'),
              onTap: () {},
            ),
          ],
        ),
        const AdaptiveActionDivider(),
      ];
    },
  );

  testWidgets(
    'AdaptiveNavigationAppBar should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveNavigationView(
            appBar: AdaptiveNavigationAppBar(actions: actions),
            children: const [],
          ),
        ),
      );

      await widgetTester.pumpAndSettle();
      adaptiveValue<void>(
        macos: () => expect(find.byType(ToolBar), findsOneWidget),
        windows: () => expect(find.byType(ToolBar), findsNothing),
      );
    },
  );
}
