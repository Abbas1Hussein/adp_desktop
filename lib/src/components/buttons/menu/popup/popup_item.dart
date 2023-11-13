import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

/// An item in a menu created by a [AdaptivePopupMenuItem].
///
/// The type `T` is the type of the value the entry represents. All the entries
/// in a given menu must represent values with consistent types.
class AdaptivePopupMenuItem<T> {
  /// Creates an item for a adp popup menu item.
  ///
  /// The [child] argument is required.
  const AdaptivePopupMenuItem({this.onTap, this.value, required this.child});

  /// The value to return if the user selects this menu item.
  ///
  /// Eventually returned in a call to [AdaptivePopupMenu.onChanged].
  final T? value;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// Called when the adp popup menu item is tapped.
  final VoidCallback? onTap;

  /// Converts the [AdaptivePopupMenuItem] to a macOS-specific popup menu item.
  ///
  /// Returns a [MacosPopupMenuItem] with the specified [onTap], [value], and [child].
  /// This method facilitates creating macOS-compatible menu items using the data
  /// from the original [AdaptivePopupMenuItem].
  MacosPopupMenuItem<T> toMacosPopupMenuItem() {
    return MacosPopupMenuItem<T>(onTap: onTap, value: value, child: child);
  }

  /// Converts the [AdaptivePopupMenuItem] to a Windows-specific combo box item.
  ///
  /// Returns a [ComboBoxItem] with the specified [onTap], [value], and [child].
  /// This method facilitates creating Windows-compatible combo box items using the data
  /// from the original [AdaptivePopupMenuItem].
  ComboBoxItem<T> toWindowsPopupMenuItem() {
    return ComboBoxItem<T>(onTap: onTap, value: value, child: child);
  }
}
