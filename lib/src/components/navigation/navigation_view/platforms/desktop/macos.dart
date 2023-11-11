import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../../../../layout/appbar/platforms/desktop/macos.dart';
import '../../navigation_view_item.dart';

class NavigationViewMacos extends StatefulWidget {
  final NavigationViewMacosProperty? property;
  final List<Widget> tabs;
  final List<AdaptiveNavigationViewItem>? items;

  final AppBarMacos? appBar;

  /// The color to paint this widget as when selected.
  ///
  /// If null, [MacosThemeData.primaryColor] is used.
  final Color? selectedColor;

  /// The color to paint this widget as when unselected.
  ///
  /// Defaults to transparent.
  final Color? unselectedColor;

  /// The current selected index. It must be in the range of 0 to
  /// [items.length]
  final int? currentIndex;

  /// Called when the current selected index should be changed.
  final ValueChanged<int>? onChanged;

  const NavigationViewMacos({
    super.key,
    this.items,
    required this.tabs,
    this.selectedColor,
    this.unselectedColor,
    this.currentIndex,
    this.onChanged,
    this.property,
    this.appBar,
  });

  @override
  State<NavigationViewMacos> createState() => _NavigationViewMacosState();
}

class _NavigationViewMacosState extends State<NavigationViewMacos> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.currentIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MacosWindow(
      backgroundColor: widget.property?.backgroundColor,
      sidebarState:
          widget.property?.sidebarState ?? NSVisualEffectViewState.active,
      disableWallpaperTinting: widget.property?.disableWallpaperTinting ?? true,
      sidebar: Sidebar(
        padding: widget.property?.padding ?? EdgeInsets.zero,
        decoration: widget.property?.decoration,
        top: widget.property?.top,
        bottom: widget.property?.bottom,
        dragClosed: widget.property?.dragClosed ?? true,
        dragClosedBuffer: widget.property?.dragClosedBuffer,
        isResizable: widget.property?.isResizable ?? true,
        shownByDefault: widget.property?.shownByDefault ?? true,
        snapToStartBuffer: widget.property?.snapToStartBuffer,
        topOffset: widget.property?.topOffset ?? 51.0,
        windowBreakpoint: widget.property?.windowBreakpoint ?? 556.0,
        minWidth: size.width * 0.2,
        maxWidth: size.width * 0.2,
        startWidth: size.width * 0.2,
        builder: (context, scrollController) => SidebarItems(
          shape: widget.property?.shape,
          cursor: widget.property?.cursor ?? SystemMouseCursors.basic,
          currentIndex: currentIndex,
          onChanged: _defaultChangeIndex,
          itemSize: widget.property?.itemSize ?? SidebarItemSize.medium,
          unselectedColor: widget.unselectedColor,
          selectedColor: widget.selectedColor,
          items: widget.items?.map((e) {
                return SidebarItem(label: Text(e.label!), leading: e.icon);
              }).toList() ??
              [],
        ),
      ),
      child: CupertinoTabView(
        builder: (context) {
          return MacosScaffold(
            toolBar: widget.appBar?.build(context) as ToolBar,
            children: [
              ContentArea(
                builder: (context, scrollController) {
                  return widget.tabs[currentIndex];
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _defaultChangeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.onChanged?.call(index);
  }
}

class NavigationViewMacosProperty extends CoreMacosProperty {
  /// The builder that creates a child to display in this widget, which will
  /// use the provided [_scrollController] to enable the scrollbar to work.
  ///
  /// Pass the [scrollController] obtained from this method to a scrollable
  /// widget used in this method to work with the internal [MacosScrollbar].
  final ScrollableWidgetBuilder? builder;

  /// The [BoxDecoration] to paint behind the child in the [builder].
  final BoxDecoration? decoration;

  /// Specifies whether the [Sidebar] can be resized by dragging or not.
  final bool? isResizable;

  /// If true, the sidebar will close when dragged below [minWidth]. Use
  /// [dragClosedBuffer] configure how far below [minWidth] it needs to be
  /// dragged to trigger this behavior.
  ///
  /// Defaults to `true`.
  final bool? dragClosed;

  /// Specifies the background color for the Window.
  ///
  /// The default colors from the theme would be used if no color is specified.
  final Color? backgroundColor;

  /// If [dragClosed] is true, the sidebar will be hidden when dragged this far
  /// below [minWidth].  Defaults to half of [minWidth]. Set to 0 to cause the
  /// sidebar to close at exactly [minWidth].
  final double? dragClosedBuffer;

  /// If this and [startWidth] are both set, the sidebar will snap back to
  /// [startWidth] when dragged within this many pixels of it.
  final double? snapToStartBuffer;

  /// The maximum width that this sidebar can be resized to.
  ///
  /// The [maxWidth] should not be less than the [minWidth].
  ///
  /// Defaults to `400.0`
  final double? maxWidth;

  /// The minimum width that this sidebar can be resized to.
  ///
  /// The [minWidth] should not be more than the [maxWidth].
  final double? minWidth;

  /// The default width that this `Sidebar` first starts with.
  ///
  /// The [startWidth] should not be more than the [maxWidth] or
  /// less than the [minWidth].
  final double? startWidth;

  /// Empty space to inscribe inside the title bar. The [child], if any, is
  /// placed inside this padding.
  ///
  /// Defaults to `EdgeInsets.zero`.
  final EdgeInsets? padding;

  /// Specifies the width of the window at which this [Sidebar] will be hidden.
  final double? windowBreakpoint;

  /// Widget that should be displayed at the top of the [Sidebar].
  ///
  /// Commonly a [MacosSearchField].
  final Widget? top;

  /// Widget that should be displayed at the bottom of the [Sidebar].
  ///
  /// Commonly a [MacosListTile].
  final Widget? bottom;

  /// Specifies the top offset of the sidebar.
  ///
  /// Defaults to `51.0` which levels it up with the default height of the [TitleBar]
  final double? topOffset;

  /// Whether the sidebar should be open by default or not.
  ///
  /// Most useful for end sidebars.
  ///
  /// Defaults to `true`.
  final bool? shownByDefault;

  /// Whether wallpaper tinting should be disabled.
  ///
  /// By default, `macos_ui` applies wallpaper tinting to the application's
  /// window to match macOS' native appearance:
  ///
  /// <img src="https://user-images.githubusercontent.com/86920182/220182724-d78319d7-5c41-4e8c-b785-a73a6ea24927.jpg" width=640/>
  ///
  /// However, this effect is realized by inserting `NSVisualEffectView`s behind
  /// Flutter's canvas and turning the background of areas that are meant to be
  /// affected by wallpaper tinting transparent. Since Flutter's
  /// [`ImageFilter.blur`](https://api.flutter.dev/flutter/dart-ui/ImageFilter/ImageFilter.blur.html)
  /// does not support transparency, wallpaper tinting is disabled automatically
  /// when a [MacosOverlayFilter] is present in the widget tree.
  ///
  /// This is meant to be a temporary solution until
  /// [#16296](https://github.com/flutter/flutter/issues/16296) is resolved in
  /// the Flutter project.
  ///
  /// Since the disabling of wallpaper tinting may be found to be too noticeable,
  /// this property may be used to disable wallpaper tinting outright.
  final bool? disableWallpaperTinting;

  /// The state of the sidebar's [NSVisualEffectView].
  ///
  /// Possible values are:
  ///
  /// - [NSVisualEffectViewState.active]: The sidebar is always active.
  /// - [NSVisualEffectViewState.inactive]: The sidebar is always inactive.
  /// - [NSVisualEffectViewState.followsWindowActiveState]: The sidebar's state
  /// follows the window's active state.
  ///
  /// Defaults to [NSVisualEffectViewState.active].
  final NSVisualEffectViewState? sidebarState;

  /// The [shape] property specifies the outline (border) of the
  /// decoration. The shape must not be null. It's used alongside
  /// [selectedColor].
  final ShapeBorder? shape;

  /// Specifies the kind of cursor to use for all sidebar items.
  ///
  /// Defaults to [SystemMouseCursors.basic].
  final MouseCursor? cursor;

  /// The size specifications for all [items].
  ///
  /// Defaults to [SidebarItemSize.medium].
  final SidebarItemSize? itemSize;

  const NavigationViewMacosProperty({
    this.shape,
    this.itemSize,
    this.backgroundColor,
    this.cursor,
    this.builder,
    this.sidebarState,
    this.decoration,
    this.isResizable,
    this.dragClosed,
    this.disableWallpaperTinting,
    this.dragClosedBuffer,
    this.snapToStartBuffer,
    this.maxWidth,
    this.minWidth,
    this.startWidth,
    this.padding,
    this.windowBreakpoint,
    this.top,
    this.bottom,
    this.topOffset,
    this.shownByDefault,
  });
}
