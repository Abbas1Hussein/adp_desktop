import 'package:adp_desktop/adp_desktop.dart';

import 'icon_button.dart';

class IconThemePreview extends StatelessWidget {
  const IconThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveIconTheme(
      data: AdaptiveIconThemeData(color: AdpColors.red, size: 25.0),
      child: const IconButtonPreview(),
    );
  }
}
