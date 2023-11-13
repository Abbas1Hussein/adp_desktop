import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../../core/common/construct/properties.dart';
import '../../pulldown_item.dart';

class PulldownMenuMacos<T> extends StatelessWidget {
  final PulldownMenuMacosProperty? property;

  /// The list of menu items to be displayed in the menu.
  final List<AdaptivePulldownMenuItemEntry> items;

  final ValueChanged<T?>? onItemPressed;

  final String? title;

  const PulldownMenuMacos({
    super.key,
    this.title,
    this.property,
    this.onItemPressed,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    final menuLabel = localizations.menuBarMenuLabel.split(' ').last;
    return MacosPulldownButton(
      title: title ?? menuLabel,
      onTap: property?.onTap,
      style: property?.style,
      alignment: property?.alignment ?? AlignmentDirectional.bottomEnd,
      focusNode: property?.focusNode,
      autofocus: property?.autofocus ?? false,
      itemHeight: property?.itemHeight ?? 30.0,
      disabledTitle: property?.disabledTitle,
      menuAlignment: property?.menuAlignment ?? PulldownMenuAlignment.right,
      items: List.generate(
        items.length,
        (index) {
          final item = items[index];
          if (item is AdaptivePulldownMenuItem<T?>) {
            return MacosPulldownMenuItem(
              title: item.buildListTile,
              enabled: !item.selected,
              onTap: () => onItemPressed?.call(item.value),
            );
          } else {
            return const MacosPulldownMenuDivider();
          }
        },
      ),
    );
  }
}

class PulldownMenuMacosProperty extends CoreMacosProperty {
  /// The text that is displayed when the pull-down is disabled.
  ///
  /// If the pulldown is disabled ([items] is null), this is displayed as a
  /// title for the pull-down button.
  final String? disabledTitle;

  /// Called when the pull-down button is tapped.
  ///
  /// The callback will not be invoked if the pull-down button is disabled.
  final VoidCallback? onTap;

  /// The text style to use for text in the pull-down button and the pull-down
  /// menu that appears when you tap the button.
  ///
  /// Defaults to MacosTheme.of(context).typography.body.
  final TextStyle? style;

  /// If null, then the menu item heights will vary according to each menu
  /// item's intrinsic height.
  ///
  /// The default value is [_kMenuItemHeight], which is also the minimum
  /// height for menu items.
  final double? itemHeight;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// Defines how the title is positioned within the button.
  ///
  /// This property must not be null. It defaults to [AlignmentDirectional.centerStart].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry? alignment;

  /// Defines the pulldown menu's alignment relevant to the button.
  ///
  /// Defaults to [PulldownMenuAlignment.left].
  final PulldownMenuAlignment? menuAlignment;

  const PulldownMenuMacosProperty({
    this.disabledTitle,
    this.onTap,
    this.style,
    this.itemHeight,
    this.focusNode,
    this.autofocus,
    this.alignment,
    this.menuAlignment,
  });
}
