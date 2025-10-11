import 'package:adp_desktop/src/core/extension/widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../buttons/menu/pulldown/pulldown_item.dart';

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

class AdaptiveActionCustomItem extends AdaptiveActionEntry {
  const AdaptiveActionCustomItem({required this.child});

  final Widget child;
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
    required this.icon,
    required this.label,
  }) : assert(items.length > 0, 'You must provide at least one item');

  /// The icon data representing the pulldown button.
  final IconData icon;

  /// message to be displayed as a tooltip for the pulldown button.
  final String label;

  /// The list of items to be displayed in the pulldown menu.
  final List<AdaptiveActionPulldownMenuItemEntry> items;

  @override
  ToolBarPullDownButton toMacos(BuildContext context) {
    return ToolBarPullDownButton(
      icon: icon,
      label: label,
      tooltipMessage: label,
      items: items
          .map((e) {
            if (e is AdaptiveActionPulldownItem) {
              final enabled = e.enabled;
              return MacosPulldownMenuItem(
                onTap: () {
                  Future.delayed(
                    const Duration(microseconds: 100),
                    () => e.onTap?.call(),
                  );
                },
                label: _extractLabel(e),
                title: e.buildListTile(context),
                enabled: enabled != null ? !enabled : true,
              );
            }
            return const MacosPulldownMenuDivider();
          })
          .whereType<MacosPulldownMenuEntry>()
          .toList(),
    );
  }

  String? _extractLabel(AdaptivePulldownMenuItemEntry e) {
    if (e is AdaptiveActionPulldownItem) {
      if (e.child is Text) {
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
    final theme = FluentTheme.of(context);
    return Tooltip(
      message: label,
      child: DropDownButton(
        closeAfterClick: true,
        buttonBuilder: (context, onOpen) {
          return Button(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(LinearBorder.none)),
            onPressed: onOpen,
            child: Builder(
              builder: (context) {
                final state = HoverButton.of(context).states;

                return IconTheme.merge(
                  data: const IconThemeData(size: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(icon),
                      const SizedBox(width: 6.0),
                      IconTheme.merge(
                        data: IconThemeData(
                          color: state.isDisabled
                              ? theme.resources.textFillColorDisabled
                              : state.isPressing
                                  ? theme.resources.textFillColorTertiary
                                  : state.isHovering
                                      ? theme.resources.textFillColorSecondary
                                      : theme.resources.textFillColorPrimary,
                        ),
                        child: AnimatedSlide(
                          duration: theme.fastAnimationDuration,
                          curve: Curves.easeInCirc,
                          offset: state.isPressing
                              ? const Offset(0, 0.1)
                              : Offset.zero,
                          child: const ChevronDown(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
        items: items
            .map(
              (item) {
                if (item is AdaptiveActionPulldownItem) {
                  final isDisabled = item.enabled ?? false;

                  onItemPressed() {
                    Future.delayed(const Duration(microseconds: 100), () {
                      item.onTap?.call();
                    });
                  }

                  return MenuFlyoutItem(
                    text: item.child.applyDisabledEffect(isDisabled),
                    trailing: item.trailing?.applyDisabledEffect(isDisabled),
                    leading: item.leading?.applyDisabledEffect(isDisabled),
                    onPressed: isDisabled ? null : onItemPressed,
                  );
                }
                return const MenuFlyoutSeparator();
              },
            )
            .whereType<MenuFlyoutItemBase>()
            .toList(),
      ),
    );
  }
}

abstract class AdaptiveActionPulldownMenuItemEntry {
  const AdaptiveActionPulldownMenuItemEntry();
}

class AdaptiveActionPulldownItem extends AdaptivePulldownMenuItem
    implements AdaptiveActionPulldownMenuItemEntry {
  const AdaptiveActionPulldownItem({
    super.onTap,
    super.enabled,
    super.leading,
    super.trailing,
    required super.child,
  });
}

class AdaptiveActionPulldownDivider
    extends AdaptiveActionPulldownMenuItemEntry {
  const AdaptiveActionPulldownDivider();
}
