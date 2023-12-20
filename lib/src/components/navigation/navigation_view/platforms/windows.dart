import 'package:fluent_ui/fluent_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../../../layout/appbar/platforms/desktop/windows.dart';
import '../navigation_view_item.dart';
import '../navigation_view_size.dart';

class NavigationViewWindows extends StatelessWidget {
  const NavigationViewWindows({
    super.key,
    this.size,
    this.items,
    this.appBar,
    this.property,
    this.tileColor,
    this.onChanged,
    this.searchField,
    this.currentIndex = 0,
    this.selectedTileColor,
    required this.tabs,
  });

  /// The Windows-specific property for customizing the navigation view.
  final NVWindowsProperty? property;

  /// The list of widgets representing the body of each navigation item.
  final List<Widget> tabs;

  /// The list of navigation items.
  final List<AdaptiveNavigationViewItem>? items;

  /// The adaptive app bar displayed at the top of the navigation view.
  final AppBarWindows? appBar;

  /// The color of the tile when unselected.
  final Color? tileColor;

  /// The color of the tile when selected.
  final Color? selectedTileColor;

  /// The current selected index.
  final int currentIndex;

  /// Called when the current selected index should be changed.
  final ValueChanged<int>? onChanged;

  /// An optional search field widget.
  final Widget? searchField;

  /// The adaptive size constraints for the navigation view.
  final AdaptiveNavigationViewSize? size;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: appBar?.toNavigationAppBar(context),
      pane: NavigationPane(
        size: NavigationPaneSize(
          openMaxWidth: size?.maxWidth,
          openMinWidth: size?.minWidth,
          openWidth: size?.startWidth,
          headerHeight: size?.topOffset,
        ),
        items: _buildItems(),
        selected: currentIndex,
        autoSuggestBox: searchField,
        onChanged: onChanged,
        leading: property?.leading,
        menuButton: property?.menuButton,
        scrollBehavior: property?.scrollBehavior,
        scrollController: property?.scrollController,
        header: property?.header ?? const SizedBox.shrink(),
        displayMode: property?.displayMode ?? PaneDisplayMode.auto,
        indicator: property?.indicator ?? const StickyNavigationIndicator(),
        autoSuggestBoxReplacement: searchField != null ? const Icon(FluentIcons.search) : null,
      ),
      onOpenSearch: property?.onOpenSearch,
      contentShape: property?.contentShape ?? RoundedRectangleBorder(
            side: BorderSide(
              color: FluentTheme.of(context).resources.cardStrokeColorDefault,
            ),
          ),
      transitionBuilder: property?.transitionBuilder ?? (child, animation) {
            return DrillInPageTransition(
              animation: animation,
              child: SafeArea(child: child),
            );
          },
    );
  }

  List<NavigationPaneItem> _buildItems() {
    if (items == null || items!.isEmpty) return [];

    final body = tabs[currentIndex];

    return items!.map(
      (e) {
        return e.toPaneItem(body, tileColor, selectedTileColor);
      },
    ).toList();
  }
}

class NVWindowsProperty extends CoreWindowsProperty {
  const NVWindowsProperty({
    this.header,
    this.leading,
    this.indicator,
    this.menuButton,
    this.displayMode,
    this.onOpenSearch,
    this.contentShape,
    this.transitionBuilder,
    this.scrollController,
    this.scrollBehavior,
  });

  /// Use this property to customize how the pane will be displayed.
  /// [PaneDisplayMode.auto] is used by default.
  final PaneDisplayMode? displayMode;

  /// The menu button used by this pane.
  ///
  /// If null, [buildMenuButton] is used
  final Widget? menuButton;

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
}
