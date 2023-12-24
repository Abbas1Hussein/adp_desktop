import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../fields/text_search_field/text_search_field.dart';
import '../navigation_appbar/navigation_app_bar.dart';
import 'navigation_view_item.dart';
import 'navigation_view_size.dart';
import 'platforms/platforms.dart';

/// A custom navigation view widget that adapts its appearance based on the platform.
///
/// Use this widget to create navigation view with platform-specific
/// styling and behavior:
/// - On macOS, [MacosWindow] is utilized.
/// - On Windows, [NavigationView] is used.
class AdaptiveNavigationView
    extends CoreAdaptiveComponent<NVWindowsProperty, NVMacosProperty> {
  /// The Navigation passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the navigation with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveNavigationView(
  ///   currentIndex: _currentValue,
  ///   onChanged: (newValue) {
  ///     setState(() {
  ///       _currentValue = newValue;
  ///     });
  ///   },
  ///   items: items,
  ///   children: children,
  /// )
  /// ```
  const AdaptiveNavigationView({
    super.key,
    super.properties,
    super.builders,
    this.size,
    this.navigationAppBar,
    this.onChanged,
    this.selectedColor,
    this.unselectedColor,
    this.currentIndex = 0,
    this.suggestionsSearchField,
    required this.items,
    required this.children,
  });

  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback triggered when the selected item changes.
  final ValueChanged<int>? onChanged;

  /// The color used for the selected navigation item.
  final Color? selectedColor;

  /// The color used for unselected navigation items.
  final Color? unselectedColor;

  /// The adaptive app bar displayed at the top of the navigation view.
  final AdaptiveNavigationAppBar? navigationAppBar;

  /// The adaptive size constraints for the navigation view.
  final AdaptiveNavigationViewSize? size;

  /// The list of widgets representing the body of each navigation item.
  ///
  /// Should have the same length of [items].
  final List<Widget> children;

  /// The list of navigation items.
  ///
  /// Should have the same length of [children].
  final List<AdaptiveNavigationViewItem> items;

  /// An adaptive text search field for suggestions.
  final AdaptiveTextSearchField? suggestionsSearchField;

  @override
  Widget build(BuildContext context) {
    validateLength();
    return super.build(context);
  }

  @override
  Widget windows(BuildContext context) {
    return NavigationViewWindows(
      tabs: children,
      items: items,
      size: size,
      onChanged: onChanged,
      currentIndex: currentIndex,
      tileColor: unselectedColor,
      selectedTileColor: selectedColor,
      property: properties?.windows,
      searchField: suggestionsSearchField != null
          ? Padding(
              padding: properties?.windows?.displayMode == PaneDisplayMode.top
                  ? const EdgeInsets.symmetric(horizontal: 4.0)
                  : EdgeInsets.zero,
              child: suggestionsSearchField?.windows(context),
            )
          : null,
      appBar: navigationAppBar?.toWindows(context),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return NavigationViewMacos(
      tabs: children,
      items: items,
      size: size,
      onChanged: onChanged,
      currentIndex: currentIndex,
      unselectedColor: unselectedColor,
      selectedColor: selectedColor,
      property: properties?.macos,
      searchField: suggestionsSearchField?.macos(context),
      toolBar: navigationAppBar?.toMacos(context),
    );
  }

  void validateLength() {
    final hasSameLength = items.length == children.length;
    assert(
      hasSameLength,
      "\n`items` and `tabs` must have the same length."
      "\nCurrently: items has ${items.length} elements and tabs has ${children.length} elements.",
    );
  }
}
