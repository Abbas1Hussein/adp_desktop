import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

/// A custom circular progress indicator widget that adapts its appearance based on the platform.
///
/// Use this widget to create circular progress indicator with platform-specific
/// styling and behavior:
/// - On macOS, if the [value] is not null:
///   - [ProgressCircle] is employed; otherwise,
///   - [CupertinoActivityIndicator] is utilized.
/// - On Windows, [ProgressRing] is used.
class AdaptiveCircularProgressIndicator extends CoreAdaptiveComponent {
  /// Creates an AdaptiveCircularProgressIndicator.
  ///
  /// The [value] should be between 0 and 100.
  const AdaptiveCircularProgressIndicator({
    super.key,
    super.builders,
    this.innerColor,
    this.semanticLabel,
    this.radius = 15,
    this.borderColor,
    this.value,
  });

  /// The progress value, ranging from 0 to 100.
  final double? value;

  /// The inner color of the progress circle.
  final Color? innerColor;

  /// The border color of the progress circle.
  final Color? borderColor;

  /// The radius of the progress circle.
  ///
  /// Defaults to 15px.
  final double radius;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// Gets the clamped progress value, ensuring it's between 0 and 100.
  double? get progressValue => value?.clamp(0.0, 100.0);

  @override
  Widget macos(BuildContext context) {
    if (value != null) {
      return Container(
        decoration: innerColor != null
            ? BoxDecoration(
                color: innerColor,
                backgroundBlendMode: BlendMode.color,
                shape: BoxShape.circle,
              )
            : null,
        child: ProgressCircle(
          radius: radius,
          value: progressValue,
          innerColor: innerColor,
          borderColor: borderColor,
          semanticLabel: semanticLabel,
        ),
      );
    }
    return Semantics(
      label: semanticLabel,
      child: CupertinoActivityIndicator(color: borderColor, radius: radius),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: ProgressRing(
        value: progressValue,
        activeColor: borderColor,
        semanticLabel: semanticLabel,
        backgroundColor: innerColor,
      ),
    );
  }
}
