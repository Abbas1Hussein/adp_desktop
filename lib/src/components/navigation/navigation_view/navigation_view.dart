import 'package:flutter/cupertino.dart';

import '../../../core/common/construct/component.dart';
import '../../layout/appbar/appbar.dart';
import '../../layout/appbar/platforms/platforms.dart';
import 'navigation_view_item.dart';
import 'platforms/platforms.dart';

class AdaptiveNavigationView extends CoreAdaptiveComponent<
    NavigationViewWindowsProperty, NavigationViewMacosProperty> {
  final AdaptiveAppBar? appBar;

  final List<Widget> tabs;
  final List<AdaptiveNavigationViewItem> items;

  final ValueChanged<int>? onChanged;
  final int? currentIndex;

  final Color? selectedColor;
  final Color? unselectedColor;

  const AdaptiveNavigationView({
    super.key,
    super.properties,
    this.appBar,
    this.unselectedColor,
    this.selectedColor,
    this.currentIndex,
    this.onChanged,
    required this.items,
    required this.tabs,
  }) : assert(
          items.length == tabs.length,
          "`items` and `tabs` they must have the same length. "
          "Currently, items has ${items.length} elements and tabs has ${tabs.length} elements.",
        );

  @override
  Widget windows(BuildContext context) {
    return NavigationViewWindows(
      property: properties?.windows,
      appBar: appBar != null ? appBar?.windows(context) as AppBarWindows : null,
      tabs: tabs,
      items: items,
      onChanged: onChanged,
      currentIndex: currentIndex,
      tileColor: selectedColor,
      selectedTileColor: unselectedColor,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return NavigationViewMacos(
      property: properties?.macos,
      appBar: appBar != null ? appBar?.macos(context) as AppBarMacos : null,
      tabs: tabs,
      items: items,
      onChanged: onChanged,
      currentIndex: currentIndex,
      unselectedColor: unselectedColor,
      selectedColor: selectedColor,
    );
  }
}
