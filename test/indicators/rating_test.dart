import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../slide_to.dart';
import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  group(
    'AdaptiveRatingIndicator widget tests',
    () {
      testWidgets('Widget renders correctly on both platform',
          (WidgetTester tester) async {
        const double rating = 3;

        await tester.pumpWidget(
          wrapApp(
            child: const AdaptiveRatingIndicator(rating: rating, amount: 5),
          ),
        );

        adaptiveValue(
          macos: () {
            expect(find.byType(CustomRatingBarIndicatorMacos), findsOneWidget);
            expect(find.byType(RatingBar), findsNothing);

            CustomRatingBarIndicatorMacos ratingBarIndicator =
                tester.widget(find.byType(CustomRatingBarIndicatorMacos));
            expect(ratingBarIndicator.rating, equals(rating));
          },
          windows: () {
            expect(find.byType(RatingBar), findsOneWidget);
            expect(find.byType(CustomRatingBarIndicatorMacos), findsNothing);

            RatingBar ratingBar = tester.widget(find.byType(RatingBar));
            expect(ratingBar.rating, equals(rating));
          },
        );
      });

      testWidgets(
        'Callback is triggered on rating change',
        (WidgetTester tester) async {
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

          await tester.slideToValue(find.byType(AdaptiveRatingIndicator), 3.0);

          expect(newRating, isNot(0));
        },
      );
    },
  );
}
