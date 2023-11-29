import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/core.dart';

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
  /// * [semanticLabel] is used for accessibility by screen readers.
  ///
  /// * [inactiveColor] the inner color of the progress circle when [value] is null.
  ///
  /// * [activeColor] the border color of the progress circle.
  ///
  /// * [radius] specifies the radius of the progress circle. Defaults to 15 pixels.
  ///
  /// If [value] is non-null, it should be between 0 and 100, representing the progress percentage.
  /// If [value] is null, the circular progress will be considered indeterminate,
  /// indicating that the progress is ongoing without a specific completion percentage.
  const AdaptiveCircularProgressIndicator({
    super.key,
    super.builders,
    this.inactiveColor,
    this.semanticLabel,
    this.radius = 15,
    this.activeColor,
    this.value,
  });

  /// The progress value, ranging from 0 to 100.
  final double? value;

  /// The radius of the progress circle.
  ///
  /// Defaults to 15px.
  final double radius;

  /// The border color of the progress circle.
  final Color? activeColor;

  /// The inner color of the progress circle.
  ///
  /// If [value] is null, it will be ignored.
  final Color? inactiveColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// Gets the clamped progress value, ensuring it's between 0 and 100.
  double? get progressValue => value?.clamp(0.0, 100.0);

  @override
  Widget macos(BuildContext context) {
    if (value.isNotNull) {
      return Container(
        decoration: PlatformRuining.isFakeMacos && activeColor.isNotNull
            ? BoxDecoration(
                color: activeColor,
                backgroundBlendMode: BlendMode.color,
                shape: BoxShape.circle,
              )
            : null,
        child: ProgressCircle(
          radius: radius,
          value: progressValue,
          borderColor: activeColor,
          innerColor: inactiveColor,
          semanticLabel: semanticLabel,
        ),
      );
    }
    return Semantics(
      label: semanticLabel,
      child: CupertinoActivityIndicator(color: activeColor, radius: radius),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: ProgressRing(
        value: progressValue,
        activeColor: activeColor,
        semanticLabel: semanticLabel,
        backgroundColor: value.isNotNull ? inactiveColor : null,
      ),
    );
  }
}
