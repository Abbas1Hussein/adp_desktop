import 'package:flutter/material.dart';

import '../../../../core/common/construct/component.dart';
import 'pulldown_item.dart';

import 'platforms/platforms.dart';

/// A custom menu widget that adapts its appearance based on the platform.
///
/// Use this widget to create menus with platform-specific styling and behavior.
/// It supports macOS, Windows.

typedef MenuItemSelectedCallback<T> = void Function(T? value);

class AdaptivePulldownMenuButton<T> extends CoreAdaptiveComponent<PulldownMenuWindowsProperty, PulldownMenuMacosProperty> {
  const AdaptivePulldownMenuButton({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.onItemSelected,
    required this.items,
  }) : assert(items.length != 0, 'The items list must not be empty');

  final String? title;

  /// The list of menu items to be displayed in the menu.
  final List<AdaptivePulldownMenuItemEntry<T>> items;

  /// A callback function that is called when a menu item is selected.
  ///
  /// The callback will receive the value of the selected item as its argument.
  final MenuItemSelectedCallback<T>? onItemSelected;

  @override
  Widget windows(BuildContext context) {
    return PulldownMenuWindows<T>(
      items: items,
      title: title,
      property: properties?.windows,
      onItemPressed: onItemSelected,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return PulldownMenuMacos<T>(
      items: items,
      title: title,
      property: properties?.macos,
      onItemPressed: onItemSelected,
    );
  }
}
