import 'package:adp_desktop/adp_desktop.dart';

class IconPreview extends StatelessWidget {
  const IconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveIcon(AdpIcons.add),
        AdaptiveIcon(AdpIcons.edit),
        AdaptiveIcon(AdpIcons.delete),
      ],
    );
  }
}
