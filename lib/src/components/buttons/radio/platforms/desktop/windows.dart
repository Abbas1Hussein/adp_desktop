import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/properties.dart';

class RadioWindows extends StatelessWidget {
  final RadioWindowsProperty? property;

  /// Whether this radio button is checked.
  final bool checked;

  /// Called when the value of the radio button should change.
  ///
  /// The radio button passes the new value to the callback but does
  /// not actually change state until the parent widget rebuilds the
  /// radio button with the new value.
  ///
  /// If this callback is null, the radio button will be displayed as
  /// disabled and will not respond to input gestures.
  final ValueChanged<bool>? onChanged;

  /// The content of the radio button.
  ///
  /// This, if non-null, is displayed at the right of the radio button,
  /// and is affected by user touch.
  ///
  /// Usually a [Text] or [Icon] widget
  final Widget? content;

  const RadioWindows({
    super.key,
    this.property,
    this.onChanged,
    this.content,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    return RadioButton(
      checked: checked,
      content: content,
      onChanged: onChanged,
      style: property?.style,
      focusNode: property?.focusNode,
      semanticLabel: property?.semanticLabel,
      autofocus: property?.autofocus ?? false,
    );
  }
}

class RadioWindowsProperty extends CoreWindowsProperty {
  /// The style of the radio button.
  ///
  /// If non-null, this is merged with the closest [RadioButtonTheme].
  /// If null, the closest [RadioButtonTheme] is used.
  final RadioButtonThemeData? style;

  /// {@macro fluent_ui.controls.inputs.HoverButton.semanticLabel}
  final String? semanticLabel;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  RadioWindowsProperty({
    this.style,
    this.semanticLabel,
    this.focusNode,
    this.autofocus,
  });
}
