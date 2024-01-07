import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../navigation_sidebar_size.dart';

class NavigationViewMacosProperty extends CoreMacosProperty {
  const NavigationViewMacosProperty({
    this.titleBar,
    this.disableWallpaperTinting = false,
    this.sidebarState = NSVisualEffectViewState.followsWindowActiveState,
  });

  /// An app bar to display at the top of the window.
  final TitleBar? titleBar;

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
  final bool disableWallpaperTinting;

  /// The state of the sidebar's [NSVisualEffectView].
  ///
  /// Possible values are:
  ///
  /// - [NSVisualEffectViewState.active]: The sidebar is always active.
  /// - [NSVisualEffectViewState.inactive]: The sidebar is always inactive.
  /// - [NSVisualEffectViewState.followsWindowActiveState]: The sidebar's state
  /// follows the window's active state.
  ///
  /// Defaults to [NSVisualEffectViewState.followsWindowActiveState].
  final NSVisualEffectViewState sidebarState;
}

class NavigationSidebarMacosProperty extends CoreMacosProperty {
  const NavigationSidebarMacosProperty({
    this.itemsShape,
    this.bottom,
    this.windowBreakpoint,
    this.dragClosedBuffer,
    this.snapToStartBuffer,
    this.dragClosed = true,
    this.isResizable = true,
    this.shownByDefault = true,
    this.itemSize = SidebarItemSize.large,
  });

  /// Specifies whether the [Sidebar] can be resized by dragging or not.
  ///
  /// Defaults to `true`.
  final bool isResizable;

  /// If true, the sidebar will close when dragged below [minWidth]. Use
  /// [dragClosedBuffer] configure how far below [minWidth] it needs to be
  /// dragged to trigger this behavior.
  ///
  /// Defaults to `true`.
  final bool dragClosed;

  /// If [dragClosed] is true, the sidebar will be hidden when dragged this far
  /// below [minWidth].  Defaults to half of [minWidth]. Set to 0 to cause the
  /// sidebar to close at exactly [minWidth].
  final double? dragClosedBuffer;

  /// If this and [AdaptiveNavigationSidebarSize.startWidth] are both set, the sidebar will snap back to
  /// [AdaptiveNavigationSidebarSize.startWidth] when dragged within this many pixels of it.
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
  final bool shownByDefault;

  /// The [itemsShape] property specifies the outline (border) of the
  /// decoration. The shape must not be null. It's used alongside
  /// [selectedItemColor].
  final ShapeBorder? itemsShape;

  /// The size specifications for all [items].
  ///
  /// Defaults to [SidebarItemSize.large].
  final SidebarItemSize itemSize;
}
