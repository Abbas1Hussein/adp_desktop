import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import 'menu_item.dart';
import 'platforms/platforms.dart';

/// A custom menu widget that adapts its appearance based on the platform.
///
/// Use this widget to create menus with platform-specific styling and behavior.
/// It supports macOS, Windows.
///
/// This widget allows you to define a callback function, [onItemSelected], which
/// will be invoked when a menu item is selected. The callback will receive the
/// value of the selected item as its argument.
typedef MenuItemSelectedCallback<T> = void Function(T? value);

class AdaptiveMenu<T> extends CoreAdaptiveComponent<MenuWindowsProperty, MenuMacosProperty> {
  final String? title;

  /// The list of menu items to be displayed in the menu.
  final List<AdaptiveMenuItemEntry<T>> items;

  /// A callback function that is called when a menu item is selected.
  final MenuItemSelectedCallback<T>? onItemSelected;

  const AdaptiveMenu({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.onItemSelected,
    required this.items,
  }): assert(items.length != 0, 'The items list must not be empty');


  @override
  Widget windows(BuildContext context) {
    return MenuWindows<T>(
      items: items,
      title: title,
      property: properties?.windows,
      onItemPressed: onItemSelected,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return MenuMacos<T>(
      items: items,
      title: title,
      property: properties?.macos,
      onItemPressed: onItemSelected,
    );
  }
}
