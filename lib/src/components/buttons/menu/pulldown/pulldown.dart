import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';
import 'pulldown_item.dart';
import 'single_choice.dart';

/// Callback type for handling the selection of items in a pulldown menu.
///
/// The [value] parameter represents the selected value of generic type [T].
typedef PulldownMenuSelectedCallback<T> = void Function(T? value);

/// A cross-platform adaptive pulldown menu button.
///
/// This widget serves as a unified interface for creating pulldown menu button.
/// that seamlessly work across both macOS and Windows platforms.
///
/// - On macOS, [MacosPulldownButton] is utilized.
/// - On Windows, [DropDownButton] is used.
///
/// Example usage:
///
/// ```dart
/// AdaptivePulldownMenuButton<String>(
///   title: 'Adp Menu',
///   onSelected: (String? value) {
///     // Handle the selected value
///   },
///   items: const [
///     AdaptivePulldownMenuItem(
///       leading: AdaptiveIcon(AdaptiveIcons.folderAdd),
///       child: Text('New folder'),
///     ),
///     AdaptivePulldownMenuItem(
///       leading: AdaptiveIcon(AdaptiveIcons.folderOpen),
///       child: Text('Open'),
///     ),
///     AdaptivePulldownMenuItem(
///       leading: AdaptiveIcon(AdaptiveIcons.wand),
///       child: Text('Open with'),
///     ),
///     AdaptivePulldownMenuItem(
///       leading: AdaptiveIcon(AdaptiveIcons.delete),
///       child: Text('Remove'),
///       selected: false,
///     ),
///     AdaptivePulldownMenuItem(
///       leading: AdaptiveIcon(AdaptiveIcons.phone),
///       child: Text('Import from phone ...'),
///     ),
///     AdaptivePulldownMenuDivider(),
///     AdaptivePulldownMenuItem(
///       leading: AdaptiveIcon(AdaptiveIcons.star),
///       child: Text('Give us a star'),
///     ),
///   ],
/// );
/// ```
class AdaptivePulldownMenuButton<T> extends CoreAdaptiveComponent<
    PulldownMenuWindowsProperty, PulldownMenuMacosProperty> {
  const AdaptivePulldownMenuButton({
    super.key,
    super.builders,
    super.properties,
    this.onOpen,
    this.onSelected,
    this.focusNode,
    this.autofocus = false,
    this.disabled = false,
    this.disabledTitle,
    required this.title,
    required this.items,
  }) : _type = SelectionType.none;

  /// When used, this constructor will focus on only one [AdaptivePulldownMenuItem].
  ///
  /// If [selected] is true, it will be focused.
  ///
  /// Example:
  /// ```dart
  /// AdaptivePulldownMenuItem(
  ///   selected: true,
  ///   leading: AdaptiveIcon(AdaptiveIcons.star),
  ///   child: Text('Give us a star'),
  /// ),
  /// ```
  /// - Should be exactly one item with the specified 'selected' value set to true.
  ///
  /// The default selected value for [AdaptivePulldownMenuItem] is false.
  const AdaptivePulldownMenuButton.singleChoice({
    super.key,
    super.builders,
    super.properties,
    this.onOpen,
    this.onSelected,
    this.focusNode,
    this.autofocus = false,
    this.disabled = false,
    this.disabledTitle,
    required this.title,
    required this.items,
  }) : _type = SelectionType.single;

  /// The title text to be displayed on the pulldown button.
  final String title;

  /// The list of menu items to be displayed in the menu.
  ///
  /// Use:
  /// * [AdaptivePulldownMenuItem] for selectable items.
  /// * [AdaptivePulldownMenuDivider] for visual separators.
  final List<AdaptivePulldownMenuItemEntry<T>> items;

  /// A callback function that is called when a menu item is selected.
  ///
  /// The callback will receive the value of the selected item as its argument.
  final PulldownMenuSelectedCallback<T>? onSelected;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// The focus node to control the focus behavior of the pulldown menu.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  /// If true, the pulldown menu will automatically focus when displayed.
  ///
  /// Default is false.
  final bool autofocus;

  /// A custom title to be displayed when the button is disabled.
  ///
  /// If null, the [title] will be used as a fallback.
  final String? disabledTitle;

  /// If true, the pulldown button won't be clickable.
  ///
  /// Default is false.
  final bool disabled;

  /// Called when the pull-down button is tapped.
  ///
  /// The callback will not be invoked if the pull-down button is disabled.
  final VoidCallback? onOpen;

  /// The selection type for the pulldown menu button.
  ///
  /// - `SelectionType.single`: Enables single-item selection.
  /// - `SelectionType.none`: No item is selected by default.
  final SelectionType _type;

  @override
  Widget build(BuildContext context) {
    validateSelectedItem();
    return super.build(context);
  }

  @override
  Widget windows(BuildContext context) {
    return PulldownMenuWindows<T>(
      title: title,
      items: items,
      onOpen: onOpen,
      disabled: disabled,
      selectionType: _type,
      focusNode: focusNode,
      autofocus: autofocus,
      onSelected: onSelected,
      disabledTitle: disabledTitle,
      property: properties?.windows,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return PulldownMenuMacos<T>(
      title: title,
      items: items,
      onOpen: onOpen,
      disabled: disabled,
      selectionType: _type,
      focusNode: focusNode,
      autofocus: autofocus,
      onSelected: onSelected,
      disabledTitle: disabledTitle,
      property: properties?.macos,
    );
  }

  void validateSelectedItem() {
    assert(
      items.isNotEmpty,
      "Validation failed in the $runtimeType.\n"
      "The list of items should not be empty.",
    );

    if (_type == SelectionType.single) {
      // Filter items to include only selected items (if applicable)
      final selectedItems =
          items.whereType<AdaptivePulldownMenuItem<T?>>().where((item) {
        return item.selected ?? false;
      });

      // Check if there is exactly one selected item
      final hasUniqueSelectedItem = selectedItems.length == 1;

      assert(
        hasUniqueSelectedItem,
        "Validation failed in $runtimeType.\n\n"
        "There should be exactly one item with the specified 'selected' value set to true.\n"
        "Ensure that there is only one AdaptivePulldownMenuItem in the list with 'selected: true'.",
      );
    }
  }
}
