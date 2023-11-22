import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../wrap_app.dart';

void main() {
  DefaultPlatforms.initialize(AdaptiveTargetPlatform.windows,
      isDebugging: true);
  testWidgets(
    'AdaptivePulldownMenuButton displays correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptivePulldownMenuButton<String>(
            title: 'Adp Menu',
            onSelected: (String? value) {},
            items: const [
              AdaptivePulldownMenuItem(
                leading: AdaptiveIcon(AdaptiveIcons.folderAdd),
                child: Text('New folder'),
              ),
            ],
          ),
        ),
      );

      // Verify that the title is rendered on the button.
      expect(find.text('Adp Menu'), findsOneWidget);

      // Perform a tap on the button to open the pulldown menu.
      await tester.tap(find.text('Adp Menu'));
      await tester.pumpAndSettle();

      // Verify that the menu items are displayed.
      expect(find.text('New folder'), findsOneWidget);

      // Close the menu.
      await tester.tap(find.text('New folder'));
      await tester.pumpAndSettle();
    },
  );

  testWidgets('Verify disabled state', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapAppWithScaffold(
        child: AdaptivePulldownMenuButton<String>(
          title: 'Adp Menu',
          disabledTitle: 'Adp Menu Disabled',
          onSelected: (String? value) {},
          items: const [
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdaptiveIcons.folderAdd),
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
  });
}
