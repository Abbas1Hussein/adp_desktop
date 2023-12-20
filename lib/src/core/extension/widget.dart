import 'package:flutter/widgets.dart';

/// to merge the current widget with another widget as its child.
extension MergeToChild on Widget {
  /// Merges the current widget with [child], separated by a SizedBox.
  ///
  /// If [child] is null, the current widget is returned as-is.
  Widget margeWith(
    Widget? child, [
    double? space = 4.0,
    Axis axis = Axis.horizontal,
  ]) {
    if (child == null) return this;

    if (axis == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [this, SizedBox(width: space), child],
      );
    } else {
      return Column(
        children: [this, SizedBox(height: space), child],
      );
    }
  }
}
