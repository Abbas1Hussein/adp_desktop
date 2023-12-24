import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../navigation_view_item.dart';
import '../navigation_view_size.dart';

class NavigationViewMacos extends StatefulWidget {
  const NavigationViewMacos({
    super.key,
    this.size,
    this.items,
    this.toolBar,
    this.property,
    this.onChanged,
    this.searchField,
    this.selectedColor,
    this.currentIndex = 0,
    this.unselectedColor,
    required this.tabs,
  });

  /// The macOS-specific property for customizing the navigation view.
  final NVMacosProperty? property;

  /// The list of widgets representing the content of each navigation item.
  final List<Widget> tabs;

  /// The list of navigation items.
  final List<AdaptiveNavigationViewItem>? items;

  /// The app bar displayed at the top of the navigation view.
  final ToolBar? toolBar;

  /// The color to paint this widget as when selected.
  final Color? selectedColor;

  /// The color to paint this widget as when unselected.
  final Color? unselectedColor;

  /// The current selected index.
  final int currentIndex;

  /// Called when the current selected index should be changed.
  final ValueChanged<int>? onChanged;

  /// An optional search field widget.
  final Widget? searchField;

  /// The adaptive size constraints for the navigation view.
  final AdaptiveNavigationViewSize? size;

  @override
  State<NavigationViewMacos> createState() => _NavigationViewMacosState();
}

class _NavigationViewMacosState extends State<NavigationViewMacos> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    late final adpSize = widget.size;

    return MacosWindow(
      sidebarState: widget.property?.sidebarState ??
          NSVisualEffectViewState.followsWindowActiveState,
      disableWallpaperTinting:
          widget.property?.disableWallpaperTinting ?? false,
      sidebar: Sidebar(
        top: widget.searchField,
        bottom: widget.property?.bottom,
        decoration: widget.property?.decoration,
        dragClosed: widget.property?.dragClosed ?? true,
        dragClosedBuffer: widget.property?.dragClosedBuffer,
        isResizable: widget.property?.isResizable ?? true,
        shownByDefault: widget.property?.shownByDefault ?? true,
        snapToStartBuffer: widget.property?.snapToStartBuffer,
        minWidth: adpSize?.minWidth ?? size.width * 0.2,
        maxWidth: adpSize?.maxWidth ?? size.width * 0.3,
        startWidth: adpSize?.startWidth ?? size.width * 0.2,
        topOffset: adpSize?.topOffset ?? 0.0,
        windowBreakpoint: widget.property?.windowBreakpoint ?? 736.0,
        builder: (context, scrollController) {
          return SidebarItems(
            items: _buildItems(),
            shape: widget.property?.shape,
            selectedColor: widget.selectedColor,
            unselectedColor: widget.unselectedColor,
            currentIndex: widget.currentIndex,
            onChanged: (value) => widget.onChanged?.call(value),
            itemSize: widget.property?.itemSize ?? SidebarItemSize.large,
            scrollController: scrollController,
          );
        },
      ),
      child: CupertinoTabView(
        builder: (context) {
          return MacosScaffold(
            toolBar: widget.toolBar,
            children: [
              ContentArea(
                minWidth: size.width,
                builder: (context, scrollController) {
                  if (widget.tabs.isNotEmpty) {
                    return widget.tabs[widget.currentIndex];
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  List<SidebarItem> _buildItems() {
    if (widget.items == null) return [];

    return widget.items!.map((e) => e.toSidebarItem()).toList();
  }
}

class NVMacosProperty extends CoreMacosProperty {
  const NVMacosProperty({
    this.shape,
    this.bottom,
    this.itemSize,
    this.decoration,
    this.dragClosed,
    this.isResizable,
    this.sidebarState,
    this.shownByDefault,
    this.windowBreakpoint,
    this.dragClosedBuffer,
    this.snapToStartBuffer,
    this.disableWallpaperTinting,
  });

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

  /// If [dragClosed] is true, the sidebar will be hidden when dragged this far
  /// below [minWidth].  Defaults to half of [minWidth]. Set to 0 to cause the
  /// sidebar to close at exactly [minWidth].
  final double? dragClosedBuffer;

  /// If this and [AdaptiveNavigationViewSize.startWidth] are both set, the sidebar will snap back to
  /// [AdaptiveNavigationViewSize.startWidth] when dragged within this many pixels of it.
  final double? snapToStartBuffer;

  /// Specifies the width of the window at which this [Sidebar] will be hidden.
  final double? windowBreakpoint;

  /// Widget that should be displayed at the bottom of the [Sidebar].
  ///
  /// Commonly a [MacosListTile].
  final Widget? bottom;

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

  /// The size specifications for all [items].
  ///
  /// Defaults to [SidebarItemSize.medium].
  final SidebarItemSize? itemSize;
}
