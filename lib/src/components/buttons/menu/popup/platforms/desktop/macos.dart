import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../popup_item.dart';

class PopupMenuMacos<T> extends StatelessWidget {
  const PopupMenuMacos({
    super.key,
    this.value,
    this.onTap,
    this.style,
    this.onChanged,
    this.popupColor,
    this.focusNode,
    this.autofocus,
    this.hint,
    this.disabledHint,
    this.selectedItemBuilder,
    required this.item,
  });

  /// A list of [AdaptivePopupMenuItem] instances representing the items in a menu.
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
  final List<AdaptivePopupMenuItem<T>> item;

  /// The value of the currently selected [MacosPopupMenuItem].
  ///
  /// If [value] is null and the button is enabled, [hint] will be displayed
  /// if it is non-null.
  ///
  /// If [value] is null and the button is disabled, [disabledHint] will be displayed
  /// if it is non-null. If [disabledHint] is null, then [hint] will be displayed
  /// if it is non-null.
  final T? value;

  /// Called when the user selects an item.
  ///
  /// If the [onChanged] callback is null or the list of [MacosPopupButton.items]
  /// is null then the popup button will be disabled, i.e. its up/down caret will
  /// be displayed in grey and it will not respond to input. A disabled button
  /// will display the [MacosPopupButton.disabledHint] widget if it is non-null.
  /// If [MacosPopupButton.disabledHint] is also null but [MacosPopupButton.hint] is
  /// non-null, [MacosPopupButton.hint] will instead be displayed.
  final ValueChanged<T?>? onChanged;

  /// Called when the popup button is tapped.
  ///
  /// This is distinct from [onChanged], which is called when the user
  /// selects an item from the popup.
  ///
  /// The callback will not be invoked if the popup button is disabled.
  final VoidCallback? onTap;

  /// The background color of the popup.
  ///
  /// If it is not provided, the the appropriate macOS canvas color
  /// will be used.
  final Color? popupColor;

  /// A builder to customize the popup buttons corresponding to the
  /// [MacosPopupMenuItem]s in [items].
  ///
  /// When a [MacosPopupMenuItem] is selected, the widget that will be displayed
  /// from the list corresponds to the [MacosPopupMenuItem] of the same index
  /// in [items].
  ///
  /// If this callback is null, the [MacosPopupMenuItem] from [items]
  /// that matches [value] will be displayed.
  final MacosPopupButtonBuilder? selectedItemBuilder;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// The text style to use for text in the popup button and the popup
  /// menu that appears when you tap the button.
  ///
  /// To use a separate text style for selected item when it's displayed within
  /// the popup button, consider using [selectedItemBuilder].
  ///
  /// Defaults to MacosTheme.of(context).typography.body.
  final TextStyle? style;

  /// A placeholder widget that is displayed by the popup button.
  ///
  /// If [value] is null and the popup is enabled ([items] and [onChanged] are non-null),
  /// this widget is displayed as a placeholder for the popup button's value.
  ///
  /// If [value] is null and the popup is disabled and [disabledHint] is null,
  /// this widget is used as the placeholder.
  final Widget? hint;

  /// A preferred placeholder widget that is displayed when the popup is disabled.
  ///
  /// If [value] is null, the popup is disabled ([items] or [onChanged] is null),
  /// this widget is displayed as a placeholder for the popup button's value.
  final Widget? disabledHint;

  @override
  Widget build(BuildContext context) {
    return MacosPopupButton<T>(
      hint: hint,
      value: value,
      onTap: onTap,
      style: style,
      onChanged: onChanged,
      focusNode: focusNode,
      popupColor: popupColor,
      disabledHint: disabledHint,
      autofocus: autofocus ?? false,
      selectedItemBuilder: selectedItemBuilder,
      items: item.map((e) => e.toMacosPopupMenuItem()).toList(),
    );
  }
}
