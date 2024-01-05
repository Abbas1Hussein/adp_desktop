import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/model.dart';

/// An item in a menu created by a [AdaptivePopupMenuItem].
///
/// The type `T` is the type of the value the entry represents. All the entries
/// in a given menu must represent values with consistent types.
class AdaptivePopupMenuItem<T>
    extends CoreModel<ComboBoxItem<T>, MacosPopupMenuItem<T>> {
  /// Creates an item for a adp popup menu item.
  ///
  /// The [child] and [value] argument is required.
  const AdaptivePopupMenuItem({
    this.onTap,
    required this.value,
    required this.child,
  });

  /// The value to return if the user selects this menu item.
  ///
  /// Eventually returned in a call to [AdaptivePopupMenu.onSelected].
  final T value;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// Called when the adp popup menu item is tapped.
  final VoidCallback? onTap;

  @override
  MacosPopupMenuItem<T> toMacos(BuildContext context) {
    return MacosPopupMenuItem<T>(onTap: onTap, value: value, child: child);
  }

  @override
  ComboBoxItem<T> toWindows(BuildContext context) {
    return ComboBoxItem<T>(onTap: onTap, value: value, child: child);
  }
}
