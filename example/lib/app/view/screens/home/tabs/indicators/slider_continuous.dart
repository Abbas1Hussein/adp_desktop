import 'package:adp_desktop/adp_desktop.dart';

class SliderContinuousPreview extends StatefulWidget {
  const SliderContinuousPreview({super.key});

  @override
  State<SliderContinuousPreview> createState() => _SliderContinuousPreviewState();
}

class _SliderContinuousPreviewState extends State<SliderContinuousPreview> {
  double currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveSlider(
      value: currentValue,
      onChanged: (value) {
        setState(() {
          currentValue = value;
        });
      },
    );
  }
}
