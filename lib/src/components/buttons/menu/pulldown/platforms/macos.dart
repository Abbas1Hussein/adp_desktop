import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../pulldown_item.dart';
import '../single_choice.dart';

class PulldownMenuMacos<T> extends StatelessWidget {
  const PulldownMenuMacos({
    super.key,
    this.property,
    this.onSelected,
    this.autofocus,
    this.focusNode,
    this.onOpen,
    this.disabled,
    this.disabledTitle,
    this.pulldownColor,
    required this.selectionType,
    required this.title,
    required this.items,
  });

  /// Additional properties for configuring the appearance and behavior of the pulldown menu.
  final PulldownMenuMacosProperty? property;

  /// invoked when a menu item is selected. The generic type `T` represents the type of the selected value.
  final PulldownMenuSelectedCallback<T>? onSelected;

  /// The list of menu items to be displayed in the menu.
  ///
  /// Use:
  /// * [AdaptivePulldownMenuItem] for selectable items.
  /// * [AdaptivePulldownMenuDivider] for visual separators.
  final List<AdaptivePulldownMenuItemEntry> items;

  /// {@macro flutter.widgets.Focus.autofocus}
  /// If true, the pulldown menu will automatically focus when displayed.
  final bool? autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// The focus node to control the focus behavior of the pulldown menu.
  final FocusNode? focusNode;

  /// The title text to be displayed on the pulldown button.
  final String title;

  /// If true, the pulldown button won't be clickable. Default is false.
  final bool? disabled;

  /// If [disabled] is true, the pulldown button will not be clickable.
  /// If null, the [title] will be used as a fallback.
  final String? disabledTitle;

  /// The menu color. If null, [MacosPulldownButtonTheme.pulldownColor] is used
  final Color? pulldownColor;

  /// Callback function invoked when the pulldown button is tapped.
  /// The callback will not be invoked if the pulldown button is disabled.
  final VoidCallback? onOpen;

  final SelectionType selectionType;

  @override
  Widget build(BuildContext context) {
    final theme = MacosPulldownButtonTheme.of(context);

    return MacosPulldownButtonTheme(
      data: theme.copyWith(
        pulldownColor: pulldownColor,
        highlightColor: theme.highlightColor?.withOpacity(0.35),
      ),
      child: MacosPulldownButton(
        onTap: onOpen,
        icon: property?.icon,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        disabledTitle: disabledTitle ?? title,
        itemHeight: property?.itemHeight ?? 30.0,
        title: property?.icon == null ? title : null,
        items: disabled == true ? [] : _buildListItems(context),
        menuAlignment: property?.menuAlignment ?? PulldownMenuAlignment.left,
      ),
    );
  }

  List<MacosPulldownMenuEntry> _buildListItems(BuildContext context) {
    return List.generate(
      items.length,
      (index) {
        final item = items[index];
        if (item is AdaptivePulldownMenuItem<T?>) {
          final defaultSelected = item.enabled ?? selectionType == SelectionType.none;

          switch (selectionType) {
            case SelectionType.none:
              return _macosPulldownMenuItemNoneSelection(
                item: item,
                index: index,
                context: context,
                isDisabled: defaultSelected,
              );
            case SelectionType.single:
              return _macosPulldownMenuItemSingleSelection(
                item: item,
                index: index,
                context: context,
                isSelected: defaultSelected,
              );
          }
        } else {
          return const MacosPulldownMenuDivider();
        }
      },
    );
  }

  MacosPulldownMenuItem _macosPulldownMenuItemNoneSelection({
    required int index,
    required bool isDisabled,
    required BuildContext context,
    required AdaptivePulldownMenuItem<T?> item,
  }) {
    return MacosPulldownMenuItem(
      enabled: isDisabled,
      title: MacosIconTheme(
        data: const MacosIconThemeData(size: 18.0),
        child: item.buildListTile(context),
      ),
      onTap: () => _handelPressedItem(index, item),
    );
  }

  MacosPulldownMenuItem _macosPulldownMenuItemSingleSelection({
    required int index,
    required bool isSelected,
    required BuildContext context,
    required AdaptivePulldownMenuItem<T?> item,
  }) {
    return MacosPulldownMenuItemSingleSelection(
      selected: isSelected,
      child: item.buildListTile(context),
      onTap: () => _handelPressedItem(index, item),
    );
  }

  void _handelPressedItem(int index, AdaptivePulldownMenuItem<T?> item) {
    onSelected?.call(index, item.value);
    item.onTap?.call();
  }
}

class MacosPulldownMenuItemSingleSelection extends MacosPulldownMenuItem {
  const MacosPulldownMenuItemSingleSelection({
    super.key,
    super.onTap,
    required this.child,
    this.selected = false,
  }) : super(title: child);

  final Widget child;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = MacosTheme.of(context);

    final isDark = theme.brightness == Brightness.dark;

    final Color highlightColor = selected
        ? theme.pulldownButtonTheme.highlightColor!.withOpacity(0.85)
        : MacosColors.transparent;

    return Container(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0, top: 4.0, right: 4.0),
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      decoration: BoxDecoration(
        color: highlightColor,
        backgroundBlendMode: isDark ? BlendMode.difference : null,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: MacosIconTheme(
        data: MacosIconThemeData(
          color: selected
              ? CupertinoColors.white
              : theme.pulldownButtonTheme.iconColor,
          size: selected ? 18 : 16,
        ),
        child: DefaultTextStyle(
          style: theme.typography.body
              .copyWith(color: selected ? CupertinoColors.white : null),
          child: super.build(context),
        ),
      ),
    );
  }

  @override
  bool get enabled => true;
}

class PulldownMenuMacosProperty extends CoreMacosProperty {
  const PulldownMenuMacosProperty({
    this.icon,
    this.itemHeight = 30.0,
    this.menuAlignment = PulldownMenuAlignment.left,
  });

  /// An icon to use as title for the pull-down button. Makes the pull-down
  /// button behave and render as an icon-button with a caret.
  ///
  /// If this is provided, [title] will be ignore.
  /// It is recommended to use icons from the CupertinoIcons library for this.
  ///
  /// Typically in [CupertinoIcons.ellipsis_circle].
  final IconData? icon;

  /// If null, then the menu item heights will vary according to each menu
  /// item's intrinsic height.
  ///
  /// The default value is 30px, which is also the minimum
  /// height for menu items.
  final double? itemHeight;

  /// Defines the pulldown menu's alignment relevant to the button.
  ///
  /// Defaults to [PulldownMenuAlignment.left].
  final PulldownMenuAlignment menuAlignment;
}
