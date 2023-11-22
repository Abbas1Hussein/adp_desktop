import 'package:flutter/widgets.dart';

/// Represents an entry in an [AdaptiveMenu], which can be either a
/// [AdaptivePulldownMenuItem] or a [AdaptivePulldownMenuDivider].
abstract class AdaptivePulldownMenuItemEntry<T> {
  const AdaptivePulldownMenuItemEntry();
}

class AdaptivePulldownMenuDivider<T>
    implements AdaptivePulldownMenuItemEntry<T> {
  const AdaptivePulldownMenuDivider();
}

/// Represents a menu item in an [AdaptiveMenu].
class AdaptivePulldownMenuItem<T> extends AdaptivePulldownMenuItemEntry<T> {
  /// Creates a menu item with the specified content widget.
  ///
  /// The [child] parameter is required and represents the main content of the menu item.
  /// You can also provide optional [leading] and [trailing] widgets to be displayed
  /// before and after the main content, respectively. The [selected] parameter indicates
  /// whether the menu item is selected.
  const AdaptivePulldownMenuItem({
    this.leading,
    this.trailing,
    this.selected,
    this.onTap,
    this.value,
    required this.child,
  });

  /// The optional value associated with the menu item.
  ///
  /// This property can hold a value of any type 'T', and it can be nullable ('T?').
  /// It provides a way to associate data with the menu item, which can be
  /// handling item selection when callbacks.
  final T? value;

  /// The content widget of the menu item.
  final Widget child;

  /// An optional leading widget for the menu item.
  final Widget? leading;

  /// An optional trailing widget for the menu item.
  final Widget? trailing;

  /// Indicates whether the menu item is selected or not.
  ///
  /// - When used with [AdaptivePulldownMenuButton.singleChoice], if `true`, this item is the selected item.
  ///   Only one item should be set to `true`.
  ///
  ///  If null, Default is `false`.
  ///
  /// Example usage with AdaptivePulldownMenuButton.singleChoice:
  /// ```dart
  /// AdaptivePulldownMenuButton.singleChoice(
  ///   title: 'menu',
  ///   items: [
  ///     AdaptivePulldownMenuItem(
  ///       selected: true, // Only one item should be set to `true`.
  ///       leading: AdaptiveIcon(AdaptiveIcons.folderAdd),
  ///       child: Text('New folder'),
  ///     ),
  ///     // ... other menu items ...
  ///   ],
  /// );
  /// ```
  ///
  /// - When used with [AdaptivePulldownMenuButton], if set to `true`, the menu item is disabled.
  ///
  ///  If null, Default is `true`.
  ///
  /// Example usage with AdaptivePulldownMenuButton:
  /// ```dart
  /// AdaptivePulldownMenuButton(
  ///   title: 'menu',
  ///   items: [
  ///     AdaptivePulldownMenuItem(
  ///       selected: false, // item will be disabled.
  ///       leading: AdaptiveIcon(AdaptiveIcons.folderAdd),
  ///       child: Text('New folder'),
  ///     ),
  ///     // ... other menu items ...
  ///   ],
  /// );
  /// ```
  final bool? selected;

  /// A callback function that is called when a menu item is tap.
  final VoidCallback? onTap;

  /// Helper method to build a list tile for a menu item.
  ///
  /// This method constructs a row containing the leading, child, and trailing widgets
  /// with appropriate spacing. It returns a widget suitable for displaying in a list
  /// or menu.
  Widget buildListTile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: leading,
            ),
          ),
        child,
        if (trailing != null)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: trailing,
            ),
          )
      ],
    );
  }

  static Widget disabledOpacity(Widget? child, bool defaultSelected) {
    if (child == null) return const SizedBox.shrink();
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 80),
      opacity: defaultSelected ? 1 : 0.4,
      child: child,
    );
  }
}
