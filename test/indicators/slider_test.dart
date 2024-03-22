import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../slide_to.dart';
import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveSlider renders correctly with value',
    (WidgetTester tester) async {
      const double value = 50.0;
      await tester.pumpWidget(
        wrapApp(
          child: AdaptiveSlider(value: value, onChanged: (value) {}),
        ),
      );
      adaptiveValue(macos: () {
        expect(find.byType(MacosSlider), findsOneWidget);
        expect(find.byType(Slider), findsNothing);

        MacosSlider macosSlider = tester.widget(find.byType(MacosSlider));
        expect(macosSlider.value, equals(value));
      }, windows: () {
        expect(find.byType(Slider), findsOneWidget);
        expect(find.byType(MacosSlider), findsNothing);

        Slider slider = tester.widget(find.byType(Slider));
        expect(slider.value, equals(value));
      });
    },
  );

  testWidgets(
    'AdaptiveSlider updates value correctly with slide gesture',
    (WidgetTester tester) async {
      double progressValue = 0;

      await tester.pumpWidget(
        wrapApp(child: StatefulBuilder(
          builder: (context, setState) {
            return AdaptiveSlider(
              onChanged: (value) => setState(() => progressValue = value),
              value: progressValue,
            );
          },
        )),
      );

      await tester.slideToValue(find.byType(AdaptiveSlider), 85.8);

      expect(progressValue, isNot(0));
    },
  );
}
