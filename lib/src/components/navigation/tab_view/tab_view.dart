import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../icon/icon_theme.dart';
import './tab.dart';
import 'platforms/platforms.dart';

const kContentPadding = EdgeInsets.all(8.0);

/// The AdaptiveTabView widget provides a unified approach for creating a tab view
/// that adjusts its appearance based on the underlying platform,
/// making it easy to create consistent navigation experiences.
///
/// See also:
///
///   * [AdaptiveNavigationView], control provides top-level navigation for your app.
///
/// Use this widget to create tab view with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTabView] is utilized.
/// - On Windows, [TabView] is used.
class AdaptiveTabView extends CoreAdaptiveComponent<TabViewWindowsProperty,
    TabViewMacosProperty> {
  /// Creates a adaptive tab view
  ///
  /// A tab view contains a row of navigational items, [tabs], that move the
  /// user through the provided views ([children]). The user selects the desired
  /// page by clicking the appropriate tab.
  ///
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the tab view separately for Windows and macOS platforms.
  /// You can provide specific [properties] for each platform using `TabViewWindowsProperty`
  /// and `TabViewMacosProperty` respectively.
  ///
  /// - [tabs] must have at least 2 items and must be equal to the length of [children].
  /// - [currentIndex] must be in the range of 0 to [items.length]
  const AdaptiveTabView({
    super.key,
    super.builders,
    super.properties,
    this.onChanged,
    this.primaryColor,
    this.secondaryColor,
    this.selectedTabColor,
    this.unselectedTabColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.currentIndex = 0,
    this.contentMargin,
    this.contentPadding = kContentPadding,
    required this.tabs,
    required this.children,
  })  : assert(tabs.length >= 2),
        assert(
          tabs.length == children.length,
          '\nTabs and children lists must have the same length.\n'
          'The length of tabs (${tabs.length}) must be equal to the length of children (${children.length}).',
        ),
        assert(currentIndex >= 0 && currentIndex < tabs.length);

  /// The current selected index. This must be in the range of 0 to [tabs.length].
  final int currentIndex;

  /// Called when the current selected index should be changed.
  ///
  /// The tab view passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the tab view with the new
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

  /// List of [AdaptiveTab] representing the tabs in the view.
  ///
  /// Must have at least two items and be of the same length as [children].
  final List<AdaptiveTab> tabs;

  /// List of widgets representing the body of each tab view.
  ///
  /// Each widget corresponds to a tab in the [tabs]. The list should have the same length
  /// as the number of tabs.
  final List<Widget> children;

  /// Padding around the content within each [children] body in the tab view.
  ///
  /// The `contentPadding` parameter allows you to specify padding around the children content,
  /// Default 8.0 is applied.
  final EdgeInsetsGeometry contentPadding;

  /// Margin around the content within each [children] body in the tab view.
  ///
  /// If `contentMargin` is provided, it determines the margin around the children content
  /// If `null`, the default margin is used based on the underlying platform:
  /// - On macOS: `12.0` is used,
  /// - On Windows: `zero` margin is applied.
  final EdgeInsetsGeometry? contentMargin;

  /// The primary background color of the tab view.
  ///
  /// The `primaryColor` parameter allows you to specify the background color of the entire
  /// tab view. If `null`, the default background color of the underlying platform is used.
  final Color? primaryColor;

  /// The secondary background color of the tab view.
  ///
  /// The `secondaryColor` parameter allows you to specify the secondary background color of the entire
  /// tab view. If `null`, the default secondary background color of the underlying platform is used.
  final Color? secondaryColor;

  /// The color of the tab when selected.
  ///
  /// The `selectedTabColor` parameter defines the background color of the tab's
  /// when it is selected. This color is applied to indicate the currently active.
  final Color? selectedTabColor;

  /// The color of the tab when unselected.
  ///
  /// The `unselectedTabColor` parameter allows you to specify the color of the tab's
  /// when it is not selected. It is the background color of the item representing an tab's in the [AdaptiveTabView].
  final Color? unselectedTabColor;

  /// The text style for the selected label.
  ///
  /// The `selectedLabelStyle` parameter defines the text style of the label or text associated with
  /// the currently selected tabs. It allows you to customize the appearance of the text
  /// when the tab is in a selected state.
  final TextStyle? selectedLabelStyle;

  /// The text style for the unselected label.
  ///
  /// The `unselectedLabelStyle` parameter specifies the text style for the label or text associated
  /// with unselected tabs. This style is applied to the text when the item is not in focus.
  final TextStyle? unselectedLabelStyle;

  /// The theme for the selected icon.
  ///
  /// The `selectedIconTheme` parameter allows you to customize the visual appearance of icons associated
  /// with the currently selected tabs. You can adjust properties such as the icon's color,
  /// size, and opacity when the tab is selected.
  final AdaptiveIconThemeData? selectedIconTheme;

  /// The theme for the unselected icon.
  ///
  /// Similar to `selectedIconTheme`, the `unselectedIconTheme` parameter lets you customize the visual
  /// appearance of icons for unselected tabs. You can control the color, size, and opacity
  /// when they are not in focus.
  final AdaptiveIconThemeData? unselectedIconTheme;

  @override
  Widget windows(BuildContext context, [TabViewWindowsProperty? property]) {
    return TabViewWindows(
      tabs: tabs,
      property: property,
      onChanged: onChanged,
      currentIndex: currentIndex,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      contentMargin: contentMargin,
      contentPadding: contentPadding,
      selectedTabColor: selectedTabColor,
      unselectedTabColor: unselectedTabColor,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      selectedIconTheme: selectedIconTheme?.toWindows(context),
      unselectedIconTheme: unselectedIconTheme?.toWindows(context),
      children: children,
    );
  }

  @override
  Widget macos(BuildContext context, [TabViewMacosProperty? property]) {
    return TabViewMacos(
      tabs: tabs,
      property: property,
      onChanged: onChanged,
      currentIndex: currentIndex,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      contentMargin: contentMargin,
      contentPadding: contentPadding,
      selectedTabColor: selectedTabColor,
      unselectedTabColor: unselectedTabColor,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      selectedIconTheme: selectedIconTheme?.toMacos(context),
      unselectedIconTheme: unselectedIconTheme?.toMacos(context),
      children: children,
    );
  }
}
