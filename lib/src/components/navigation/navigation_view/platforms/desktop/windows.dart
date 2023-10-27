import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../../../../layout/appbar/platforms/desktop/windows.dart';
import '../../navigation_view_item.dart';

class NavigationViewWindows extends StatefulWidget {
  final NavigationViewWindowsProperty? property;
  final List<Widget> tabs;
  final List<AdaptiveNavigationViewItem>? items;

  final AppBarWindows? appBar;

  final Color? backgroundColor;
  final Color? backgroundColorBar;

  /// The color of the tile when unselected.
  /// If null, [NavigationPaneThemeData.tileColor] is used
  final Color? tileColor;

  /// The color of the tile when unselected.
  /// If null, [NavigationPaneThemeData.tileColor]/hovering is used
  final Color? selectedTileColor;

  /// The current selected index. It must be in the range of 0 to
  /// [items.length]
  final int? currentIndex;

  /// Called when the current selected index should be changed.
  final ValueChanged<int>? onChanged;

  const NavigationViewWindows({
    super.key,
    this.items,
    this.appBar,
    this.property,
    this.tileColor,
    this.onChanged,
    this.currentIndex,
    this.backgroundColor,
    this.backgroundColorBar,
    this.selectedTileColor,
    required this.tabs,
  });

  @override
  State<NavigationViewWindows> createState() => _NavigationViewWindowsState();
}

class _NavigationViewWindowsState extends State<NavigationViewWindows> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.currentIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: widget.appBar?.toNavigationAppBar(context),
      pane: NavigationPane(
        header: widget.property?.header ?? const SizedBox.shrink(),
        leading: widget.property?.leading,
        size: widget.property?.size,
        scrollController: widget.property?.scrollController,
        autoSuggestBox: widget.property?.autoSuggestBox,
        autoSuggestBoxReplacement: widget.property?.autoSuggestBoxReplacement,
        displayMode: widget.property?.displayMode ?? PaneDisplayMode.auto,
        indicator:
            widget.property?.indicator ?? const StickyNavigationIndicator(),
        menuButton: widget.property?.menuButton,
        scrollBehavior: widget.property?.scrollBehavior,
        selected: currentIndex,
        onChanged: _defaultChangeIndex,
        items: _buildItems(),
      ),
      transitionBuilder: widget.property?.transitionBuilder ?? (child, animation) {
            return DrillInPageTransition(
              animation: animation,
              child: SafeArea(child: child),
            );
          },
      contentShape: widget.property?.contentShape ?? RoundedRectangleBorder(
            side: BorderSide(
              color: FluentTheme.of(context).resources.cardStrokeColorDefault,
            ),
          ),
      onOpenSearch: widget.property?.onOpenSearch,
      paneBodyBuilder: widget.property?.paneBodyBuilder,
    );
  }

  List<NavigationPaneItem> _buildItems() {
    if (widget.items == null) return [];

    return List.generate(
      widget.tabs.length,
      (index) {
        final item = widget.items![index];
        return PaneItem(
          mouseCursor: widget.property?.mouseCursor,
          selectedTileColor: widget.selectedTileColor != null
              ? ButtonState.all(widget.selectedTileColor)
              : null,
          tileColor: widget.tileColor != null
              ? ButtonState.all(widget.tileColor)
              : null,
          icon: item.icon,
          title: Text(item.label!),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.tabs[index],
          ),
        );
      },
    );
  }

  void _defaultChangeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.onChanged?.call(index);
  }
}

class NavigationViewWindowsProperty extends CoreWindowsProperty {
  /// Use this property to customize how the pane will be displayed.
  /// [PaneDisplayMode.auto] is used by default.
  final PaneDisplayMode? displayMode;

  /// The menu button used by this pane.
  ///
  /// If null, [buildMenuButton] is used
  final Widget? menuButton;

  /// The size of the pane in its various mode.
  final NavigationPaneSize? size;

  /// {@macro fluent_ui.controls.inputs.HoverButton.mouseCursor}
  final MouseCursor? mouseCursor;

  /// The header of the pane.
  ///
  /// If null, the space it should have taken will be removed from
  /// the pane ([PaneDisplayMode.minimal] and [PaneDisplayMode.open] only).
  ///
  /// Usually a [Text] or an [Image].
  ///
  /// ![Top Pane Header](https://docs.microsoft.com/en-us/windows/uwp/design/controls-and-patterns/images/navview-freeform-header-top.png)
  /// ![Left Pane Header](https://docs.microsoft.com/en-us/windows/uwp/design/controls-and-patterns/images/navview-freeform-header-left.png)
  final Widget? header;

  /// An optional control to allow for app-level search. Usually
  /// an [AutoSuggestBox]
  final Widget? autoSuggestBox;

  /// Used when the current display mode is [PaneDisplayMode.compact]
  /// as a replacement to [autoSuggestBox]. It's only displayed if
  /// [autoSuggestBox] is non-null.
  ///
  /// It's usually an [Icon] with [FluentIcons.search] as the icon.
  final Widget? autoSuggestBoxReplacement;

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

  /// The leading Widget for the Pane
  final Widget? leading;

  /// A function called when building the navigation indicator
  final Widget? indicator;

  /// How the body content should be clipped
  ///
  /// The body content is not clipped on when the display mode is [PaneDisplayMode.minimal]
  final ShapeBorder? contentShape;

  /// Called when the search button is tapped.
  ///
  /// This callback is invoked when [NavigationPane.autoSuggestBoxReplacement]
  /// is tapped.
  final VoidCallback? onOpenSearch;

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

  /// Can be used to override the widget that is built from
  /// the [PaneItem.body]. Only used if [pane] is provided.
  /// If nothing is selected, `body` will be null.
  ///
  /// This can be useful if you are using router-based navigation,
  /// and the body of the navigation pane is dynamically determined or
  /// affected by the current route rather than just by the currently
  /// selected pane.
  ///
  /// If this is not null then this builder will be responsible for state
  /// management of the child widget. One way to accomplish this is to
  /// use an [IndexedStack].
  final NavigationContentBuilder? paneBodyBuilder;

  const NavigationViewWindowsProperty({
    this.transitionBuilder,
    this.paneBodyBuilder,
    this.contentShape,
    this.onOpenSearch,
    this.displayMode,
    this.menuButton,
    this.mouseCursor,
    this.size,
    this.header,
    this.autoSuggestBox,
    this.autoSuggestBoxReplacement,
    this.scrollController,
    this.scrollBehavior,
    this.leading,
    this.indicator,
  });
}
