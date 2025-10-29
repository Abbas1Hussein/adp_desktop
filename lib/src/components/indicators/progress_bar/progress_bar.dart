import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;

import '../../../core/common/construct/component.dart';
import 'progress_bar_macos.dart';

/// A progress control provides feedback to the user that a long-running
/// operation is underway. It can mean that the user cannot interact with the
/// app when the progress indicator is visible, and can also indicate how long
/// the wait time might be.
///
/// It can be determinate or indeterminate.
///
/// Use this widget to create progress bar indicator with platform-specific
/// styling and behavior:
/// - On macOS, [macos_ui.ProgressBar] is utilized.
/// - On Windows, [ProgressBar] is used.
class AdaptiveProgressBarIndicator extends CoreAdaptiveComponent {
  /// Creates an AdaptiveProgressBarIndicator.
  ///
  /// * [height] parameter specifies the height of the progress indicator line. Default is 4.5 pixels.
  ///
  /// * [semanticLabel] is used for accessibility by screen readers.
  ///
  /// * [activeTrackColor]  the color of the active portion of the progress bar.
  ///
  /// * [inactiveTrackColor] the color of the inactive portion of the progress bar
  ///
  /// If [value] is non-null, it should be between 0 and 100, representing the progress percentage.
  /// If [value] is null, the progress bar will be considered indeterminate,
  /// indicating that the progress is ongoing without a specific completion percentage.
  ///
  /// See also:
  ///
  /// * [AdaptiveCircularProgressIndicator] that shows progress in a circular form,
  /// either as a spinner or as a circle that fills in as progress continues.
  const AdaptiveProgressBarIndicator({
    super.key,
    super.builders,
    this.value,
    this.height = 4.5,
    this.semanticLabel,
    this.activeTrackColor,
    this.inactiveTrackColor,
  });

  /// if non-null, must be in the range of 0 to 100.
  ///
  /// If null, the progress bar will be considered indeterminate.
  final double? value;

  /// Height of the progress indicator line. Default is 4.5 pixels.
  final double height;

  /// The background color of the progress bar.
  final Color? inactiveTrackColor;

  /// The Color of the track progress indicator.
  final Color? activeTrackColor;

  /// Semantic label used by screen readers for accessibility.
  final String? semanticLabel;

  /// Calculates the clamped value within the range of 0 to 100.
  double? get clampedValue => value?.clamp(0, 100).toDouble();

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    return ProgressBar(
      strokeWidth: height,
      value: clampedValue,
      semanticLabel: semanticLabel,
      activeColor: activeTrackColor,
      backgroundColor: inactiveTrackColor ??
          (theme.brightness == Brightness.dark
              ? FluentTheme.of(context).cardColor
              : null),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return ProgressBarMacos(
      height: height,
      value: clampedValue,
      semanticLabel: semanticLabel,
      trackColor: activeTrackColor,
      backgroundColor: inactiveTrackColor,
    );
  }
}
