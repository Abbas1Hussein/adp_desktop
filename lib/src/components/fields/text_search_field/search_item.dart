import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';

/// entry class used in suggestions items within [AdaptiveTextSearchField].
class AdaptiveSearchItem<T>
    extends CoreModel<AutoSuggestBoxItem, SearchResultItem> {
  const AdaptiveSearchItem({
    this.child,
    this.value,
    this.onSelected,
    required this.searchKey,
  });

  /// The value of the search item. This can be any type of object.
  final T? value;

  /// The string to search for.
  final String searchKey;

  /// The callback to call when this item is selected from the search results.
  final VoidCallback? onSelected;

  /// The widget to display in the search results overlay. If not specified, a
  /// [Text] widget with the default styling will appear instead.
  final Widget? child;

  @override
  SearchResultItem toMacos(BuildContext context) {
    final defaultMacosChild = Text(
      searchKey,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: CupertinoColors.systemBackground,
      ),
    );
    return SearchResultItem(
      searchKey,
      onSelected: onSelected,
      child: _MacosChild(value: value, child: child ?? defaultMacosChild),
    );
  }

  @override
  AutoSuggestBoxItem<T> toWindows(BuildContext context) {
    return AutoSuggestBoxItem<T>(
        value: value, child: child, label: searchKey, onSelected: onSelected);
  }

  /// Converts a SearchResultItem to an AdaptiveSearchItem.
  static AdaptiveSearchItem<T> fromSearchItem<T>(
    SearchResultItem searchResultItem,
  ) {
    final macosChild = searchResultItem.child as _MacosChild;
    return AdaptiveSearchItem(
      child: macosChild.child,
      value: macosChild.value,
      searchKey: searchResultItem.searchKey,
      onSelected: searchResultItem.onSelected,
    );
  }

  /// Converts an AutoSuggestBoxItem to an AdaptiveSearchItem.
  static AdaptiveSearchItem<T> fromAutoSuggestBoxItem<T>(
    AutoSuggestBoxItem autoSuggestBoxItem,
  ) {
    return AdaptiveSearchItem(
      child: autoSuggestBoxItem.child,
      value: autoSuggestBoxItem.value,
      searchKey: autoSuggestBoxItem.label,
      onSelected: autoSuggestBoxItem.onSelected,
    );
  }
}

class _MacosChild<T> extends StatelessWidget {
  const _MacosChild({
    super.key,
    this.child,
    this.value,
  });

  final T? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
