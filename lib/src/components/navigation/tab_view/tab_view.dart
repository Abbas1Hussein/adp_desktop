import 'package:flutter/cupertino.dart';

import './tab.dart';
import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

class AdaptiveTabView extends CoreAdaptiveComponent<TabViewWindowsProperty, TabViewMacosProperty> {
  /// The current index of the selected tab.
  final int currentIndex;

  /// A callback function that is called when the selected tab index changes.
  final ValueChanged<int>? onChanged;

  /// The list of [AdaptiveTab] objects representing the tabs in the view.
  final List<AdaptiveTab> tabs;

  /// The list of [Widget] objects representing the content for each tab.
  final List<Widget> children;

  const AdaptiveTabView({
    super.key,
    super.builders,
    super.properties,
    this.currentIndex = 0,
    this.onChanged,
    required this.tabs,
    required this.children,
  }) : assert(
          tabs.length == children.length,
          '\nTabs and children lists must have the same length.\n'
          'The length of tabs (${tabs.length}) must be equal to the length of children (${children.length}).',
        );


  @override
  @mustCallSuper
  Widget windows(BuildContext context) {
    return TabViewWindows(
      tabs: tabs,
      onChanged: onChanged,
      property: properties?.windows,
      currentIndex: currentIndex,
      children: children,
    );
  }

  @override
  @mustCallSuper
  Widget macos(BuildContext context) {
    return TabViewMacos(
      tabs: tabs,
      onChanged: onChanged,
      property: properties?.macos,
      currentIndex: currentIndex,
      children: children,
    );
  }
}
