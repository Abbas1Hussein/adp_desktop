import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests(DesktopTargetPlatform.macOS);

  testWidgets(
    'AdaptivePulldownMenuButton Render correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(
          child: AdaptivePulldownMenuButton<String>(
            title: 'Adp Menu',
            items: const [
              AdaptivePulldownMenuItem(child: Text('1')),
              AdaptivePulldownMenuItem(child: Text('2')),
              AdaptivePulldownMenuItem(child: Text('3')),
            ],
            onSelected: (index, value) {},
          ),
        ),
      );

      await tester.pumpAndSettle();
      adaptiveValue(
        macos: () {
          expect(find.byType(MacosPulldownButton), findsOneWidget);
          expect(find.byType(DropDownButton), findsNothing);
        },
        windows: () {
          expect(find.byType(DropDownButton), findsOneWidget);
          expect(find.byType(MacosPulldownButton), findsNothing);
        },
      );
    },
  );


  testWidgets(
    'AdaptivePulldownMenuButton displays correctly items',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePulldownMenuButton<String>(
            title: 'Adp Menu',
            onSelected: (index, value) {},
            items: const [
              AdaptivePulldownMenuItem(
                leading: AdaptiveIcon(AdpIcons.folderAdd),
                child: Text('New folder'),
              ),
            ],
          ),
        ),
      );

      // Verify that the title is rendered on the button.
      expect(find.text('Adp Menu'), findsOneWidget);

      // tap on the button to open the pulldown menu.
      await tester.tap(find.text('Adp Menu'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify that the menu items are displayed.
      expect(find.text('New folder'), findsOneWidget);
    },
  );

  testWidgets(
    'AdaptivePulldownMenuButton.singleChoice displays correctly items',
    (WidgetTester tester) async {
      int? selectedValue;
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePulldownMenuButton<int>.singleChoice(
            title: 'Adp Menu',
            onSelected: (index, value) => selectedValue = value,
            items: const [
              AdaptivePulldownMenuItem(
                value: 0,
                enabled: true,
                leading: AdaptiveIcon(AdpIcons.folderAdd),
                child: Text('New folder'),
              ),
              AdaptivePulldownMenuItem(
                value: 1,
                leading: AdaptiveIcon(AdpIcons.folderOpen),
                child: Text('Open'),
              ),
            ],
          ),
        ),
      );

      // tap on the button to open the pulldown menu.
      await tester.tap(find.text('Adp Menu'));
      await tester.pumpAndSettle();

      // tap on the 'Open' menu item.
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // Verify that the onSelected callback was called with the correct value.
      expect(selectedValue, equals(1));

      // tap on the button to open the pulldown menu.
      await tester.tap(find.text('Adp Menu'));
      await tester.pumpAndSettle();

      // tap on the 'New folder' menu item.
      await tester.tap(find.text('New folder'));
      await tester.pumpAndSettle();

      // Verify that the onSelected callback was called with the correct value.
      expect(selectedValue, equals(0));
    },
  );

  testWidgets(
    'Verify onSelected callback',
    (WidgetTester tester) async {
      int? selectedValue;
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePulldownMenuButton<int>(
            title: 'Adp Menu',
            onSelected: (index, value) => selectedValue = value,
            items: const [
              AdaptivePulldownMenuItem(
                value: 0,
                leading: AdaptiveIcon(AdpIcons.folderAdd),
                child: Text('New folder'),
              ),
              AdaptivePulldownMenuItem(
                value: 1,
                leading: AdaptiveIcon(AdpIcons.folderOpen),
                child: Text('Open'),
              ),
            ],
          ),
        ),
      );

      // tap on the button to open the pulldown menu.
      await tester.tap(find.text('Adp Menu'));
      await tester.pumpAndSettle();

      // tap on the 'Open' menu item.
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // Verify that the onSelected callback was called with the correct value.
      expect(selectedValue, equals(1));
    },
  );

  testWidgets(
    'Verify disabled state',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePulldownMenuButton<String>(
            title: 'Adp Menu',
            disabledTitle: 'Adp Menu Disabled',
            onSelected: (index, value) {},
            items: const [
              AdaptivePulldownMenuItem(
                leading: AdaptiveIcon(AdpIcons.folderAdd),
                child: Text('New folder'),
              ),
            ],
            disabled: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the button is disabled.
      expect(find.text('Adp Menu Disabled'), findsOneWidget);
    },
  );

  testWidgets(
    'AdaptivePulldownMenuButton.singleChoice: Should have one item with the selected value set to true.',
    (WidgetTester tester) async {
      final pulldownSingleChoice = AdaptivePulldownMenuButton<int>.singleChoice(
        title: 'Adp Menu',
        onSelected: (index, value) {},
        items: const [
          AdaptivePulldownMenuItem(
            value: 0,
            enabled: true,
            leading: AdaptiveIcon(AdpIcons.folderAdd),
            child: Text('New folder'),
          ),
          AdaptivePulldownMenuItem(
            value: 1,
            enabled: true,
            leading: AdaptiveIcon(AdpIcons.folderOpen),
            child: Text('Open'),
          ),
        ],
      );

      expect(
        () => pulldownSingleChoice.validateSelectedItem(),
        throwsA(const TypeMatcher<AssertionError>()),
      );
    },
  );

  testWidgets(
    'The list of items should not be empty.',
    (WidgetTester tester) async {
      final pulldown = AdaptivePulldownMenuButton<int>(
        items: const [],
        title: 'Adp Menu',
        onSelected: (index, value) {},
      );

      expect(
        () => pulldown.validateSelectedItem(),
        throwsA(const TypeMatcher<AssertionError>()),
      );
    },
  );
}
