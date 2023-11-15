import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../../core/common/construct/properties.dart';
import '../../pulldown_item.dart';

class PulldownMenuMacos<T> extends StatelessWidget {
  const PulldownMenuMacos({
    super.key,
    this.property,
    this.onSelected,
    this.autofocus,
    this.focusNode,
    this.onOpen,
    this.disabled,
    this.disabledTitle,
    required this.title,
    required this.items,
  });

  /// Additional properties for configuring the appearance and behavior of the pulldown menu.
  final PulldownMenuMacosProperty? property;

  /// The title text to be displayed on the pulldown button.
  final String title;

  /// Callback function invoked when a menu item is selected. The generic type `T` represents the type of the selected value.
  final ValueChanged<T?>? onSelected;

  /// The list of menu items to be displayed in the menu.
  ///
  /// Use:
  /// * [AdaptivePulldownMenuItem] for selectable items.
  /// * [AdaptivePulldownMenuDivider] for visual separators.
  final List<AdaptivePulldownMenuItemEntry> items;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// The focus node to control the focus behavior of the pulldown menu.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  /// If true, the pulldown menu will automatically focus when displayed.
  final bool? autofocus;

  /// If [disabled] is true, the pulldown button will not be clickable.
  /// If null, the [title] will be used as a fallback.
  final String? disabledTitle;

  /// If true, the pulldown button won't be clickable. Default is false.
  final bool? disabled;

  /// Callback function invoked when the pulldown button is tapped.
  /// The callback will not be invoked if the pulldown button is disabled.
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    return MacosPulldownButton(
      title: title,
      onTap: onOpen,
      focusNode: focusNode,
      style: property?.style,
      autofocus: autofocus ?? false,
      disabledTitle: disabledTitle ?? title,
      itemHeight: property?.itemHeight ?? 30.0,
      items: disabled == true ? [] : _buildListItems(),
      menuAlignment: property?.menuAlignment ?? PulldownMenuAlignment.left,
    );
  }

  List<MacosPulldownMenuEntry> _buildListItems() {
    return List.generate(
      items.length,
      (index) {
        final item = items[index];
        if (item is AdaptivePulldownMenuItem<T?>) {
          return MacosPulldownMenuItem(
            title: item.buildListTile,
            enabled: item.selected,
            onTap: () {
              onSelected?.call(item.value);
              item.onTap?.call();
            },
          );
        } else {
          return const MacosPulldownMenuDivider();
        }
      },
    );
  }
}

class PulldownMenuMacosProperty extends CoreMacosProperty {
  const PulldownMenuMacosProperty({
    this.style,
    this.itemHeight,
    this.menuAlignment,
  });

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

  /// Defines the pulldown menu's alignment relevant to the button.
  ///
  /// Defaults to [PulldownMenuAlignment.left].
  final PulldownMenuAlignment? menuAlignment;
}
