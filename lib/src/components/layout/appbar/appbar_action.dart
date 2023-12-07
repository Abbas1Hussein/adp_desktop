import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/extension/widget.dart';
import '../../buttons/menu/pulldown/pulldown_item.dart';

abstract class AdaptiveAppBarActionEntry {
  const AdaptiveAppBarActionEntry();
}

class AdaptiveAppBarIconButton extends AdaptiveAppBarActionEntry {
  AdaptiveAppBarIconButton({
    required this.label,
    required this.icon,
    this.onPressed,
    this.tooltipMessage,
  });

  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltipMessage;

  ToolBarIconButton toToolBarIconButton() {
    return ToolBarIconButton(
      icon: icon,
      label: label,
      onPressed: onPressed,
      tooltipMessage: tooltipMessage,
      showLabel: true,
    );
  }

  Widget toIconButton() {
    return Tooltip(
      message: tooltipMessage,
      richMessage: TextSpan(text: tooltipMessage),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconButtonMode: IconButtonMode.small,
      ).margeWith(Text(label), 1.0),
    );
  }
}

class AdaptiveAppBarPulldownButton extends AdaptiveAppBarActionEntry {
  final List<AdaptivePulldownMenuItemEntry> items;

  final String label;

  final IconData icon;

  AdaptiveAppBarPulldownButton({
    required this.items,
    required this.label,
    required this.icon,
  });

  ToolBarPullDownButton toToolBarPulldownButton() {
    return ToolBarPullDownButton(
      label: label,
      icon: icon,
      items: items
          .map((e) {
            if (e is AdaptivePulldownMenuItem) {
              return MacosPulldownMenuItem(
                title: e.buildListTile(),
                onTap: e.onTap,
                enabled: e.selected ?? false,
              );
            }
            return const MacosPulldownMenuDivider();
          })
          .whereType<MacosPulldownMenuEntry>()
          .toList(),
    );
  }

  DropDownButton toDropDownButton() {
    return DropDownButton(
      title: Text(label),
      items: items
          .map((e) {
            if (e is AdaptivePulldownMenuItem) {
              return MenuFlyoutItem(
                text: e.child,
                leading: e.leading,
                trailing: e.trailing,
                onPressed: e.onTap,
                selected: e.selected ?? false,
              );
            }
            return const MenuFlyoutSeparator();
          })
          .whereType<MenuFlyoutItemBase>()
          .toList(),
    );
  }
}

class AdaptiveAppBarSpacer extends AdaptiveAppBarActionEntry {}

class AdaptiveAppBarCustomItem extends AdaptiveAppBarActionEntry {
  const AdaptiveAppBarCustomItem({required this.child});

  final Widget child;
}
