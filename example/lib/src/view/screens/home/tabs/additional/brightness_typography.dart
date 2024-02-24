import 'package:adp_desktop/adp_desktop.dart';

class BrightnessTypographyPreview extends StatelessWidget {
  const BrightnessTypographyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = AdaptiveBrightness.of(context);
    final typography = AdaptiveTypography.of(context);

    return SizedBox(
      width: double.infinity,
      child: AdaptiveCard(
        shape: ShapeDecoration(
          color: brightness.isDark ? AdpColors.gray : AdpColors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        child: Text(
          '${DummyText.generateQuestion} \n${DummyText.generateAnswer}',
          style: typography.body?.copyWith(fontSize: 12.5, color: Colors.white),
        ),
      ),
    );
  }
}
