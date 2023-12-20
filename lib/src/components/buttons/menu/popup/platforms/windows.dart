import 'package:fluent_ui/fluent_ui.dart';

import '../popup_item.dart';

class PopupMenuWindows<T> extends StatelessWidget {
  const PopupMenuWindows({
    super.key,
    this.value,
    this.onTap,
    this.style,
    this.onChanged,
    this.popupColor,
    this.focusNode,
    this.autofocus,
    this.placeholder,
    this.disabledPlaceholder,
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

  /// The value of the currently selected [ComboBoxItem].
  ///
  /// If [value] is null and the button is enabled, [placeholder] will be displayed
  /// if it is non-null.
  ///
  /// If [value] is null and the button is disabled, [disabledPlaceholder] will be displayed
  /// if it is non-null. If [disabledPlaceholder] is null, then [placeholder] will be displayed
  /// if it is non-null.
  final T? value;

  /// Called when the user selects an item.
  ///
  /// If the [onChanged] callback is null or the list of [ComboBox.items]
  /// is null then the combo box button will be disabled, i.e. its arrow will be
  /// displayed in grey and it will not respond to input. A disabled button
  /// will display the [ComboBox.disabledPlaceholder] widget if it is non-null.
  /// If [ComboBox.disabledPlaceholder] is also null but [ComboBox.placeholder] is
  /// non-null, [ComboBox.placeholder] will instead be displayed.
  final ValueChanged<T?>? onChanged;

  /// Called when the combo box button is tapped.
  ///
  /// This is distinct from [onChanged], which is called when the user
  /// selects an item from the combo box.
  ///
  /// The callback will not be invoked if the combo box button is disabled.
  final VoidCallback? onTap;

  /// The background color of the combo box menu.
  ///
  /// If it is not provided, the default [Acrylic] color is used.
  final Color? popupColor;

  /// A builder to customize the combo box buttons corresponding to the
  /// [ComboBoxItem]s in [items].
  ///
  /// When a [ComboBoxItem] is selected, the widget that will be displayed
  /// from the list corresponds to the [ComboBoxItem] of the same index
  /// in [items].
  ///
  ///
  /// If this callback is null, the [ComboBoxItem] from [items]
  /// that matches [value] will be displayed.
  final ComboBoxBuilder? selectedItemBuilder;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// The text style to use for text in the combo box button and the combo box
  /// menu that appears when you tap the button.
  ///
  /// To use a separate text style for selected item when it's displayed within
  /// the combo box button, consider using [selectedItemBuilder].
  ///
  /// Defaults to the [Typography.body] value of the closest [FluentThemeData]
  final TextStyle? style;

  /// A placeholder widget that is displayed by the combo box button.
  ///
  /// If [value] is null and the combo box is enabled ([items] and [onChanged] are non-null),
  /// this widget is displayed as a placeholder for the combo box button's value.
  ///
  /// If [value] is null and the combo box is disabled and [disabledPlaceholder] is null,
  /// this widget is used as the placeholder.
  final Widget? placeholder;

  /// A preferred placeholder widget that is displayed when the combo box is disabled.
  ///
  /// If [value] is null, the combo box is disabled ([items] or [onChanged] is null),
  /// this widget is displayed as a placeholder for the combo box button's value.
  final Widget? disabledPlaceholder;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    return FluentTheme(
      data: theme.copyWith(
        acrylicBackgroundColor: popupColor,
        accentColor: popupColor?.toAccentColor(),
      ),
      child: ComboBox<T>(
        value: value,
        onTap: onTap,
        style: style,
        onChanged: onChanged,
        focusNode: focusNode,
        placeholder: placeholder,
        autofocus: autofocus ?? false,
        selectedItemBuilder: selectedItemBuilder,
        disabledPlaceholder: disabledPlaceholder,
        items: item.map((e) => e.toWindowsPopupMenuItem()).toList(),
      ),
    );
  }
}
