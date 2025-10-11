import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';

/// Represents a menu item in an [AdaptiveNavigationSidebar].
class AdaptiveNavigationSidebarItem
    extends CoreModel<NavigationPaneItem, SidebarItem> {
  const AdaptiveNavigationSidebarItem({
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
  SidebarItem toMacos(
    BuildContext context, [
    TextStyle? style,
    MacosIconThemeData? data,
  ]) {
    final buildLabel = style != null
        ? DefaultTextStyle.merge(style: style, child: label)
        : label;

    final buildIcon =
        data != null ? MacosIconTheme.merge(data: data, child: icon) : icon;

    return SidebarItem(
      label: buildLabel,
      leading: buildIcon,
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
    IconThemeData? data,
  }) {
    final unselectedTileColor = unselectedColor != null
        ? WidgetStateProperty.all(unselectedColor)
        : unColor != null
            ? WidgetStateProperty.all(unColor)
            : null;

    final selectedTileColor = selectedColor != null
        ? WidgetStateProperty.all(selectedColor)
        : seColor != null
            ? WidgetStateProperty.all(seColor)
            : null;

    final buildIcon =
        data != null ? IconTheme.merge(data: data, child: icon) : icon;

    return PaneItem(
      title: label,
      icon: buildIcon,
      trailing: trailing,
      focusNode: focusNode,
      tileColor: unselectedTileColor,
      body: body ?? const SizedBox.shrink(),
      selectedTileColor: selectedTileColor,
    );
  }
}
