import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/core.dart';

enum DivisionsDirection {
  /// Divisions will be displayed above the slider.
  ///
  /// if is vertical [top] will be left.
  top,

  /// Divisions will be displayed below the slider.
  ///
  /// if is vertical [bottom] will be right.
  bottom,
}

/// A slider is a control that lets the user select from a range of values by
/// moving a thumb control along a track.
///
/// A slider is a good choice when you know that users think of the value as a
/// relative quantity, not a numeric value. For example, users think about
/// setting their audio volume to low or medium — not about setting the value to
/// 2 or 5.
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
  /// See also:
  ///
  ///   * [AdaptiveRatingIndicator], that allows users to view and set ratings.
  const AdaptiveSlider({
    super.key,
    super.builders,
    this.thumbColor,
    this.activeColor,
    this.inactiveColor,
    this.divisions,
    this.divisionsItems = const [],
    this.divisionsDirection = DivisionsDirection.bottom,
    this.mouseCursor = SystemMouseCursors.grabbing,
    this.vertical = false,
    this.min = 0.0,
    this.max = 100.0,
    this.size = double.infinity,
    required this.value,
    required this.onChanged,
  })  : assert(min < max, "min must be less than max"),
        assert(
          divisionsItems.length == 0 || divisionsItems.length == divisions,
          "Mismatch between divisions ($divisions) and divisionsItems (${divisionsItems.length}) length",
        ),
        assert(
          value >= min && value <= max,
          'Value $value is not between minimum $min and maximum $max',
        );

  /// The value of this slider.
  ///
  /// This value must be between [min] and [max], inclusive.
  final double value;

  /// A callback function that is called when the slider value changes.
  ///
  /// If null, the slider will be displayed as disabled.
  final ValueChanged<double>? onChanged;

  /// The maximum value the user can select.
  ///
  /// Defaults to 0.0. Must be greater than or equal to [min].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double min;

  /// The minimum value the user can select.
  ///
  /// Defaults to 100.0. Must be less than or equal to [max].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double max;

  /// The maximum width of the slider.
  ///
  /// If not specified, it will default to [double.infinity].
  final double size;

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

  /// A list of widgets representing the divisions to be displayed alongside the slider.
  ///
  /// The length of this list must match the value specified in [divisions].
  ///
  /// Typically used with a List of [Text] widgets.
  final List<Widget> divisionsItems;

  /// The direction in which the divisions are displayed in relation to the slider.
  ///
  /// If [divisionsDirection] is set to:
  /// - [DivisionsDirection.top], divisionsItems will be displayed above the slider.
  /// - [DivisionsDirection.bottom], divisionsItems will be displayed below the slider.
  ///
  /// Defaults to [DivisionsDirection.bottom].
  final DivisionsDirection divisionsDirection;

  /// Determines the orientation of the slider.
  ///
  /// If set to `true`, the slider is displayed vertically,
  /// making it useful for representing real-world values traditionally visualized in a
  /// vertical orientation, such as temperature levels or audio volume.
  ///
  /// Defaults to `false` for horizontal orientation.
  final bool vertical;

  /// The mouse cursor to be used when hovering over the slider.
  ///
  /// by Defaults [SystemMouseCursors.grabbing].
  final MouseCursor mouseCursor;

  bool get enabled => onChanged != null;

  @override
  Widget macos(BuildContext context) {
    return MouseRegion(
      cursor: mouseCursor,
      child: MacosSlider(
        max: max,
        min: min,
        value: enabled ? value : 0,
        splits: divisions ?? 15,
        discrete: divisions != null,
        onChanged: (value) => onChanged?.call(value),
        color: activeColor ?? CupertinoColors.systemBlue,
        backgroundColor: enabled
            ? inactiveColor ?? MacosColors.sliderBackgroundColor
            : CupertinoColors.quaternarySystemFill,
        tickBackgroundColor: enabled
            ? inactiveColor ?? MacosColors.tickBackgroundColor
            : CupertinoColors.quaternarySystemFill,
        semanticLabel: value.toStringAsFixed(0),
        thumbColor: thumbColor ?? activeColor ?? MacosColors.sliderThumbColor,
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return Slider(
      min: min,
      max: max,
      onChanged: onChanged,
      divisions: divisions,
      value: enabled ? value : 0,
      style: SliderThemeData(
        useThumbBall: divisions == null,
        thumbColor: thumbColor != null ? ButtonState.all(thumbColor) : null,
        activeColor: activeColor != null ? ButtonState.all(activeColor) : null,
        inactiveColor:
            inactiveColor != null ? ButtonState.all(inactiveColor) : null,
        margin: const EdgeInsets.symmetric(horizontal: 8),
      ),
      label: value.toStringAsFixed(0),
      mouseCursor: mouseCursor,
    );
  }

  Widget _buildMacosDivisions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: divisionsItems,
    );
  }

  Widget _buildWindowsDivisions() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.5, right: 13.5),
      child: Row(
        children: List.generate(
          divisionsItems.length,
          (index) => Expanded(child: divisionsItems[index]),
        ),
      ),
    );
  }

  Widget _buildSliderWithDivisions(BuildContext context) {
    final adpDivisions = adaptiveValue<Widget>(
      macos: () => _buildMacosDivisions(),
      windows: () => _buildWindowsDivisions(),
    );

    return Column(
      children: [
        if (divisionsDirection == DivisionsDirection.top) adpDivisions,
        super.build(context),
        if (divisionsDirection == DivisionsDirection.bottom) adpDivisions,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: vertical ? 3 : 0,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 55, maxWidth: size),
          child: (divisions != null && divisionsItems.isNotEmpty)
              ? _buildSliderWithDivisions(context)
              : super.build(context),
        ),
      ),
    );
  }
}
