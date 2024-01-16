import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';

class BaseButtons extends StatelessWidget {
  const BaseButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveButton(
          child: const Text('Button'),
          onPressed: () {},
        ),
        AdaptiveButton.filled(
          child: const Text('Filled Button'),
          onPressed: () {},
        ),
        AdaptiveButton.outlined(
          child: const Text('Outlined Button'),
          onPressed: () {},
        ),
      ],
    );
  }
}