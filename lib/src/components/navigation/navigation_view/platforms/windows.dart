import 'package:fluent_ui/fluent_ui.dart';

import '../../../../core/common/construct/properties.dart';

class NavigationViewWindowsProperty extends CoreWindowsProperty {
  const NavigationViewWindowsProperty({
    this.displayMode,
    this.contentShape,
    this.transitionBuilder,
    this.onDisplayModeChanged,
    this.clipBehavior = Clip.antiAlias,
  });

  /// {@macro flutter.rendering.ClipRectLayer.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  /// How the body content should be clipped
  ///
  /// The body content is not clipped on when the display mode is [PaneDisplayMode.minimal]
  final ShapeBorder? contentShape;

  /// Use this property to customize how the pane will be displayed.
  /// [PaneDisplayMode.auto] is used by default.
  final PaneDisplayMode? displayMode;

  /// The transition builder.
  ///
  /// It can be detect the display mode of the parent [NavigationView], if any,
  /// and change the transition accordingly.
  ///
  /// ```dart
  /// transitionBuilder: (child, animation) {
  ///   return DrillInPageTransition(child: child, animation: animation);
  /// },
  /// ```
  ///
  /// See also:
  ///
  ///  * [EntrancePageTransition], used by default
  ///  * [HorizontalSlidePageTransition], used by default on top navigation
  ///  * [DrillInPageTransition], used when users navigate deeper into an app
  ///  * [SuppressPageTransition], to have no animation at all
  ///  * <https://docs.microsoft.com/en-us/windows/apps/design/motion/page-transitions>
  ///
  ///  * --> default used [DrillInPageTransition]
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  /// Called when the display mode changes.
  ///
  /// This is called when the user clicks on the pane toggle button, or when
  /// the display mode is set to [PaneDisplayMode.auto] and the window size
  /// changes.
  ///
  /// If the display mode is set to compact, this listens to changes on the
  /// toggle button and resizes. If the pane is closed, [PaneDisplayMode.compact]
  /// is returned. If the pane is open, [PaneDisplayMode.open] is returned.
  ///
  /// If the display mode is set to minimal, this is called when the pane is opened
  /// or closed. If the pane is closed, [PaneDisplayMode.minimal] is returned.
  /// If the pane is open, [PaneDisplayMode.open] is returned.
  final ValueChanged<PaneDisplayMode>? onDisplayModeChanged;
}

class NavigationSidebarWindowsProperty extends CoreWindowsProperty {
  const NavigationSidebarWindowsProperty({
    this.leading,
    this.indicator,
    this.menuButton,
    this.onOpenSearch,
    this.scrollBehavior,
    this.scrollController,
    this.toggleable = true,
    this.searchFieldReplacement,
  });

  /// The leading Widget for the Pane
  final Widget? leading;

  /// A function called when building the navigation indicator
  final Widget? indicator;

  /// The menu button used by this pane.
  ///
  /// If null, [buildMenuButton] is used
  final Widget? menuButton;

  /// Whether the pane can be toggled or not.
  ///
  /// This is used when [displayMode] is [PaneDisplayMode.compact]. If false,
  /// the pane will always be closed.
  final bool toggleable;

  /// Called when the search button is tapped.
  ///
  /// This callback is invoked when [NavigationPane.autoSuggestBoxReplacement]
  /// is tapped.
  final VoidCallback? onOpenSearch;

  /// Used when the current display mode is [PaneDisplayMode.compact]
  /// as a replacement to [searchField]. It's only displayed if
  /// [searchField] is non-null.
  ///
  /// It's usually an [Icon] with [FluentIcons.search] as the icon.
  final Widget? searchFieldReplacement;

  /// The scroll controller used by the pane when [displayMode] is
  /// [PaneDisplayMode.compact] and [PaneDisplayMode.open].
  ///
  /// If null, a local scroll controller is created to control the scrolling and
  /// keep the state of the scroll when the display mode is toggled.
  final ScrollController? scrollController;

  /// The scroll behavior used by the pane when [displayMode] is
  /// [PaneDisplayMode.compact] and [PaneDisplayMode.open].
  ///
  /// If null, [NavigationViewScrollBehavior] is used.
  final ScrollBehavior? scrollBehavior;
}
