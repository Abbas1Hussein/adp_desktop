import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';

/// Represents a menu item in an [AdaptiveNavigationView].
class AdaptiveNavigationViewItem
    extends CoreModel<NavigationPaneItem, SidebarItem> {
  const AdaptiveNavigationViewItem({
    this.trailing,
    this.focusNode,
    this.selectedColor,
    this.unselectedColor,
    required this.label,
    required this.icon,
  });

  /// The icon used by this item.
  ///
  /// Usually an [AdaptiveIcon] widget.
  final Widget icon;

  /// Indicates what content this widget represents.
  ///
  /// Typically a [Text].
  final Widget label;

  /// The color to be used when the item is selected.
  final Color? selectedColor;

  /// The color to be used when the item is not selected.
  final Color? unselectedColor;

  /// widget to be displayed after the main content of the item.
  final Widget? trailing;

  /// The focus node used by this item.
  final FocusNode? focusNode;

  @override
  SidebarItem toMacos(BuildContext context) {
    return SidebarItem(
      label: label,
      leading: icon,
      trailing: trailing,
      focusNode: focusNode,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
    );
  }

  @override
  NavigationPaneItem toWindows(
    BuildContext context, {
    Widget? body,
    Color? unColor,
    Color? seColor,
  }) {
    final unselectedTileColor = unselectedColor != null
        ? ButtonState.all(unselectedColor)
        : unColor != null
            ? ButtonState.all(unColor)
            : null;

    final selectedTileColor = selectedColor != null
        ? ButtonState.all(selectedColor)
        : seColor != null
            ? ButtonState.all(seColor)
            : null;

    return PaneItem(
      icon: icon,
      title: label,
      trailing: trailing,
      focusNode: focusNode,
      tileColor: unselectedTileColor,
      body: body ?? const SizedBox.shrink(),
      selectedTileColor: selectedTileColor,
    );
  }
}
