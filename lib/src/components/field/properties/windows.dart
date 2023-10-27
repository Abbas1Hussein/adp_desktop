import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/properties.dart';

class FieldWindowsProperty extends CoreWindowsProperty{
  /// Controls the [BoxDecoration] of the box behind the text input.
  ///
  /// Defaults to having a rounded rectangle grey border and can be null to have
  /// no box decoration.
  final BoxDecoration? decoration;

  /// The highlight color of the text box.
  ///
  /// If [foregroundDecoration] is provided, this must not be provided.
  ///
  /// See also:
  ///  * [unfocusedColor], displayed when the field is not focused
  final Color? highlightColor;

  /// The unfocused color of the highlight border.
  ///
  /// See also:
  ///   * [highlightColor], displayed when the field is focused
  final Color? unfocusedColor;

  /// Padding around the text entry area between the [prefix] and [suffix].
  ///
  /// Defaults to [kTextBoxPadding]
  final EdgeInsetsGeometry? padding;

  /// A lighter colored placeholder hint that appears on the first line of the
  /// text field when the text entry is empty.
  ///
  /// Defaults to having no placeholder text.
  ///
  /// The text style of the placeholder text matches that of the text field's
  /// main text entry except a lighter font weight and a grey font color.
  final String? placeholder;

  /// The style to use for the placeholder text.
  ///
  /// The [placeholderStyle] is merged with the [style] [TextStyle] when applied
  /// to the [placeholder] text. To avoid merging with [style], specify
  /// [TextStyle.inherit] as false.
  ///
  /// Defaults to the [style] property with w300 font weight and grey color.
  ///
  /// If specifically set to null, placeholder's style will be the same as [style].
  final TextStyle? placeholderStyle;

  /// An optional [Widget] to display before the text.
  final Widget? prefix;

  /// Controls the visibility of the [prefix] widget based on the state of
  /// text entry when the [prefix] argument is not null.
  ///
  /// Defaults to [OverlayVisibilityMode.always] and cannot be null.
  ///
  /// Has no effect when [prefix] is null.
  final OverlayVisibilityMode? prefixMode;

  /// Controls the visibility of the [suffix] widget based on the state of
  /// text entry when the [suffix] argument is not null.
  ///
  /// Defaults to [OverlayVisibilityMode.always] and cannot be null.
  ///
  /// Has no effect when [suffix] is null.
  final OverlayVisibilityMode? suffixMode;

  /// {@macro flutter.widgets.editableText.scribbleEnabled}
  final bool? scribbleEnabled;

  /// {@macro flutter.services.TextInputConfiguration.enableIMEPersonalizedLearning}
  final bool? enableIMEPersonalizedLearning;

  /// {@macro flutter.widgets.magnifier.TextMagnifierConfiguration.intro}
  ///
  /// {@macro flutter.widgets.magnifier.intro}
  ///
  /// {@macro flutter.widgets.magnifier.TextMagnifierConfiguration.details}
  ///
  /// By default, builds an [TextMagnifier.adaptiveMagnifierConfiguration].
  /// If it is desired to suppress the magnifier, consider passing
  /// [TextMagnifierConfiguration.disabled].
  ///
  /// {@tool dartpad}
  /// This sample demonstrates how to customize the magnifier that this text field uses.
  ///
  /// ** See code in examples/api/lib/widgets/text_magnifier/text_magnifier.0.dart **
  /// {@end-tool}
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// {@macro flutter.widgets.EditableText.spellCheckConfiguration}
  ///
  /// If [SpellCheckConfiguration.misspelledTextStyle] is not specified in this
  /// configuration, then [fluentMisspelledTextStyle] is used by default.
  final SpellCheckConfiguration? spellCheckConfiguration;

  const  FieldWindowsProperty({
    this.decoration,
    this.highlightColor,
    this.unfocusedColor,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.suffixMode,
    this.scribbleEnabled,
    this.enableIMEPersonalizedLearning,
    this.magnifierConfiguration,
    this.spellCheckConfiguration,
  });
}

