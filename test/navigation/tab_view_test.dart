import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';
import 'main_menu.dart';

void main() {
  initializeDesktopDefaultsTests();

  late List<Widget> children;
  late List<AdaptiveTab> tabs;

  setUp(
    () {
      tabs = List.generate(
        mainMenuTexts.length,
        (index) => AdaptiveTab(
          icon: AdaptiveIcon(mainMenuIcons[index]),
          label: SizedBox(width: 65.0, child: Text(mainMenuTexts[index])),
        ),
      );

      children = tabs.map(
        (element) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [element.label, element.icon!],
          );
        },
      ).toList();
    },
  );

  testWidgets(
    'AdaptiveTabView should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: AdaptiveTabView(tabs: tabs, children: children),
        ),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosTabView), findsOneWidget);
          expect(find.byType(TabView), findsNothing);
        },
        windows: () {
          expect(find.byType(TabView), findsOneWidget);
          expect(find.byType(MacosTabView), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveTabView updates currentIndex correctly on tab selection',
    (tester) async {
      await tester.runAsync(
        () async {
          int currentIndex = 0;

          await tester.pumpWidget(
            wrapApp(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return AdaptiveTabView(
                    currentIndex: currentIndex,
                    onChanged: (value) {
                      setState(() => currentIndex = value);
                    },
                    tabs: tabs,
                    children: children,
                  );
                },
              ),
            ),
          );

          final tabViewFinder = find.byType(AdaptiveTabView);

          final findItems = tester.widget<AdaptiveTabView>(tabViewFinder).tabs;

          // Initial state check (currentIndex is 0).
          expect(currentIndex, 0);

          // Simulate a tap on the last item's label.
          await tester.tap(find.byWidget(findItems.last.label));
          await tester.pumpAndSettle();

          // Check if currentIndex is updated to the last item's index (6).
          expect(currentIndex, findItems.length - 1);

          // Simulate a tap on the first item's label.
          await tester.tap(find.byWidget(findItems.first.label));
          await tester.pumpAndSettle();

          // Check if currentIndex is updated back to the first item's index (0).
          expect(currentIndex, 0);
        },
      );
    },
  );
}
