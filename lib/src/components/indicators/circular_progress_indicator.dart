import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/core.dart';

/// A progress control provides feedback to the user that a long-running
/// operation is underway. It can mean that the user cannot interact with the
/// app when the progress indicator is visible, and can also indicate how long
/// the wait time might be.
///
/// It can be determinate or indeterminate.
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
  /// [radius] must be non-negative
  ///
  /// If [value] is non-null, it should be between 0 and 100, representing the progress percentage.
  /// If [value] is null, the circular progress will be considered indeterminate,
  /// indicating that the progress is ongoing without a specific completion percentage.
  ///
  /// See also:
  ///
  ///   * [AdaptiveProgressBarIndicator], a progress widget that shows progress in a horizontal bar.
  const AdaptiveCircularProgressIndicator({
    super.key,
    super.builders,
    this.value,
    this.radius = 15,
    this.activeColor,
    this.inactiveColor,
    this.semanticLabel,
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
  /// on macos: If [value] is null, it will be ignored.
  final Color? inactiveColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// Gets the clamped progress value, ensuring it's between 0 and 100.
  double? get progressValue => value?.clamp(0.0, 100.0);

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: ProgressRing(
        value: progressValue,
        activeColor: activeColor,
        semanticLabel: semanticLabel,
        backgroundColor: inactiveColor ??
            (theme.brightness == Brightness.dark
                ? FluentTheme.of(context).cardColor
                : null),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    if (value != null) {
      return ProgressCircle(
        radius: radius,
        value: progressValue,
        innerColor: activeColor,
        borderColor: inactiveColor,
        semanticLabel: semanticLabel,
      );
    }
    return Semantics(
      label: semanticLabel,
      child: CupertinoActivityIndicator(color: activeColor, radius: radius),
    );
  }
}
