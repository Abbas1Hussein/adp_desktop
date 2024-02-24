import 'package:adp_desktop/adp_desktop.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 150.0, height: 150.0, child: AdaptiveCard()),
        SizedBox(
          width: 150.0,
          height: 150.0,
          child: AdaptiveCard(color: AdpColors.red),
        ),
        SizedBox(
          width: 150.0,
          height: 150.0,
          child: AdaptiveCard(color: AdpColors.green),
        ),
      ],
    );
  }
}
