import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class AdaptiveSearchItem<T> {
  /// The string to search for.
  final String searchKey;

  /// The widget to display in the search results overlay. If not specified, a
  /// [Text] widget with the default styling will appear instead.
  final Widget? child;

  /// The value of the search item. This can be any type of object.
  final T? value;

  /// The callback to call when this item is selected from the search results.
  final VoidCallback? onSelected;

  AdaptiveSearchItem({
    this.child,
    this.value,
    this.onSelected,
    required this.searchKey,
  });

  /// Converts the AdaptiveSearchItem to a SearchResultItem.
  ///
  /// This is a platform-specific class that represents a search item that can be displayed on macOS.
  SearchResultItem toSearchItem() {
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

  /// Converts the AdaptiveSearchItem to an AutoSuggestBoxItem.
  ///
  /// This is a platform-specific class that represents a search item that can be displayed on Windows.
  AutoSuggestBoxItem<T> toAutoSuggestBoxItem() {
    return AutoSuggestBoxItem<T>(
        label: searchKey, value: value, child: child, onSelected: onSelected);
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
  final Widget? child;
  final T? value;

  const _MacosChild({super.key, this.child, this.value});

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
