import 'package:adp_desktop/adp_desktop.dart';

class RatingIndicatorPreview extends StatefulWidget {
  const RatingIndicatorPreview({super.key});

  @override
  State<RatingIndicatorPreview> createState() => _RatingIndicatorPreviewState();
}

class _RatingIndicatorPreviewState extends State<RatingIndicatorPreview> {
  double currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveRatingIndicator(
      amount: 10,
      rating: currentRating,
      onChanged: (value) {
        setState(() {
          currentRating = value;
        });
      },
    );
  }
}
