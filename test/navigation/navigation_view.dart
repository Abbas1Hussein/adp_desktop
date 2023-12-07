import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.macOS,
    isDebugging: true,
  );

  const List<AdpIcons> mainMenuIcons = [
    AdpIcons.app,
    AdpIcons.tvFilled,
    AdpIcons.tv,
    AdpIcons.save,
    AdpIcons.document,
    AdpIcons.downloadFile,
    AdpIcons.settings,
  ];
  const List<String> mainMenuTexts = [
    'Main Menu',
    'TV Series',
    'Movies',
    'Saved',
    'Watch Later',
    'Downloads',
    'Settings',
  ];

  late List<Widget> children;
  late List<AdaptiveNavigationViewItem> items;

  setUp(
    () {
      items = List.generate(
        mainMenuTexts.length,
        (index) => AdaptiveNavigationViewItem(
          icon: AdaptiveIcon(mainMenuIcons[index]),
          label: SizedBox(width: 65.0, child: Text(mainMenuTexts[index])),
        ),
      );

      children = items.map(
        (element) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [element.label, element.icon],
          );
        },
      ).toList();
    },
  );

  testWidgets(
    'AdaptiveNavigationView should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveNavigationView(items: items, children: children),
        ),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosWindow), findsOneWidget);
          expect(find.byType(NavigationView), findsNothing);
        },
        windows: () {
          expect(find.byType(NavigationView), findsOneWidget);
          expect(find.byType(MacosWindow), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveNavigationView updates currentIndex correctly on item selection',
    (tester) async {
      await tester.runAsync(
        () async {
          int currentIndex = 0;

          await tester.pumpWidget(
            wrapApp(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return AdaptiveNavigationView(
                    currentIndex: currentIndex,
                    onChanged: (value) {
                      setState(() => currentIndex = value);
                    },
                    items: items,
                    children: children,
                  );
                },
              ),
            ),
          );

          final navigationViewFinder = find.byType(AdaptiveNavigationView);

          final findItems =
              tester.widget<AdaptiveNavigationView>(navigationViewFinder).items;

          // Initial state check (currentIndex is 0).
          expect(currentIndex, 0);

          // Simulate a tap on the last item's label.
          await tester.tap(find.byWidget(findItems.last.icon));
          await tester.pumpAndSettle();

          // Check if currentIndex is updated to the last item's index (6).
          expect(currentIndex, findItems.length - 1);

          // Simulate a tap on the first item's label.
          await tester.tap(find.byWidget(findItems.first.icon));
          await tester.pumpAndSettle();

          // Check if currentIndex is updated back to the first item's index (0).
          expect(currentIndex, 0);
        },
      );
    },
  );
}
