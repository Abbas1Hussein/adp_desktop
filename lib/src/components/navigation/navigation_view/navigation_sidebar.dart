import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../../core/common/construct/properties.dart';
import '../../fields/text_search_field/text_search_field.dart';
import '../../icon/icon_theme.dart';
import 'navigation_sidebar_item.dart';
import 'navigation_sidebar_size.dart';
import 'platforms/platforms.dart';

/// A custom navigation sidebar view widget that adapts its appearance based on the platform.
///
/// See also:
///
///  * [AdaptiveNavigationView] rendering this component.
///
/// On macOS, the [NavigationPane] utilized.
/// On Windows, the [Sidebar] used.
class AdaptiveNavigationSidebar extends CoreModel<NavigationPane, Sidebar> {
  /// Creates a adaptive nav sidebar
  ///
  /// [items] must have at least 2 items
  ///
  /// [currentIndex] must be in the range of 0 to [items.length]
  const AdaptiveNavigationSidebar({
    this.size,
    this.header,
    this.onChanged,
    this.searchField,
    this.currentIndex = 0,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.unselectedItemColor,
    this.selectedItemColor,
    this.properties,
    required this.items,
  })  : assert(items.length >= 2),
        assert(currentIndex >= 0 && currentIndex < items.length);

  /// The header of the sidebar.
  ///
  /// If null, the space it should have taken will be removed.
  ///
  /// Usually a [Text] or an [Image]. The `header` is a visual element that can be
  /// displayed at the top of the navigation sidebar, providing additional context or branding.
  /// If `null`, the space allocated for the header will be collapsed.
  final Widget? header;

  /// The current selected index. This must be in the range of 0 to [items.length].
  final int currentIndex;

  /// Called when the current selected index should be changed.
  ///
  /// The navigation sidebar passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the navigation sidebar with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// onChanged: (newValue) {
  ///   setState(() {
  ///     currentIndex = newValue;
  ///   });
  /// },
  /// ```
  final ValueChanged<int>? onChanged;

  /// The list of navigation items.
  ///
  /// The `items` parameter is a list of [AdaptiveNavigationSidebarItem] objects,
  /// each representing an individual item in the navigation sidebar. It is required
  /// to have at least two items.
  final List<AdaptiveNavigationSidebarItem> items;

  /// Properties for configuring the appearance and behavior of the navigation sidebar.
  ///
  /// The `properties` parameter allows you to customize the visual and functional aspects
  /// of the navigation sidebar separately for Windows and macOS platforms.
  /// You can provide specific properties for each platform using `NavigationSidebarWindowsProperty`
  /// and `NavigationSidebarMacosProperty` respectively.
  final CoreProperties<NavigationSidebarWindowsProperty,
      NavigationSidebarMacosProperty>? properties;

  /// The color of the item when selected.
  ///
  /// The `selectedItemColor` parameter defines the background color of the navigation item's
  /// when it is selected. This color is applied to indicate the currently active.
  final Color? selectedItemColor;

  /// The color of the item when unselected.
  ///
  /// The `unselectedItemColor` parameter allows you to specify the color of the navigation item
  /// when it is not selected. It is the background color of the item representing an item's in the sidebar.
  final Color? unselectedItemColor;

  /// The text style for the selected label.
  ///
  /// The `selectedLabelStyle` parameter defines the text style of the label or text associated with
  /// the currently selected navigation item. It allows you to customize the appearance of the text
  /// when the item is in a selected state.
  final TextStyle? selectedLabelStyle;

  /// The text style for the unselected label.
  ///
  /// The `unselectedLabelStyle` parameter specifies the text style for the label or text associated
  /// with unselected navigation items. This style is applied to the text when the item is not in focus.
  final TextStyle? unselectedLabelStyle;

  /// The theme for the selected icon.
  ///
  /// The `selectedIconTheme` parameter allows you to customize the visual appearance of icons associated
  /// with the currently selected navigation item. You can adjust properties such as the icon's color,
  /// size, and opacity when the item is selected.
  final AdaptiveIconThemeData? selectedIconTheme;

  /// The theme for the unselected icon.
  ///
  /// Similar to `selectedIconTheme`, the `unselectedIconTheme` parameter lets you customize the visual
  /// appearance of icons for unselected navigation items. You can control the color, size, and opacity
  /// when they are not in focus.
  final AdaptiveIconThemeData? unselectedIconTheme;

