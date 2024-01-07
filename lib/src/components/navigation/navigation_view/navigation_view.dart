import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../navigation_appbar/navigation_app_bar.dart';
import 'navigation_sidebar.dart';
import 'platforms/platforms.dart';

/// The AdaptiveNavigationView widget provides a unified approach for creating a navigation view
/// that adjusts its appearance based on the underlying platform,
/// making it easy to create consistent navigation experiences.
///
/// The AdaptiveNavigationView is designed to be a top level container for
/// a [AdpApp]. This means that adding a AdaptiveNavigationView
/// to each route on a adp app will provide the app with
/// platform's basic visual layout structure.
///
/// See also:
///
/// * [AdaptiveTabView] and this provides top-level navigation for your app.
///
/// Use this widget to create a navigation view with platform-specific
/// styling and behavior:
/// - On macOS, [MacosWindow] is utilized.
/// - On Windows, [NavigationView] is used.
class AdaptiveNavigationView extends CoreAdaptiveComponent<
    NavigationViewWindowsProperty, NavigationViewMacosProperty> {
  /// Creates an adaptive navigation view.
  ///
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the navigation view separately for Windows and macOS platforms.
  /// You can provide specific [properties] for each platform using `NavigationViewWindowsProperty`
  /// and `NavigationViewMacosProperty` respectively.
  ///
  /// - [children] should have the same length as the number of items in the navigation sidebar.
  ///
  /// See also:
  ///   * [AdaptiveNavigationSidebar] Use this widget to create a visually consistent and platform-specific navigation
  ///   sidebar handling navigation items [sidebar].
  ///   * [AdaptiveNavigationAppBar] An adaptive app bar component that displayed at the top of the navigation view [appBar].
  const AdaptiveNavigationView({
    super.key,
    super.builders,
    super.properties,
    this.appBar,
    this.sidebar,
    this.contentPadding,
    this.backgroundColor,
    required this.children,
  });

  /// The adaptive app bar displayed at the top of the navigation view.
  ///
  /// The `appBar` parameter allows you to provide an adaptive app bar that is displayed at the
  /// top of the navigation view.
  final AdaptiveNavigationAppBar? appBar;

  /// An adaptive navigation sidebar for handling navigation items.
  ///
  /// The `sidebar` parameter allows you to provide an adaptive navigation sidebar that handles
  /// navigation items. The appearance and behavior of the sidebar can be customized based on the
  /// underlying platform.
  ///
  /// The [sidebar.items] should have the same length as the number of [children].
  final AdaptiveNavigationSidebar? sidebar;

  /// The list of widgets representing the body of each navigation item.
  ///
  /// Each widget corresponds to a navigation item in the [sidebar]. It should have the same length as
  /// the number of items in the navigation sidebar.
  final List<Widget> children;

  /// Optional padding around the body content.
  ///
  /// The `padding` parameter allows you to specify padding around the body content of each body,
  /// If `null`, a default padding of 8.0 is applied.
  final EdgeInsets? contentPadding;

  /// The background color of the navigation view.
  ///
  /// The `backgroundColor` parameter allows you to specify the background color of the entire
  /// navigation view. If `null`, the default background color of the underlying platform is used.
  final Color? backgroundColor;

  Widget get body {
    return Padding(
      padding: contentPadding ?? const EdgeInsets.all(8.0),
      child: CustomSingleChildLayout(
        delegate: DesktopTextSelectionToolbarLayoutDelegate(
          anchor: Offset.zero,
        ),
        child: children[sidebar?.currentIndex ?? 0],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    validateLength();
    return super.build(context);
  }

  @override
  Widget windows(
    BuildContext context, [
    NavigationViewWindowsProperty? property,
  ]) {
    final sidebarProperty = sidebar?.properties?.windows;

    return NavigationPaneTheme(
      data: NavigationPaneThemeData(
        selectedTextStyle: ButtonState.all(sidebar?.selectedLabelStyle),
        unselectedTextStyle: ButtonState.all(sidebar?.unselectedLabelStyle),
      ),
      child: NavigationView(
        contentShape: property?.contentShape,
        onOpenSearch: sidebarProperty?.onOpenSearch,
        transitionBuilder: property?.transitionBuilder,
        onDisplayModeChanged: property?.onDisplayModeChanged,
        clipBehavior: property?.clipBehavior ?? Clip.antiAlias,
        appBar: appBar?.toWindows(context, property?.displayMode),
        pane: sidebar?.toWindows(context, body, property?.displayMode),
        paneBodyBuilder: (item, body) {
          return backgroundColor != null
              ? ColoredBox(color: backgroundColor!, child: body)
              : body!;
        },
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [NavigationViewMacosProperty? property]) {
    final theme = MacosTheme.of(context);

    return ColoredBox(
      color: theme.canvasColor,
      child: MacosWindow(
        titleBar: property?.titleBar,
        sidebar: sidebar?.toMacos(context),
        disableWallpaperTinting: property?.disableWallpaperTinting ?? false,
        sidebarState: property?.sidebarState ??
            NSVisualEffectViewState.followsWindowActiveState,
        child: MacosScaffold(
          toolBar: appBar?.toMacos(context),
          children: [
            ContentArea(
              minWidth: double.infinity,
              builder: (context, scrollController) {
                return ColoredBox(
                  color: backgroundColor ?? theme.canvasColor,
                  child: DefaultTextStyle(
                      style: theme.typography.body, child: body),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateLength() {
    final hasSameLength = sidebar?.items.length == children.length;
    assert(
      hasSameLength,
      "\n`items` and `tabs` must have the same length."
      "\nCurrently: items has ${sidebar?.items.length} elements and tabs has ${children.length} elements.",
    );
  }
}
