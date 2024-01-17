import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';
import 'pulldown_item.dart';
import 'single_choice.dart';

/// A pulldown menu button is used to create a nice overlay on the screen,
/// that allows the user to select any item from multiple options.
///
/// Use a pull-down button to present a list of commands.
///
/// - On macOS, [MacosPulldownButton] is utilized.
/// - On Windows, [DropDownButton] is used.
class AdaptivePulldownMenuButton<T> extends CoreAdaptiveComponent<
    PulldownMenuWindowsProperty, PulldownMenuMacosProperty> {
  /// Creates an instance of AdaptivePulldownMenuButton.
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
  ///       leading: AdaptiveIcon(AdpIcons.folderAdd),
  ///       child: Text('New folder'),
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.folderOpen),
  ///       child: Text('Open'),
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.wand),
  ///       child: Text('Open with'),
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.delete),
  ///       child: Text('Remove'),
  ///       enabled: false, // this will disabled.
  ///     ),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.phone),
  ///       child: Text('Import from phone ...'),
  ///     ),
  ///     AdaptivePulldownMenuDivider(),
  ///     AdaptivePulldownMenuItem(
  ///       leading: AdaptiveIcon(AdpIcons.star),
  ///       child: Text('Give us a star'),
  ///     ),
  ///   ],
  /// );
  /// ```
  ///
  /// See also:
  ///
  /// * [AdaptivePulldownMenuButton.singleChoice] focuses on only one AdaptivePulldownMenuItem.
  /// * [AdaptivePopupMenuButton]
  const AdaptivePulldownMenuButton({
    super.key,
    super.builders,
    super.properties,
    this.onOpen,
    this.onSelected,
    this.focusNode,
    this.pulldownColor,
    this.autofocus = false,
    this.disabled = false,
    this.disabledTitle,
    required this.title,
    required this.items,
  }) : _type = SelectionType.none;

  /// When used, will focus on only one [AdaptivePulldownMenuItem].
  ///
  /// If [AdaptivePulldownMenuItem.enabled] is true, it will be focused.
  ///
  /// - Should be exactly one item with the specified 'enabled' value set to true.
  ///
  /// Example:
  /// ```dart
  /// AdaptivePulldownMenuItem(
  ///   enabled: true,
  ///   leading: AdaptiveIcon(AdpIcons.star),
  ///   child: Text('Give us a star'),
  /// ),
  /// ```
  const AdaptivePulldownMenuButton.singleChoice({
    super.key,
    super.builders,
    super.properties,
    this.onOpen,
    this.onSelected,
    this.focusNode,
    this.pulldownColor,
    this.autofocus = false,
    this.disabled = false,
    this.disabledTitle,
    required this.title,
    required this.items,
  }) : _type = SelectionType.single;

  /// The title text to be displayed on the pulldown button.
  final String title;

  /// The list of menu entries for the pull-down menu.
  ///
  /// Can be either [AdaptivePulldownMenuItem]s or [AdaptivePulldownMenuDivider]s.
  final List<AdaptivePulldownMenuItemEntry<T>> items;

  /// A callback function that is called when a menu item is selected.
  ///
  /// The callback will receive the value of the selected item as its argument.
  final PulldownMenuSelectedCallback<T>? onSelected;

  /// The pulldown color. If null,
  ///
  /// on windows: [FluentThemeData.menuColor] is used.
  /// on macos: [MacosPulldownButtonTheme.pulldownColor] is used.
  final Color? pulldownColor;

  /// {@macro flutter.widgets.Focus.autofocus}
  /// If true, the pulldown menu will automatically focus when displayed.
  ///
  /// Default is false.
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// The focus node to control the focus behavior of the pulldown menu.
  final FocusNode? focusNode;

  /// If true, the pulldown button won't be clickable.
  ///
  /// Default is false.
  final bool disabled;

  /// The text that is displayed when the pull-down is disabled.
  ///
  /// If the pulldown is [disabled], this is displayed as a
  /// title for the pull-down button.
  final String? disabledTitle;

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
  Widget windows(BuildContext context,
      [PulldownMenuWindowsProperty? property]) {
    return PulldownMenuWindows<T>(
      title: title,
      items: items,
      onOpen: onOpen,
      disabled: disabled,
      selectionType: _type,
      focusNode: focusNode,
      autofocus: autofocus,
      onSelected: onSelected,
      menuColor: pulldownColor,
      disabledTitle: disabledTitle,
      property: property,
    );
  }

  @override
  Widget macos(BuildContext context, [PulldownMenuMacosProperty? property]) {
    return PulldownMenuMacos<T>(
      title: title,
      items: items,
      onOpen: onOpen,
      disabled: disabled,
      selectionType: _type,
      focusNode: focusNode,
      autofocus: autofocus,
      onSelected: onSelected,
      pulldownColor: pulldownColor,
      disabledTitle: disabledTitle,
      property: property,
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
        return item.enabled ?? false;
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
