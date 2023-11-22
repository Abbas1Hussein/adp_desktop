import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';

/// A custom radio button widget that adapts its appearance based on the platform.
///
/// Use this widget to create checkbox buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosRadioButton] is utilized.
/// - On Windows, [RadioButton] is used.
class AdaptiveRadio<T> extends CoreAdaptiveComponent {
  const AdaptiveRadio({
    super.key,
    super.builders,
    this.label,
    this.activeColor,
    this.disabledColor,
    this.semanticLabel,
    this.groupValue,
    this.onChanged,
    required this.value,
  });

  /// The value represented by this adp radio button.
  final T value;

  /// The currently selected value for a group of adp radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T? groupValue;

  /// Called when the user selects this adp radio button.
  ///
  /// The radio button passes [value] as a parameter to this callback. The radio
  /// button does not actually change state until the parent widget rebuilds the
  /// radio button with the new [groupValue].
  ///
  /// If null, the radio button will be displayed as disabled.
  ///
  /// The provided callback will not be invoked if this radio button is already
  /// selected.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveRadio<SingingCharacter>(
  ///   value: SingingCharacter.lafayette,
  ///   groupValue: _character,
  ///   onChanged: (SingingCharacter? newValue) {
  ///     setState(() {
  ///       _character = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<T>? onChanged;

  /// The active color for the radio button.
  final Color? activeColor;

  /// The color to display when the radio button is disabled.
  final Color? disabledColor;

  /// A brief description of the radio button for accessibility.
  final String? semanticLabel;

  /// The widget that be displayed alongside the radio button.
  final Widget? label;

  bool get _selected => value == groupValue;

  @override
  Widget macos(BuildContext context) {
    return MacosRadioButton<T>(
      value: value,
      groupValue: groupValue,
      onColor: activeColor,
      offColor: disabledColor ?? CupertinoColors.tertiaryLabel,
      onChanged: (value) => onChanged?.call(value as T),
      semanticLabel: semanticLabel,
    ).margeWith(
      GestureDetector(child: label, onTap: () => onChanged?.call(value)),
      4.0,
    );
  }

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);
    return RadioButtonTheme.merge(
      data: RadioButtonThemeData(
        foregroundColor: ButtonState.resolveWith((states) {
          return states.isDisabled
              ? theme.resources.textFillColorDisabled
              : null;
        }),
        checkedDecoration: ButtonState.resolveWith((states) {
          return BoxDecoration(
            border: Border.all(
              color: ButtonThemeData.checkedInputColor(theme, states),
              width: !states.isDisabled
                  ? states.isHovering && !states.isPressing
                      ? 3.4
                      : 5.0
                  : 4.0,
            ),
            shape: BoxShape.circle,
            color: activeColor ?? theme.resources.textOnAccentFillColorPrimary,
          );
        }),
        uncheckedDecoration: ButtonState.resolveWith((states) {
          return BoxDecoration(
            color: ButtonState.forStates(
              states,
              disabled: theme.resources.controlAltFillColorDisabled,
              pressed: theme.resources.controlAltFillColorQuarternary,
              hovering: theme.resources.controlAltFillColorTertiary,
              none: theme.resources.controlAltFillColorSecondary,
            ),
            border: Border.all(
              width: states.isPressing ? 4.5 : 1,
              color: ButtonState.forStates(
                states,
                disabled: theme.resources.textFillColorDisabled,
                pressed: theme.accentColor.defaultBrushFor(theme.brightness),
                none: disabledColor ?? theme.resources.textFillColorTertiary,
              ),
            ),
            shape: BoxShape.circle,
          );
        }),
      ),
      child: RadioButton(
        content: label,
        checked: _selected,
        semanticLabel: semanticLabel,
        onChanged: (_) => onChanged?.call(value),
      ),
    );
  }
}
