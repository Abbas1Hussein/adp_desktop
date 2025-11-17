import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart' show Icons;

class CircularProgressIndicatorPreview extends StatefulWidget {
  const CircularProgressIndicatorPreview({super.key});

  @override
  State<CircularProgressIndicatorPreview> createState() =>
      _CircularProgressIndicatorPreviewState();
}

class _CircularProgressIndicatorPreviewState
    extends State<CircularProgressIndicatorPreview> {
  double currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AdaptiveCircularProgressIndicator(),
        _buildIncreaseDecrease(
          child: AdaptiveCircularProgressIndicator(value: currentValue),
        ),
      ],
    );
  }

  Widget _buildIncreaseDecrease({required Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AdaptiveIconButton(
          onPressed: () {
            setState(() => currentValue += 25);
          },
          icon: const AdaptiveIcon(AdpIcons.add),
        ),
        const SizedBox(width: 8.0),
        child,
        const SizedBox(width: 8.0),
        AdaptiveIconButton(
          onPressed: () {
            setState(() => currentValue -= 25);
          },
          icon: const AdaptiveIcon.all(Icons.remove),
        ),
      ],
    );
  }
}
