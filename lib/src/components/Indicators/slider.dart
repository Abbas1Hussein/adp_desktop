import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

class AdaptiveSlider extends CoreAdaptiveComponent {
  /// The current value of the slider.
  final double value;

  /// A callback function that is called when the slider value changes.
  final ValueChanged<double>? onChanged;

  /// A callback function that is called when the user starts interacting with the slider.
  final ValueChanged<double>? onChangeStart;

  /// A callback function that is called when the user finishes interacting with the slider.
  final ValueChanged<double>? onChangeEnd;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// The number of discrete divisions in the slider (if not null).
  final int? divisions;

  /// Label for the slider (supported in Windows and Android).
  final String? label;

  /// The color of the active portion of the slider.
  final Color? activeColor;

  /// Color for the inactive portion of the slider (not supported in iOS).
  final Color? inactiveColor;

  /// The color of the slider thumb.
  final Color? thumbColor;

  /// The mouse cursor to be used when hovering over the slider.
  final MouseCursor mouseCursor;

  /// A FocusNode to manage focus on the slider.
  final FocusNode? focusNode;

  /// Whether the slider should autofocus when the widget is first displayed.
  final bool autofocus;

  const AdaptiveSlider({
    super.key,
    super.builders,
    this.min = 0.0,
    this.max = 1.0,
    this.label,
    this.onChangeStart,
    this.onChangeEnd,
    this.divisions,
    this.inactiveColor,
    this.activeColor,
    this.thumbColor,
    this.focusNode,
    this.mouseCursor = SystemMouseCursors.grabbing,
    this.autofocus = false,
    required this.value,
    required this.onChanged,
  })  : assert(min < max, "min must be less than max"),
        assert(value >= min && value <= max,
            'Value $value is not between minimum $min and maximum $max');

  @override
  Widget android(BuildContext context) {
    return Slider(
      min: min,
      max: max,
      label: label,
      value: value,
      onChanged: onChanged,
      onChangeEnd: onChangeEnd,
      onChangeStart: onChangeStart,
      divisions: divisions,
      thumbColor: thumbColor,
      mouseCursor: mouseCursor,
      inactiveColor: inactiveColor,
      activeColor: activeColor,
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }

  @override
  Widget ios(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Focus(
        autofocus: autofocus,
        focusNode: focusNode,
        child: MouseRegion(
          cursor: mouseCursor,
          child: CupertinoSlider(
            value: value,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
            min: min,
            max: max,
            divisions: divisions,
            activeColor: activeColor,
            thumbColor: thumbColor ?? CupertinoColors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return MouseRegion(
      cursor: mouseCursor,
      child: Focus(
        autofocus: autofocus,
        focusNode: focusNode,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragStart: (details) {
            onChangeStart?.call(value);
          },
          onHorizontalDragEnd: (details) {
            onChangeEnd?.call(value);
          },
          child: MacosSlider(
            value: value,
            onChanged: (change) => onChanged?.call(change),
            backgroundColor: inactiveColor ?? MacosColors.sliderBackgroundColor,
            color: activeColor ?? CupertinoColors.systemBlue,
            max: max,
            min: min,
            discrete: divisions != null,
            splits: divisions ?? 15,
            tickBackgroundColor:
                inactiveColor ?? MacosColors.tickBackgroundColor,
            thumbColor: thumbColor ?? MacosColors.sliderThumbColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 25),
      child: fluent_ui.Slider(
        value: value,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        style: fluent_ui.SliderThemeData(
          thumbColor:
              thumbColor != null ? fluent_ui.ButtonState.all(thumbColor) : null,
          activeColor: activeColor != null
              ? fluent_ui.ButtonState.all(activeColor)
              : null,
          inactiveColor: inactiveColor != null
              ? fluent_ui.ButtonState.all(inactiveColor)
              : null,
          margin: const EdgeInsets.all(8),
        ),
        mouseCursor: mouseCursor,
        focusNode: focusNode,
        autofocus: autofocus,
      ),
    );
  }
}
