import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/core.dart';
import '../../buttons.dart';

/// A function type for building a list of widgets to customize the appearance of popup buttons.
typedef PopupMenuButtonBuilder = List<Widget> Function(BuildContext context);

/// A pop-up button (often referred to as a pop-up menu) is a type of button
/// that, when clicked, displays a menu containing a list of mutually exclusive
/// choices.
/// A pop-up button includes a double-arrow indicator that alludes to the
/// direction in which the menu will appear (only vertical is currently
/// supported).
///
/// - On macOS, [MacosPopupButton] is utilized.
/// - On Windows, [ComboBox] is used.
///
/// The type `T` is the type of the [value] that each popup item represents.
/// All the entries in a given menu must represent values with consistent types.
/// Typically, an enum is used. Each [AdaptivePopupMenuButton] in [items] must be
/// specialized with that same type argument.
///
/// The [onChanged] callback should update a state variable that defines the
/// popup's value. It should also call [State.setState] to rebuild the
/// popup with the new value.
///
/// If the [onChanged] callback is null or the list of [items] is null
/// then the popup button will be disabled, i.e. its arrow will be
/// displayed in grey and it will not respond to input. A disabled button
/// will display the [disabledPlaceholder] widget if it is non-null. However, if
/// [disabledPlaceholder] is null and [placeholder] is non-null, the [placeholder] widget will
/// instead be displayed.
///
/// See also:
///
///  * [AdaptivePopupMenuItem], the class used to represent the [items]
class AdaptivePopupMenuButton<T> extends CoreAdaptiveComponent {
  /// Creates a adp-style popup button.
  ///
  /// The [items] must have distinct values. If [value] isn't null then it
  /// must be equal to one of the [AdaptivePopupMenuItem] values. If [items] or
  /// [onChanged] is null, the button will be disabled, the up-down caret
  /// icon will be greyed out.
  ///
  /// If [value] is null and the button is enabled, [placeholder] will be displayed
  /// if it is non-null.
  ///
  /// If [value] is null and the button is disabled, [disabledPlaceholder] will be displayed
  /// if it is non-null. If [disabledPlaceholder] is null, then [placeholder] will be displayed
  /// if it is non-null.
  ///
  /// The [autofocus] argument must not be null.
  ///
  /// The [popupColor] argument specifies the background color of the
  /// popup when it is open.
  const AdaptivePopupMenuButton({
    super.key,
    super.builders,
    this.onTap,
    this.style,
    this.onChanged,
    this.popupColor,
    this.focusNode,
    this.placeholder,
    this.isExpanded = false,
    this.autofocus = false,
    this.disabledPlaceholder,
    this.selectedItemBuilder,
    this.value,
    required this.items,
  });

  /// The value of the currently selected [AdaptivePopupMenuItem].
  ///
  /// If [value] is null and the button is enabled, [placeholder] will be displayed
  /// if it is non-null.
  ///
  /// If [value] is null and the button is disabled, [disabledPlaceholder] will be displayed
  /// if it is non-null. If [disabledPlaceholder] is null, then [placeholder] will be displayed
  /// if it is non-null.
  final T? value;

  /// The list of items the user can select.
  ///
  /// If the [onChanged] callback is null or the list of items is null
  /// then the popup button will be disabled, i.e. its arrow will be
  /// displayed in grey and it will not respond to input.
  final List<AdaptivePopupMenuItem<T>>? items;

  /// Called when the user selects an item.
  ///
  /// If the [onChanged] callback is null or the list of [AdaptivePopupMenuItem.items]
  /// is null then the popup button will be disabled, i.e. its up/down caret will
  /// be displayed in grey and it will not respond to input. A disabled button
  /// will display the [AdaptivePopupMenuItem.disabledPlaceholder] widget if it is non-null.
  /// If [AdaptivePopupMenuItem.disabledPlaceholder] is also null but [AdaptivePopupMenuItem.placeholder] is
  /// non-null, [AdaptivePopupMenuItem.placeholder] will instead be displayed.
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
  /// If it is not provided,
  /// on macOS: canvas color will be used.
  /// on windows: [Acrylic] color is used.
  final Color? popupColor;

