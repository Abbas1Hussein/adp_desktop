import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../slide_to.dart';
import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();

  testWidgets('AdaptiveSwitch initializes correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapApp(
        child: AdaptiveSwitch(
          value: false,
          onChanged: (bool newValue) {},
          label: const Text('Switch Label'),
        ),
      ),
    );

    // Verify that the switch is rendered with the correct label.
    expect(find.text('Switch Label'), findsOneWidget);

    // Verify that the switch is initially in the "off" state.
    expect(find.byType(AdaptiveSwitch), findsOneWidget);
    expect(tester.widget<AdaptiveSwitch>(find.byType(AdaptiveSwitch)).value,
        false);
  });

  testWidgets(
    'AdaptiveSwitch changes state correctly',
    (WidgetTester tester) async {
      bool value = false;
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AdaptiveSwitch(
                value: value,
                onChanged: (bool newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
                label: const Text('Switch Label'),
              );
            },
          ),
        ),
      );

      await adaptiveValue<Future<void>>(
        macos: () async {
          await tester.slideToValue(find.byType(AdaptiveSwitch), 10);
          await tester.pumpAndSettle();
        },
        windows: () async {
          await tester.tap(find.byType(AdaptiveSwitch));
          await tester.pumpAndSettle();
        },
      );

      // Verify that the switch state has changed.
      expect(
        tester.widget<AdaptiveSwitch>(find.byType(AdaptiveSwitch)).value,
        true,
      );
    },
  );
}
