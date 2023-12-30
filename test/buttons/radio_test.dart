import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();

  testWidgets(
    'AdaptiveRadio Renders correctly',
    (widgetTester) async {
      int currentValue = 0;

      final colors = [
        AdpColors.purple,
        AdpColors.red,
        AdpColors.cyan,
        AdpColors.magenta,
        AdpColors.teal,
      ];

      await widgetTester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                (index) {
                  return StatefulBuilder(
                    builder: (context, setState) => AdaptiveRadio<int>(
                      value: index + 1,
                      groupValue: currentValue,
                      activeColor: colors[index],
                      disabledColor: colors.reversed.toList()[index],
                      label: Text('Adp R a d i o ${index + 1}'),
                      onChanged: (value) {
                        setState(() {
                          currentValue = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
      // Test if all radio buttons are rendered
      expect(find.byType(AdaptiveRadio<int>), findsWidgets);

      // Test changing the value by tapping a radio button
      await widgetTester.tap(find.text('Adp R a d i o 3'));
      await widgetTester.pumpAndSettle();

      // Verify that the onChanged callback was invoked
      expect(currentValue, 3);
    },
  );
}
