import 'package:flutter/widgets.dart';

/// to merge the current widget with another widget as its child.
extension MergeToChild on Widget {
  /// Merges the current widget with [child], separated by a SizedBox.
  ///
  /// If [child] is null, the current widget is returned as-is.
  Widget margeWith(
    Widget? child, [
    double? space = 4.0,
    Axis direction = Axis.horizontal,
  ]) {
    if (child == null) return this;

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [this, SizedBox(width: space), child],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [this, SizedBox(height: space), child],
      );
    }
  }
}

/// to apply a disabled effect by adjusting opacity.
extension ApplyDisabledEffect on Widget {
  /// Wraps the current widget with an `AnimatedOpacity` to visually indicate
  /// whether the widget is enabled or disabled.
  ///
  /// If [isDisabled] is `true`, the opacity is set to [disabledOpacity], indicating a disabled state;
  /// otherwise, the opacity is set to 1, indicating an enabled state.
  ///
  /// The animation duration is set to 80 milliseconds for a smooth transition.
  Widget applyDisabledEffect(bool isDisabled,
      [double disabledOpacity = 0.5, bool? ignoringPointer]) {
    return IgnorePointer(
      ignoring: ignoringPointer ?? isDisabled,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 120),
        opacity: isDisabled ? disabledOpacity : 1,
        child: this,
      ),
    );
  }
}
