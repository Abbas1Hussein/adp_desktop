import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/properties.dart';

class SwitchWindows extends StatelessWidget {
  final SwitchWindowsProperty? property;

  /// Whether this toggle switch is checked
  final bool checked;

  /// Called when the value of the switch should change.
  ///
  /// This callback updates a new value, but doesn't update its state internally.
  ///
  /// If this callback is null, the switch is considered disabled.
  final ValueChanged<bool>? onChanged;

  /// The content of the radio button.
  ///
  /// This, if non-null, is displayed at the right of the switcher,
  /// and is affected by user touch.
  ///
  /// Usually a [Text] or [Icon] widget
  final Widget? content;

  const SwitchWindows({
    super.key,
    required this.checked,
    this.onChanged,
    this.content,
    this.property,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      checked: checked,
      content: content,
      onChanged: onChanged,
      knob: property?.knob,
      style: property?.style,
      focusNode: property?.focusNode,
      knobBuilder: property?.knobBuilder,
      semanticLabel: property?.semanticLabel,
      autofocus: property?.autofocus ?? false,
      leadingContent: property?.leadingContent ?? false,
    );
  }
}

class SwitchWindowsProperty extends CoreWindowsProperty {
  /// The knob of the switch
  ///
  /// [DefaultToggleSwitchKnob] is used by default
  ///
  /// See also:
  ///
  ///   * [knobBuilder], which builds the knob based on the current state
  ///   * [DefaultToggleSwitchKnob], used when both [knob] and [knobBuilder] are null
  final Widget? knob;

  /// Build the knob of the switch based on the current state
  ///
  /// See also:
  ///   * [knob], a static knob
  ///   * [DefaultToggleSwitchKnob], used when both [knob] and [knobBuilder] are null
  final ToggleSwitchKnobBuilder? knobBuilder;

  /// The style of the toggle switch
  final ToggleSwitchThemeData? style;

  /// Whether to position [content] before the switch, if provided
  ///
  /// Defaults to `false`
  final bool? leadingContent;

  /// {@macro fluent_ui.controls.inputs.HoverButton.semanticLabel}
  final String? semanticLabel;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

 const SwitchWindowsProperty({
    this.knob,
    this.knobBuilder,
    this.style,
    this.leadingContent,
    this.semanticLabel,
    this.focusNode,
    this.autofocus,
  });
}
