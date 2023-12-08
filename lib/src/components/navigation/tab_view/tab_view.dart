import 'package:flutter/widgets.dart';

import './tab.dart';
import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom tab view widget that adapts its appearance based on the platform.
///
/// Use this widget to create tab view with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTabView] is utilized.
/// - On Windows, [TabView] is used.
class AdaptiveTabView extends CoreAdaptiveComponent<TabViewWindowsProperty,
    TabViewMacosProperty> {
  /// The TabView passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveTabView(
  ///   currentIndex: _currentValue,
  ///   onChanged: (newValue) {
  ///     setState(() {
  ///       _currentValue = newValue;
  ///     });
  ///   },
  ///   tabs: tabs,
  ///   children: children,
  /// )
  /// ```
  const AdaptiveTabView({
    super.key,
    super.builders,
    super.properties,
    this.currentIndex = 0,
    this.onChanged,
    this.selectedColor,
    this.unSelectedColor,
    this.primaryBackgroundColor,
    this.secondaryBackgroundColor,
    required this.tabs,
    required this.children,
  }) : assert(
          tabs.length == children.length,
          '\nTabs and children lists must have the same length.\n'
          'The length of tabs (${tabs.length}) must be equal to the length of children (${children.length}).',
        );

  /// The current index of the selected tab.
  final int currentIndex;

  /// A callback function that is called when the selected tab index changes.
  final ValueChanged<int>? onChanged;

  /// The list of [AdaptiveTab] representing the tabs in the view.
  ///
  /// must be equal to the length of [children].
  final List<AdaptiveTab> tabs;

  /// The list of [Widget] representing the content for each tab.
  ///
  /// must be equal to the length of [tabs].
  final List<Widget> children;

  /// The primary background color.
  final Color? primaryBackgroundColor;

  /// The secondary background color.
  final Color? secondaryBackgroundColor;

  /// The color to be applied to the selected tab.
  final Color? selectedColor;

  /// The color to be applied to unselected tabs.
  final Color? unSelectedColor;

  @override
  Widget windows(BuildContext context) {
    return TabViewWindows(
      tabs: tabs,
      onChanged: onChanged,
      currentIndex: currentIndex,
      property: properties?.windows,
      selectedColor: selectedColor,
      unSelectedColor: unSelectedColor,
      primaryBackgroundColor: primaryBackgroundColor,
      secondaryBackgroundColor: secondaryBackgroundColor,
      children: children,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return TabViewMacos(
      tabs: tabs,
      onChanged: onChanged,
      currentIndex: currentIndex,
      property: properties?.macos,
      selectedColor: selectedColor,
      unSelectedColor: unSelectedColor,
      primaryBackgroundColor: primaryBackgroundColor,
      secondaryBackgroundColor: secondaryBackgroundColor,
      children: children,
    );
  }


}
