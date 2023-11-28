import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adp_desktop/src/components/Indicators/rating_Indicator/custom_rating_Indicator.dart';

import '../slide_to.dart';
import '../wrap_app.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.windows,
    isDebugging: true,
  );

  group('AdaptiveRatingIndicator widget tests', () {
    testWidgets('Widget renders correctly on both platform', (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(child: const AdaptiveRatingIndicator(rating: 3)),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(CustomRatingBarIndicator), findsOneWidget);
          expect(find.byType(RatingBar), findsNothing);
        },
        windows: () {
          expect(find.byType(RatingBar), findsOneWidget);
          expect(find.byType(CustomRatingBarIndicator), findsNothing);
        },
      );
    });

    testWidgets('Callback is triggered on rating change', (WidgetTester tester) async {
      double newRating = 0;

      await tester.pumpWidget(
        wrapApp(
          child: StatefulBuilder(
            builder: (context, setState) {
              return AdaptiveRatingIndicator(
                amount: 10,
                rating: newRating,
                onChanged: (rating) {
                  setState(() => newRating = rating);
                },
              );
            },
          ),
        ),
      );

      await tester.slideToValue(find.byType(AdaptiveRatingIndicator), 3);

      expect(newRating, isNot(0));
    });
  });
}
