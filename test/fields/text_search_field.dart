import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults(DesktopTargetPlatform.windows);

  late TextEditingController controller;
  late List<AdaptiveSearchItem<int>> suggestions;

  setUp(
    () {
      controller = TextEditingController();
      suggestions = List.generate(
        10,
        (index) => AdaptiveSearchItem(
          searchKey: '${index + 1}',
          value: index + 1,
        ),
      );
    },
  );

  testWidgets(
    'AdaptiveTextSearchField render correctly',
    (tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveTextSearchField(
              controller: controller,
              suggestions: suggestions,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosTextField), findsOneWidget);
          expect(find.byType(AutoSuggestBox<int>), findsNothing);
        },
        windows: () {
          expect(find.byType(AutoSuggestBox<int>), findsOneWidget);
          expect(find.byType(MacosTextField), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveTextSearchField Entered text matches',
    (tester) async {
      const input = '- *** - {-(@AbbasHussein@)-} - *** -';

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: AdaptiveTextSearchField(
              key: const Key('adaptiveTextSearchField'),
              controller: controller,
              suggestions: suggestions,
            ),
          ),
        ),
      );

      // Trigger suggestions by entering text
      await tester.enterText(
        find.byKey(const Key('adaptiveTextSearchField')),
        input,
      );
      expect(controller.text, input);
    },
  );
}
