import 'package:adp_desktop/adp_desktop.dart';

class IconButtonPreview extends StatelessWidget {
  const IconButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveIconButton(
          onPressed: () {},
          icon: const AdaptiveIcon(AdpIcons.add),
        ),
        AdaptiveIconButton(
          onPressed: () {},
          icon: const AdaptiveIcon(AdpIcons.edit),
        ),
        AdaptiveIconButton(
          onPressed: () {},
          icon: const AdaptiveIcon(AdpIcons.delete),
        ),
      ],
    );
  }
}
