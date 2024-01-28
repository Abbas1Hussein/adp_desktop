import 'package:adp_desktop/adp_desktop.dart';

class SliderDiscretePreview extends StatefulWidget {
  const SliderDiscretePreview({super.key});

  @override
  State<SliderDiscretePreview> createState() => _SliderDiscretePreviewState();
}

class _SliderDiscretePreviewState extends State<SliderDiscretePreview> {
  double currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveSlider(
      divisions: 15,
      divisionsItems: List.generate(15, (index) => Text('${index + 1}')),
      value: currentValue,
      onChanged: (value) {
        setState(() {
          currentValue = value;
        });
      },
    );
  }
}
