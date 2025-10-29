import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';

/// The switch represents a physical switch that allows users to turn
/// things on or off, like a light switch. Use switch controls to present
/// users with two mutually exclusive options (such as on/off), where choosing
/// an option provides immediate results.
///
/// Use a switch for binary operations that take effect right after the
/// user flips the switch,Think of the switch as a physical power switch for a device: you flip
/// it on or off when you want to enable or disable the action performed by the device.
///
/// Use this widget to create switch buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosSwitch] is utilized.
/// - On Windows, [ToggleSwitch] is used.
class AdaptiveSwitch extends CoreAdaptiveComponent {
  /// Creates a adp-style switch.
  ///
  /// See also:
  ///
  ///  * [AdaptiveCheckbox], which let the user select multiple items from a collection of
  ///    two or more items
  ///  * [AdaptiveRadioButton], which let the user select one item from a collection of two
  ///    or more options
  const AdaptiveSwitch({
    super.key,
    super.builders,
    this.label,
    this.semanticLabel,
    this.foregroundColor,
    this.activeKnobColor,
    this.inactiveKnobColor,
    this.activeColor,
    this.inactiveColor,
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

  /// The label of the radio button.
  ///
  /// This, if non-null, is displayed at the right of the switcher,
  /// and is affected by user touch.
  ///
  /// Usually a [Text] or [Icon] widget
  final Widget? label;

  /// Background color of the switch when it is in the `on` state.
  final Color? activeColor;

  /// Color of the switch knob when it is in the `on` state.
  final Color? activeKnobColor;

  /// Background color of the switch when it is in the `off` state.
  final Color? inactiveColor;

  /// Color of the switch knob when it is in the `off` state.
  final Color? inactiveKnobColor;

  /// The color of the radio button's [label].
  final Color? foregroundColor;

  /// A semantic label providing accessibility information for the switch.
  final String? semanticLabel;

  bool get _enabled => onChanged != null;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    final defaultDecoration =
        BoxDecoration(borderRadius: BorderRadius.circular(100));

    return ToggleSwitch(
      checked: value,
      content: label,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      style: ToggleSwitchThemeData(
        foregroundColor: foregroundColor != null
            ? WidgetStateProperty.all(foregroundColor)
            : null,
        checkedDecoration: WidgetStateProperty.resolveWith(
          (states) {
            return defaultDecoration.copyWith(
              color: activeColor ??
                  ButtonThemeData.checkedInputColor(theme, states),
              border: Border.all(
                color: ButtonThemeData.checkedInputColor(theme, states),
              ),
            );
          },
        ),
        uncheckedDecoration: WidgetStateProperty.resolveWith(
          (states) {
            return defaultDecoration.copyWith(
              color: inactiveColor ??
                  WidgetStateExtension.forStates(
                    states,
                    disabled: theme.resources.controlAltFillColorDisabled,
                    pressed: theme.resources.controlAltFillColorQuarternary,
                    hovering: theme.resources.controlAltFillColorTertiary,
                    none: theme.resources.controlAltFillColorSecondary,
                  ),
              border: Border.all(
                color: inactiveColor ??
                    WidgetStateExtension.forStates(
                      states,
                      disabled: theme.resources.controlStrongFillColorDisabled,
                      none: theme.resources.controlStrongFillColorDefault,
                    ),
              ),
            );
          },
        ),
        checkedKnobDecoration: WidgetStateProperty.resolveWith(
          (states) {
            return defaultDecoration.copyWith(
              color: states.isDisabled
                  ? theme.resources.textOnAccentFillColorDisabled
                  : activeKnobColor ??
                      theme.resources.textOnAccentFillColorPrimary,
            );
          },
        ),
        uncheckedKnobDecoration: WidgetStateProperty.resolveWith(
          (states) {
            return defaultDecoration.copyWith(
              color: states.isDisabled
                  ? theme.resources.textFillColorDisabled
                  : inactiveKnobColor ?? theme.resources.textFillColorSecondary,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final theme = MacosTheme.of(context);

    final backgroundColorOnState =
        (activeColor ?? theme.primaryColor).toMacosColor();
    final backgroundColorOffState =
        (inactiveColor ?? CupertinoColors.quaternarySystemFill).toMacosColor();

    final knobColor = value
        ? activeKnobColor?.toMacosColor()
        : inactiveKnobColor?.toMacosColor();

    final buildLabel = label != null
        ? GestureDetector(
            onTap: () => onChanged?.call(!value),
            child: MacosIconTheme(
              data: theme.iconTheme.copyWith(
                color: foregroundColor,
              ),
              child: DefaultTextStyle(
                style: theme.typography.body.copyWith(
                  color: foregroundColor,
                  fontWeight: MacosFontWeight.w300,
                  fontSize: 14.0,
                ),
                child: label!,
              ),
            ),
          )
        : null;

    return MacosSwitch(
      value: value,
      onChanged: onChanged,
      size: ControlSize.small,
      semanticLabel: semanticLabel,
      activeColor: backgroundColorOnState,
      trackColor: backgroundColorOffState,
      knobColor: knobColor,
    ).margeWith(buildLabel, 8.0).applyDisabledEffect(!_enabled);
  }
}
