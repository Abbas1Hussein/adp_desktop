import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';
import '../menu/menu.dart';

class AdaptiveSwitch extends CoreAdaptiveComponent {
  const AdaptiveSwitch({
    super.key,
    super.builders,
    this.label,
    this.semanticLabel,
    this.activeKnobColor,
    this.trackKnobColor,
    this.activeColor,
    this.trackColor,
    this.onChanged,
    required this.value,
  });

  /// the current state of the switch: true for "on" and false for "off".
  final bool value;

  /// Callback function triggered when the switch state changes.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// if null, the switch button will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// AdaptiveSwitch(
  ///   value: _currentValue,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _currentValue = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// Widget used as the label associated with the switch.
  final Widget? label;

  /// Color of the switch knob when it is in the `on` state.
  final Color? activeKnobColor;

  /// Color of the switch knob when it is in the `off` state.
  final Color? trackKnobColor;

  /// Background color of the switch when it is in the `on` state.
  final Color? activeColor;

  /// Background color of the switch when it is in the `off` state.
  final Color? trackColor;

  /// A semantic label providing accessibility information for the switch.
  final String? semanticLabel;

  bool get _enabled => onChanged != null;

  @override
  Widget macos(BuildContext context) {
    final theme = MacosTheme.of(context);

    final knobColorOnState = activeKnobColor?.toMacosColor();
    final knobColorOffState = trackKnobColor?.toMacosColor();
    final backgroundColorOnState =
        (activeColor ?? theme.primaryColor).toMacosColor();
    final backgroundColorOffState =
        (trackColor ?? CupertinoColors.quaternarySystemFill).toMacosColor();

    final knobColor = value ? knobColorOnState : knobColorOffState;
    return MacosSwitch(
      value: value,
      onChanged: onChanged,
      knobColor: knobColor,
      activeColor: backgroundColorOnState,
      trackColor: backgroundColorOffState,
      semanticLabel: semanticLabel,
    ).margeWith(
      AdaptivePulldownMenuItem.disabledOpacity(
        GestureDetector(
          onTap: _enabled ? () => onChanged!(value ? false : true) : null,
          child: label,
        ),
        _enabled,
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    final defaultDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(100),
    );

    return ToggleSwitch(
      checked: value,
      content: label,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      style: ToggleSwitchThemeData(
        checkedDecoration: ButtonState.resolveWith((states) {
          return defaultDecoration.copyWith(
            color:
                activeColor ?? ButtonThemeData.checkedInputColor(theme, states),
            border: Border.all(
              color: ButtonThemeData.checkedInputColor(theme, states),
            ),
          );
        }),
        uncheckedDecoration: ButtonState.resolveWith((states) {
          return defaultDecoration.copyWith(
            color: trackColor ??
                ButtonState.forStates(
                  states,
                  disabled: theme.resources.controlAltFillColorDisabled,
                  pressed: theme.resources.controlAltFillColorQuarternary,
                  hovering: theme.resources.controlAltFillColorTertiary,
                  none: theme.resources.controlAltFillColorSecondary,
                ),
            border: Border.all(
              color: trackColor ??
                  ButtonState.forStates(
                    states,
                    disabled: theme.resources.controlStrongFillColorDisabled,
                    none: theme.resources.controlStrongFillColorDefault,
                  ),
            ),
          );
        }),
        checkedKnobDecoration: ButtonState.resolveWith((states) {
          return defaultDecoration.copyWith(
            color: states.isDisabled
                ? theme.resources.textOnAccentFillColorDisabled
                : activeKnobColor ??
                    theme.resources.textOnAccentFillColorPrimary,
          );
        }),
        uncheckedKnobDecoration: ButtonState.resolveWith((states) {
          return defaultDecoration.copyWith(
            color: states.isDisabled
                ? theme.resources.textFillColorDisabled
                : trackKnobColor ?? theme.resources.textFillColorSecondary,
          );
        }),
      ),
    );
  }
}
