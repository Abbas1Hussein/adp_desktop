import 'package:adp_desktop/adp_desktop.dart';

class BasicButtonsPreview extends StatelessWidget {
  const BasicButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AdaptiveButton(child: const Text('Base Button'), onPressed: () {}),
        AdaptiveButton.filled(
          child: const Text('Filled Button'),
          onPressed: () {},
        ),
        AdaptiveButton.outlined(
          child: const Text('Outlined Button'),
          onPressed: () {},
        ),
        AdaptiveTextButton(child: const Text('Text Button'), onPressed: () {}),
        AdaptiveIconButton(
          icon: const AdaptiveIcon(AdpIcons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}