  /// An optional search field widget.
  ///
  /// The `searchField` parameter allows you to integrate a search field into the navigation sidebar.
  /// If provided, it is rendered in the sidebar and can be used for searching and filtering navigation items.
  /// If `null`, no search field will be displayed.
  final AdaptiveTextSearchField? searchField;

  /// The adaptive size constraints for the navigation view.
  ///
  /// The `size` parameter defines the adaptive size constraints for the navigation sidebar,
  /// allowing you to control its appearance and behavior based on the available space.
  /// This includes properties such as the top offset, minimum width, maximum width, and starting width.
  final AdaptiveNavigationSidebarSize? size;

  @override
  NavigationPane toWindows(
    BuildContext context, [
    Widget? body,
    PaneDisplayMode? displayMode,
  ]) {
    final property = properties?.windows;

    final buildItems = List.generate(
      items.length,
      (index) {
        final isSelected = index == currentIndex;

        final iconTheme = isSelected
            ? selectedIconTheme?.toWindows(context)
            : unselectedIconTheme?.toWindows(context);

        return items[index].toWindows(
          context,
          body: body,
          unColor: unselectedItemColor,
          seColor: selectedItemColor,
          data: iconTheme,
        );
      },
    );

    final suggestions = searchField != null
        ? Padding(
            padding: displayMode == PaneDisplayMode.top
                ? const EdgeInsets.symmetric(horizontal: 4.0)
                : EdgeInsets.zero,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 30.0),
              child: searchField?.windows(context),
            ),
          )
        : null;

    return NavigationPane(
      header: header,
      onChanged: onChanged,
      selected: currentIndex,
      size: NavigationPaneSize(
        headerHeight: size?.topOffset,
        openMaxWidth: size?.maxWidth,
        openMinWidth: size?.minWidth,
        openWidth: size?.startWidth,
      ),
      items: buildItems,
      leading: property?.leading,
      indicator: property?.indicator,
      menuButton: property?.menuButton,
      toggleable: property?.toggleable ?? true,
      scrollBehavior: property?.scrollBehavior,
      scrollController: property?.scrollController,
      displayMode: displayMode ?? PaneDisplayMode.auto,
      autoSuggestBox: suggestions,
      autoSuggestBoxReplacement:
          property?.searchFieldReplacement ?? const Icon(FluentIcons.search),
    );
  }

  @override
  Sidebar toMacos(BuildContext context) {
    final property = properties?.macos;
    final theme = MacosTheme.of(context);
    final defaultSize = MediaQuery.sizeOf(context);

    final buildTopWidgets = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: DefaultTextStyle(
              maxLines: 1,
              style: theme.typography.body
                  .copyWith(fontWeight: MacosFontWeight.w510),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: searchField != null ? 3.0 : 0.0,
                ),
                child: header!,
              ),
            ),
          ),
        if (searchField != null) searchField!.macos(context),
      ],
    );

    return Sidebar(
      top: buildTopWidgets,
      bottom: property?.bottom,
      topOffset: size?.topOffset ?? 0.0,
      minWidth: size?.minWidth ?? defaultSize.width * 0.2,
      maxWidth: size?.maxWidth ?? defaultSize.width * 0.25,
      startWidth: size?.startWidth ?? defaultSize.width * 0.21,
      snapToStartBuffer: property?.snapToStartBuffer,
      dragClosedBuffer: property?.dragClosedBuffer,
      dragClosed: property?.dragClosed ?? true,
      isResizable: property?.isResizable ?? true,
      shownByDefault: property?.shownByDefault ?? true,
      windowBreakpoint: property?.windowBreakpoint ?? 556.0,
      decoration: BoxDecoration(color: theme.canvasColor),
      builder: (context, scrollController) {
        final buildItems = List.generate(
          items.length,
          (index) {
            final isSelected = index == currentIndex;

            final labelStyle =
                isSelected ? selectedLabelStyle : unselectedLabelStyle;

            final iconTheme = isSelected
                ? selectedIconTheme?.toMacos(context)
                : unselectedIconTheme?.toMacos(context);

            return items[index].toMacos(context, labelStyle, iconTheme);
          },
        );

        return SidebarItems(
          shape: property?.itemsShape,
          currentIndex: currentIndex,
          selectedColor: selectedItemColor,
          unselectedColor: unselectedItemColor,
          scrollController: scrollController,
          onChanged: (value) => onChanged?.call(value),
          itemSize: property?.itemSize ?? SidebarItemSize.large,
          items: buildItems,
        );
      },
    );
  }
}