  /// Set the combo box's inner contents to horizontally fill its parent.
  ///
  /// By default this button's inner width is the minimum size of its contents.
  /// If [isExpanded] is true, the inner width is expanded to fill its
  /// surrounding container.
  final bool isExpanded;

  /// The text style to use for text in the popup button and the popup
  /// menu that appears when you tap the button.
  ///
  /// To use a separate text style for selected item when it's displayed within
  /// the popup button, consider using [selectedItemBuilder].
  final TextStyle? style;

  /// A placeholder widget that is displayed by the popup button.
  ///
  /// If [value] is null and the popup is enabled ([items] and [onChanged] are non-null),
  /// this widget is displayed as a placeholder for the popup button's value.
  ///
  /// If [value] is null and the popup is disabled and [disabledPlaceholder] is null,
  /// this widget is used as the placeholder.
  final Widget? placeholder;

  /// A preferred placeholder widget that is displayed when the popup is disabled.
  ///
  /// If [value] is null, the popup is disabled ([items] or [onChanged] is null),
  /// this widget is displayed as a placeholder for the popup button's value.
  final Widget? disabledPlaceholder;

  /// A builder to customize the popup buttons corresponding to the
  /// [AdaptivePopupMenuItem]s in [items].
  ///
  /// When a [AdaptivePopupMenuItem] is selected, the widget that will be displayed
  /// from the list corresponds to the [AdaptivePopupMenuItem] of the same index
  /// in [items].
  ///
  /// If this callback is null, the [AdaptivePopupMenuItem] from [items]
  /// that matches [value] will be displayed.
  final PopupMenuButtonBuilder? selectedItemBuilder;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  bool get hasValue => value != null;

  @override
  Widget build(BuildContext context) {
    validateSelectedItem();
    return super.build(context);
  }

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return ComboBox<T>(
      value: value,
      onTap: onTap,
      style: style,
      onChanged: onChanged,
      focusNode: focusNode,
      autofocus: autofocus,
      popupColor: popupColor,
      isExpanded: isExpanded,
      selectedItemBuilder: selectedItemBuilder,
      placeholder: hasValue ? null : placeholder,
      disabledPlaceholder: hasValue ? null : disabledPlaceholder,
      items: items?.map((e) => e.toWindows(context)).toList(),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return SizedBox(
      height: isExpanded ? 28.0 : null,
      width: isExpanded ? double.infinity : null,
      child: MacosPopupButton<T>(
        value: value,
        onTap: onTap,
        style: style,
        onChanged: onChanged,
        focusNode: focusNode,
        autofocus: autofocus,
        popupColor: popupColor,
        selectedItemBuilder: selectedItemBuilder,
        hint: hasValue ? null : placeholder,
        disabledHint: hasValue ? null : disabledPlaceholder,
        itemHeight: isExpanded ? 28.0 : 24.0,
        items: items?.map((e) => e.toMacos(context)).toList(),
      ).applyDisabledEffect(onChanged == null),
    );
  }

  void validateSelectedItem() {
    if (value != null && (items != null && items!.isNotEmpty)) {
      final selectedItemCount = items!.where((e) => e.value == value).length;
      final hasUniqueSelectedItem = selectedItemCount == 1;

      assert(
        hasUniqueSelectedItem,
        "Validation failed in $runtimeType.\n\n"
        "Exactly one item with the specified value should be present.\n"
        'Current value: $value must equal one of the AdaptivePopupMenuItem values, and values must be unique.\n'
        "Ensure that there is one unique AdaptivePopupMenuItem in the list with the specified value, and the current value matches it.",
      );
    }
  }
}
