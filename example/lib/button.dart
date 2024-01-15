import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';

class BaseButtonsScreen extends StatelessWidget {
  const BaseButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AdaptiveButton(
            child: const Text('Open Url'),
            onPressed: () {},
          ),
          AdaptiveButton.filled(
            child: const Text('Open Url'),
            onPressed: () {},
          ),
          AdaptiveButton.outlined(
            child: const Text('Open Url'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}