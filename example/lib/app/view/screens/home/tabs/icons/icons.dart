import 'package:flutter/widgets.dart' hide IconTheme;

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'icon.dart';
import 'icon_all.dart';
import 'icon_button.dart';
import 'icon_from.dart';
import 'icon_theme.dart';

class IconsTab extends StatelessWidget {
  const IconsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        CustomTitle(
          path: HighlightPaths.icon,
          title: 'Icon',
          message: 'AdaptiveIcon: AdpIcons.add, AdpIcons.delete, AdpIcons.edit',
        ),
        IconPreview(),
        CustomTitle(
          path: HighlightPaths.iconFrom,
          title: 'Icon from',
          message:
              'AdaptiveIcon.from: we use it to add customize the icon for each platforms',
        ),
        IconFromPreview(),
        CustomTitle(
          path: HighlightPaths.iconAll,
          title: 'Icon all',
          message: 'AdaptiveIcon.all: we use it to apply one icon for all platforms',
        ),
        IconAllPreview(),
        CustomTitle(
          path: HighlightPaths.iconButton,
          title: 'Icon Button',
          message: 'AdaptiveIconButton,AdaptiveIcon: AdpIcons.add, AdpIcons.delete, AdpIcons.edit',
        ),
        IconButtonPreview(),
        CustomTitle(
          path: HighlightPaths.iconTheme,
          title: 'Icon Theme',
          message:
              'AdaptiveIconTheme: creates an adp icon theme that controls the color, opacity, and size of descendant widgets.',
        ),
        IconThemePreview(),
      ],
    );
  }
}
