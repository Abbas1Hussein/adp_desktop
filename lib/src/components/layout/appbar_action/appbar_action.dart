import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../buttons/menu/pulldown/pulldown_item.dart';
import '../../icon/icons.dart';

/// An abstract class representing an entry in the adaptive action.
///
/// Subclasses:
/// - [AdaptiveActionDivider].
/// - [AdaptiveActionButton].
/// - [AdaptiveActionPulldownButton].
/// - [AdaptiveActionCustomItem].
abstract class AdaptiveActionEntry {
  const AdaptiveActionEntry();
}

class AdaptiveActionDivider extends AdaptiveActionEntry
    implements CoreModel<Widget, ToolBarDivider> {
  const AdaptiveActionDivider();

  @override
  ToolBarDivider toMacos(BuildContext context) {
    return const ToolBarDivider();
  }

  @override
  Widget toWindows(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Divider(size: 10.0, direction: Axis.vertical),
    );
  }
}

class AdaptiveActionButton extends AdaptiveActionEntry
    implements CoreModel<Widget, ToolBarIconButton> {
  const AdaptiveActionButton({
    this.onPressed,
    this.showLabel = true,
    this.tooltipMessage,
    required this.label,
    required this.icon,
  });

  /// The label text for the icon button.
  final String label;

  /// The icon widget representing the button.
  ///
  /// Usually an [AdaptiveIcon] widget.
  final Widget icon;

  /// A flag indicating whether to show the label text.
  final bool showLabel;

  /// A callback function to be executed when the icon button is pressed.
  final VoidCallback? onPressed;

  /// An optional message to be displayed as a tooltip for the icon button.
  final String? tooltipMessage;

  @override
  ToolBarIconButton toMacos(BuildContext context) {
    return ToolBarIconButton(
      icon: icon,
      label: label,
      showLabel: showLabel,
      onPressed: onPressed,
      tooltipMessage: tooltipMessage ?? label,
    );
  }

  @override
  Widget toWindows(BuildContext context) {
    return Tooltip(
      message: tooltipMessage ?? label,
      child: CommandBarButton(
        icon: icon,
        onPressed: onPressed,
        label: showLabel ? Text(label) : null,
      ).build(
        context,
        CommandBarItemDisplayMode.inPrimary,
      ),
    );
  }
}

class AdaptiveActionPulldownButton extends AdaptiveActionEntry
    implements CoreModel<Widget, ToolBarPullDownButton> {
  const AdaptiveActionPulldownButton({
    required this.items,
    required this.label,
    required this.icon,
    this.tooltipMessage,
  }) : assert(items.length > 0, 'You must provide at least one item');

  /// The label text for the pulldown button.
  final String label;

  /// The icon data representing the pulldown button.
  final AdpIcons icon;

  /// An optional message to be displayed as a tooltip for the pulldown button.
  final String? tooltipMessage;

  /// The list of items to be displayed in the pulldown menu.
  final List<AdaptivePulldownMenuItemEntry<void>> items;

  @override
  ToolBarPullDownButton toMacos(BuildContext context) {
    return ToolBarPullDownButton(
      label: label,
      icon: icon.cupertino,
      tooltipMessage: tooltipMessage ?? label,
      items: items
          .map((e) {
            if (e is AdaptivePulldownMenuItem) {
              return MacosPulldownMenuItem(
                onTap: e.onTap,
                label: _extractLabel(e),
                title: e.buildListTile(context),
                enabled: e.enabled ?? false,
              );
            }
            return const MacosPulldownMenuDivider();
          })
          .whereType<MacosPulldownMenuEntry>()
          .toList(),
    );
  }

  String? _extractLabel(AdaptivePulldownMenuItemEntry e) {
    if (e is AdaptivePulldownMenuItem) {
      if (e.value is String) {
        return e.value.toString();
      } else if (e.child is Text) {
        return (e.child as Text).data;
      } else if (e.leading is Text) {
        return (e.leading as Text).data;
      } else if (e.trailing is Text) {
        return (e.trailing as Text).data;
      }
    }
    return '';
  }

  @override
  Widget toWindows(BuildContext context) {
    return Tooltip(
      message: tooltipMessage ?? label,
      child: DropDownButton(
        title: Text(label),
        leading: Icon(icon.fluent),
        items: items
            .map((e) {
              if (e is AdaptivePulldownMenuItem) {
                return MenuFlyoutItem(
                  text: e.child,
                  leading: e.leading,
                  trailing: e.trailing,
                  onPressed: e.onTap,
                  selected: e.enabled ?? false,
                );
              }
              return const MenuFlyoutSeparator();
            })
            .whereType<MenuFlyoutItemBase>()
            .toList(),
      ),
    );
  }
}

class AdaptiveActionCustomItem extends AdaptiveActionEntry {
  const AdaptiveActionCustomItem({required this.child});

  /// The custom widget to be included as the item.
  final Widget child;
}
