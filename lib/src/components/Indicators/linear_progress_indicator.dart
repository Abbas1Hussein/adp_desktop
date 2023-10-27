import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

/// A custom progress indicator widget that adapts its appearance based on the platform.
///
/// Use this widget to display a platform-specific progress indicator.
/// It supports macOS, Windows, Android, and iOS.
class AdaptiveLinerProgressIndicator extends CoreAdaptiveComponent {
  final Color? backgroundColor;
  final Color? color;

  /// value must be in the range of 0 and 100
  final double? value;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  const AdaptiveLinerProgressIndicator({
    super.key,
    super.builders,
    this.backgroundColor,
    this.semanticLabel,
    this.color,
    this.value,
  });

  @override
  Widget macos(BuildContext context) {
    final clampedValue = value?.clamp(0, 100).toDouble();
    return ProgressBar(
      value: clampedValue ?? 1,
      backgroundColor: backgroundColor,
      semanticLabel: semanticLabel,
      trackColor: color,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return fluent_ui.ProgressBar(
      value: value,
      activeColor: color,
      semanticLabel: semanticLabel,
      backgroundColor: backgroundColor,
    );
  }
}
