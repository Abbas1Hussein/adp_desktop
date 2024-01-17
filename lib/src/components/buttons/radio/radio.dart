import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';

/// Radio buttons, also called option buttons, let users select one option from
/// a collection of two or more mutually exclusive, but related, options. Radio
/// buttons are always used in groups, and each option is represented by one
/// radio button in the group.
///
/// In the default state, no radio button in a RadioButtons group is selected.
/// That is, all radio buttons are cleared. However, once a user has selected a
/// radio button, the user can't deselect the button to restore the group to its
/// initial cleared state.
///
/// The singular behavior of a RadioButtons group distinguishes it from check
/// boxes, which support multi-selection and deselection, or clearing.
///
/// Use this widget to create radio buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosRadioButton] is utilized.
/// - On Windows, [RadioButton] is used.
class AdaptiveRadio<T> extends CoreAdaptiveComponent {
  /// Creates a adp radio button.
  ///
  /// See also:
  ///
  ///   * [AdaptiveSlider], which let the user lie within a range of values,
  ///     (for example, 10, 20, 30, ... 100).
  ///   * [AdaptiveCheckbox], which let the user select multiple options.
  ///   * [AdaptivePopup], which let the user select multiple options from a popup
  const AdaptiveRadio({
    super.key,
    super.builders,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.foregroundColor,
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

  /// The widget that be displayed alongside the radio button.
  final Widget? label;

  /// The active color for the radio button.
  final Color? activeColor;

  /// The color to inactiveColor when the radio button is inactive or disabled.
  final Color? inactiveColor;

  /// The color of the radio button's [label].
  final Color? foregroundColor;

  /// A brief description of the radio button for accessibility.
  final String? semanticLabel;

  bool get _selected => value == groupValue;

  bool get _enabled => onChanged != null;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);
    return RadioButton(
      content: label,
      checked: _selected,
      semanticLabel: semanticLabel,
      style: RadioButtonThemeData(
        foregroundColor:
            foregroundColor != null ? ButtonState.all(foregroundColor) : null,
        checkedDecoration: activeColor != null
            ? ButtonState.resolveWith((states) {
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
                  color: activeColor ??
                      theme.resources.textOnAccentFillColorPrimary,
                );
              })
            : null,
        uncheckedDecoration: inactiveColor != null
            ? ButtonState.resolveWith((states) {
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
                      pressed:
                          theme.accentColor.defaultBrushFor(theme.brightness),
                      none: inactiveColor ??
                          theme.resources.textFillColorTertiary,
                    ),
                  ),
                  shape: BoxShape.circle,
                );
              })
            : null,
      ),
      onChanged: _enabled ? (_) => onChanged!(value) : null,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final theme = MacosTheme.of(context);

    final buildLabel = label != null
        ? GestureDetector(
            onTap: () => onChanged?.call(value),
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

    return MacosIconButton(
      pressedOpacity: 0.95,
      padding: EdgeInsets.zero,
      mouseCursor: SystemMouseCursors.click,
      boxConstraints: const BoxConstraints.tightFor(height: 20.0, width: 20.0),
      onPressed: () =>  onChanged?.call(value),
      icon: MacosRadioButton<T>(
        size: 20.0,
        value: value,
        groupValue: groupValue,
        onColor: activeColor,
        offColor: inactiveColor ?? CupertinoColors.tertiaryLabel,
        semanticLabel: semanticLabel,
        onChanged: (value) => onChanged?.call(value as T),
      ),
    ).margeWith(buildLabel, 6.0).applyDisabledEffect(!_enabled);
  }
}
