import 'package:flutter/material.dart';

import '../../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';
import 'popup_item.dart';

/// A function type for building a list of widgets to customize the appearance of popup buttons.
///
/// The function takes a [BuildContext] as a parameter and should return a list of widgets.
/// This type is commonly used as a callback to dynamically customize the widgets displayed
/// in a popup button.
///
/// Example usage:
/// ```dart
/// PopupMenuButtonBuilder myBuilder = (BuildContext context) {
///   return [
///     Text('Widget 1'),
///     Icon(Icons.star),
///   ];
/// };
/// ```
typedef PopupMenuButtonBuilder = List<Widget> Function(BuildContext context);

/// A cross-platform adaptive popup menu button.
///
/// This widget serves as a unified interface for creating popup menu buttons
/// that seamlessly work across both macOS and Windows platforms.
///
/// - On macOS, [MacosPopupButton] is utilized.
/// - On Windows, [ComboBox] is used.
///
/// Example usage:
/// ```dart
/// AdaptivePopupMenuButton<String>(
///   value: selectedValue,
///   onChanged: (String? value) {
///     // Handle the selected value
///   },
///   items: [
///     AdaptivePopupMenuItem<String>(child: Text('Item 1'), value: 'value1'),
///     AdaptivePopupMenuItem<String>(child: Text('Item 2'), value: 'value2'),
///     // Add more menu items as needed
///   ],
/// );
/// ```

class AdaptivePopupMenuButton<T> extends CoreAdaptiveComponent {
  const AdaptivePopupMenuButton({
    super.key,
    super.builders,
    this.onTap,
    this.style,
    this.onChanged,
    this.popupColor,
    this.focusNode,
    this.autofocus,
    this.placeholder,
    this.disabledPlaceholder,
    this.selectedItemBuilder,
    required this.value,
    required this.items,
  });

  /// The value of the currently selected menu item.
  final T value;

  /// A list of [AdaptivePopupMenuItem] instances representing the items in the menu.
  ///
  /// The generic type parameter `T` indicates the type of values represented by the menu items.
  /// The list contains instances of [AdaptivePopupMenuItem], each defining a menu item's
  /// appearance, behavior, and associated value.
  ///
  /// Example usage:
  /// ```dart
  /// List<AdaptivePopupMenuItem<String>> menuItems = [
  ///   AdaptivePopupMenuItem<String>(child: Text('Item 1'), value: 'value1'),
  ///   AdaptivePopupMenuItem<String>(child: Text('Item 2'), value: 'value2'),
  ///   // Add more menu items as needed
  /// ];
  /// ```
  final List<AdaptivePopupMenuItem<T>> items;

  /// Called when the user selects an item.
  final ValueChanged<T?>? onChanged;

  /// Called when the popup button is tapped.
  final VoidCallback? onTap;

  /// The background color of the popup menu.
  final Color? popupColor;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The text style to use for text in the popup button and the popup
  /// menu that appears when you tap the button.
  final TextStyle? style;

  /// A placeholder widget that is displayed by the popup button.
  final Widget? placeholder;

  /// A preferred placeholder widget that is displayed when the popup button is disabled.
  final Widget? disabledPlaceholder;

  /// A builder to customize the popup buttons corresponding to the
  /// [AdaptivePopupMenuItem]s in [items].
  final PopupMenuButtonBuilder? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    validateSelectedItem();
    return super.build(context);
  }

  @override
  Widget macos(BuildContext context) {
    return PopupMenuMacos<T>(
      item: items,
      style: style,
      onTap: onTap,
      value: value,
      hint: placeholder,
      focusNode: focusNode,
      autofocus: autofocus,
      onChanged: onChanged,
      popupColor: popupColor,
      disabledHint: disabledPlaceholder,
      selectedItemBuilder: selectedItemBuilder,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return PopupMenuWindows<T>(
      item: items,
      style: style,
      onTap: onTap,
      value: value,
      focusNode: focusNode,
      autofocus: autofocus,
      onChanged: onChanged,
      popupColor: popupColor,
      placeholder: placeholder,
      disabledPlaceholder: disabledPlaceholder,
      selectedItemBuilder: selectedItemBuilder,
    );
  }

  void validateSelectedItem() {
    assert(
      items.isNotEmpty,
      "Validation failed in the $this.\n"
      "The list of items should not be empty.",
    );

    assert(
      value != null,
      "Validation failed in the $this.\n"
      "The 'value' should not be null.",
    );

    final hasUniqueSelectedItem = items.where((e) => e.value == value).length == 1;

    assert(
      hasUniqueSelectedItem,
      "Validation failed in the $this.\n\n"
      "There should be exactly one item with the specified value.\n"
      "Ensure that there is one and only one AdaptivePopupMenuItem in the list with the specified value.",
    );
  }
}
