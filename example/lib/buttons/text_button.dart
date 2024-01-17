import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';

class TextButton extends StatelessWidget {
  const TextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTextButton(
      child: const Text('text button'),
      onPressed: () {},
    );
  }
}
