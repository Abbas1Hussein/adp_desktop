import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests(DesktopTargetPlatform.windows);

  testWidgets(
    'AdaptiveAppBarPage should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveScaffoldPage(
            appBar: AdaptiveAppBarPage(
              title: const Text('Adaptive AppBar'),
              leading: const AdaptiveIcon(AdpIcons.home),
              actions: [
                AdaptiveActionButton(
                  icon: const AdaptiveIcon(AdpIcons.add),
                  label: 'add',
                  onPressed: () {},
                ),
                const AdaptiveActionDivider(),
                AdaptiveActionButton(
                  icon: const AdaptiveIcon(AdpIcons.search),
                  label: 'search',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

    },
  );

  testWidgets(
    'AdaptiveAppBarPage.platformActions should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: const AdaptiveScaffoldPage(
            appBar: AdaptiveAppBarPage.platformActions(
              title: Text('Adaptive AppBar'),
              leading: AdaptiveIcon(AdpIcons.home),
            ),
          ),
        ),
      );
    },
  );
}
