import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

enum DivisionsDirection {
  /// Divisions will be displayed above the slider.
  top,

  /// Divisions will be displayed below the slider.
  bottom,
}

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
    this.thumbColor,
    this.activeColor,
    this.inactiveColor,
    this.divisions,
    this.divisionsItems = const [],
    this.divisionsDirection = DivisionsDirection.bottom,
    this.mouseCursor = SystemMouseCursors.grabbing,
    this.vertical = false,
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
        semanticLabel: value.toStringAsFixed(0),
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
        useThumbBall: divisions.isNull,
        thumbColor: thumbColor.isNotNull ? ButtonState.all(thumbColor) : null,
        activeColor:
            activeColor.isNotNull ? ButtonState.all(activeColor) : null,
        inactiveColor:
            inactiveColor.isNotNull ? ButtonState.all(inactiveColor) : null,
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
          child: (divisions.isNotNull && divisionsItems.isNotEmpty)
              ? _buildSliderWithDivisions(context)
              : super.build(context),
        ),
      ),
    );
  }
}
