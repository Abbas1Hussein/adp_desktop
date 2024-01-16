import 'package:adp_desktop/adp_desktop.dart';
import 'package:adp_desktop/src/components/buttons/checkbox/macos_checkbox.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests(DesktopTargetPlatform.macOS);

  testWidgets(
    'Renders correctly AdaptiveCheckbox',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: AdaptiveCheckbox(value: true, onChanged: (value) {}),
        ),
      );

      await tester.pumpAndSettle();

      adaptiveValue<void>(
        macos: () {
          expect(find.byType(CustomMacosCheckbox), findsOneWidget);
        },
        windows: () {
          expect(find.byType(Checkbox), findsOneWidget);
        },
      );
    },
  );

  Future<void> toggleAdaptiveCheckbox(WidgetTester tester) async {
    await tester.tap(find.byType(AdaptiveCheckbox));
    await tester.pumpAndSettle();
  }

  testWidgets(
    'Toggling AdaptiveCheckbox updates its value directly',
    (WidgetTester tester) async {
      bool? checkBoxValue = false;

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: AdaptiveCheckbox(
                  value: checkBoxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue = value;
                    });
                  },
                ),
              );
            },
          ),
        ),
      );

      expect(
        tester.widget<AdaptiveCheckbox>(find.byType(AdaptiveCheckbox)).value,
        false,
      );

      await toggleAdaptiveCheckbox(tester);
      expect(checkBoxValue, true);

      await toggleAdaptiveCheckbox(tester);
      expect(checkBoxValue, false);

      await toggleAdaptiveCheckbox(tester);
      expect(checkBoxValue, true);
    },
  );
}
