import 'package:flutter/widgets.dart';

/// Represents an entry in an [AdaptiveMenu], which can be either a
/// [AdaptivePulldownMenuItem] or a [AdaptiveMenuDivider].
abstract class AdaptivePulldownMenuItemEntry<T> {
  const AdaptivePulldownMenuItemEntry();
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
    this.value,
    this.selected = false,
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

  /// Indicates whether the menu item is selected or not.
  final bool selected;

  /// An optional leading widget for the menu item.
  final Widget? leading;

  /// An optional trailing widget for the menu item.

  final Widget? trailing;

  /// Helper method to build a list tile for a menu item.
  ///
  /// This method constructs a row containing the leading, child, and trailing widgets
  /// with appropriate spacing. It returns a widget suitable for displaying in a list
  /// or menu.
  Widget get buildListTile {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: FittedBox(child: leading),
        ),
        child,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: FittedBox(child: trailing),
        )
      ],
    );
  }
}

class AdaptiveMenuDivider<T> implements AdaptivePulldownMenuItemEntry<T> {
  const AdaptiveMenuDivider();
}
