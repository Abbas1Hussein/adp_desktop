import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';
import '../../core/extension/object.dart';

/// A custom slider widget that adapts its appearance based on the platform.
///
/// Use this widget to create sliders with platform-specific
/// styling and behavior:
/// - On macOS, [MacosSlider] is utilized.
/// - On Windows, [Slider] is used.
class AdaptiveSlider extends CoreAdaptiveComponent {
  /// The slider passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveSlider(
  ///   value: _currentValue,
  ///   onChanged: (newValue) {
  ///     setState(() {
  ///       _currentValue = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  const AdaptiveSlider({
    super.key,
    super.builders,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.thumbColor,
    this.activeColor,
    this.inactiveColor,
    this.maxWidth = double.infinity,
    this.mouseCursor = SystemMouseCursors.grabbing,
    required this.value,
    required this.onChanged,
  })  : assert(min < max, "min must be less than max"),
        assert(value >= min && value <= max,
            'Value $value is not between minimum $min and maximum $max');

  /// The current value of the slider.
  final double value;

  /// A callback function that is called when the slider value changes.
  ///
  /// If null, the slider will be displayed as disabled.
  final ValueChanged<double>? onChanged;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// The maximum width of the slider.
  ///
  /// If not specified, it will default to [double.infinity].
  final double maxWidth;

  /// The color of the active portion of the slider.
  final Color? activeColor;

  /// Color for the inactive portion of the slider.
  final Color? inactiveColor;

  /// The color of the slider thumb.
  final Color? thumbColor;

  /// The number of discrete divisions in the slider.
  ///
  /// If null, the slider is continuous.
  final int? divisions;

  /// The mouse cursor to be used when hovering over the slider.
  ///
  /// by Defaults [SystemMouseCursors.grabbing].
  final MouseCursor mouseCursor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 25, maxWidth: maxWidth),
        child: super.build(context),
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return MouseRegion(
      cursor: mouseCursor,
      child: MacosSlider(
        max: max,
        min: min,
        value: onChanged.isNotNull ? value : 0,
        splits: divisions ?? 15,
        discrete: divisions.isNotNull,
        onChanged: (value) {
          if (onChanged.isNotNull) onChanged!(value);
        },
        color: activeColor ?? CupertinoColors.systemBlue,
        backgroundColor: onChanged.isNotNull
            ? inactiveColor ?? MacosColors.sliderBackgroundColor
            : CupertinoColors.quaternarySystemFill,
        tickBackgroundColor: onChanged.isNotNull
            ? inactiveColor ?? MacosColors.tickBackgroundColor
            : CupertinoColors.quaternarySystemFill,
        thumbColor: thumbColor ?? MacosColors.sliderThumbColor,
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return Slider(
      min: min,
      max: max,
      value: onChanged.isNotNull ? value : 0,
      onChanged: onChanged,
      divisions: divisions,
      style: SliderThemeData(
        thumbColor: thumbColor.isNotNull ? ButtonState.all(thumbColor) : null,
        activeColor:
            activeColor.isNotNull ? ButtonState.all(activeColor) : null,
        inactiveColor:
            inactiveColor.isNotNull ? ButtonState.all(inactiveColor) : null,
        margin: const EdgeInsets.all(8),
      ),
      mouseCursor: mouseCursor,
    );
  }
}
