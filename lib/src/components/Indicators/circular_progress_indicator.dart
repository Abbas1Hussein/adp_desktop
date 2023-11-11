import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

/// A custom progress indicator widget that adapts its appearance based on the platform.
///
/// Use this widget to display a platform-specific progress indicator.
/// It supports macOS, Windows, Android, and iOS.
class AdaptiveCircularProgressIndicator extends CoreAdaptiveComponent {
  final Color? backgroundColor;

  final Color? color;

  final double? value;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// The radius of the progress circle. Defaults to 10px
  final double? radius;

  const AdaptiveCircularProgressIndicator({
    super.key,
    super.builders,
    this.backgroundColor,
    this.semanticLabel,
    this.radius,
    this.color,
    this.value,
  });

  @override
  Widget macos(BuildContext context) {
    if (isDeterminate) {
      return ProgressCircle(
        value: value,
        radius: radius ?? 10,
        innerColor: color,
        semanticLabel: semanticLabel,
        borderColor: backgroundColor,
      );
    }
    return Semantics(
      label: semanticLabel,
      child: CupertinoActivityIndicator(
        color: color,
        radius: radius ?? 10,
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return fluent_ui.ProgressRing(
      value: value,
      activeColor: color,
      strokeWidth: radius ?? 4.0,
      semanticLabel: semanticLabel,
      backgroundColor: backgroundColor,
    );
  }

  bool get isDeterminate => value != null;
}
