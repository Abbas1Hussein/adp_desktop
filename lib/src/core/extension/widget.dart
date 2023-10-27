import 'package:flutter/widgets.dart';

/// An extension method to merge the current widget with another widget as its child.
/// If [title] is null, it returns the current widget unchanged.
extension MergeToChild on Widget {
  /// Merges the current widget with [child], separated by a SizedBox.
  ///
  /// If [child] is null, the current widget is returned as-is.
  Widget margeWith(Widget? child,[double? space]) {
    if (child == null) return this;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [this,  SizedBox(width: space ??  8.0), child],
    );
  }
}
