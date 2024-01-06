import 'dart:ui' as ui;

import 'package:fluent_ui/fluent_ui.dart';

import '../base_text_field.dart';
import 'platforms/platforms.dart';

/// A custom text field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text field  with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTextField] is utilized.
/// - On Windows, [TextBox] is used.
final class AdaptiveTextField extends BaseTextField {
  /// Creates a adaptive text field.
  ///
  /// To provide a prefilled text entry, pass in a [TextEditingController] with
  /// an initial value to the [controller] parameter.
  ///
  /// To provide a hint placeholder text that appears when the text entry is
  /// empty, pass a [String] to the [placeholder] parameter.
  ///
  /// The [maxLines] property can be set to null to remove the restriction on
  /// the number of lines. In this mode, the intrinsic height of the widget will
  /// grow as the number of lines of text grows. By default, it is `1`, meaning
  /// this is a single-line text field and will scroll horizontally when
  /// it overflows. [maxLines] must not be zero.
  ///
  /// The text cursor is not shown if [showCursor] is false or if [showCursor]
  /// is null (the default) and [readOnly] is true.
  ///
  /// If specified, the [maxLength] property must be greater than zero.
  ///
  /// The [selectionHeightStyle] and [selectionWidthStyle] properties allow
  /// changing the shape of the selection highlighting. These properties default
  /// to [ui.BoxHeightStyle.tight] and [ui.BoxWidthStyle.tight] respectively and
  /// must not be null.
  ///
  /// The [autocorrect], [autofocus], [dragStartBehavior],
  /// [expands], [obscureText], [prefixMode], [readOnly], [scrollPadding],
  /// [suffixMode], [textAlign], [selectionHeightStyle], [selectionWidthStyle],
  /// [enableSuggestions].
  ///
  /// {@macro flutter.widgets.editableText.accessibility}
  ///
  /// See also:
  ///
  ///  * [minLines], which is the minimum number of lines to occupy when the
  ///    content spans fewer lines.
  ///  * [expands], to allow the widget to size itself to its parent's height.
  ///  * [maxLength], which discusses the precise meaning of "number of
  ///    characters" and how it may differ from the intuitive meaning.
  ///
  /// See also:
  ///
  ///   * [AdaptiveTextFormField]
  ///   * [AdaptiveTextSearchField].
  const AdaptiveTextField({
    super.key,
    super.builders,
    super.autocorrect,
    super.autofillHints,
    super.autofocus,
    super.controller,
    super.contextMenuBuilder,
    super.cursorColor,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorWidth,
    super.decoration,
    super.dragStartBehavior,
    super.enableInteractiveSelection,
    super.enableSuggestions,
    super.enabled,
    super.expands = false,
    super.focusNode,
    super.inputFormatters,
    super.keyboardAppearance,
    super.keyboardType,
    super.maxLength,
    super.maxLengthEnforcement,
    super.maxLines = 1,
    super.minLines,
    super.obscureText = false,
    super.obscuringCharacter,
    super.onChanged,
    super.onEditingComplete,
    super.onSubmitted,
    super.onTap,
    super.onTapOutside,
    super.padding,
    super.placeholder,
    super.placeholderStyle,
    super.prefix,
    super.prefixMode,
    super.readOnly,
    super.restorationId,
    super.scrollController,
    super.scrollPadding,
    super.scrollPhysics,
    super.selectionControls,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.showCursor,
    super.smartDashesType,
    super.smartQuotesType,
    super.strutStyle,
    super.style,
    super.suffix,
    super.suffixMode,
    super.textAlign,
    super.textAlignVertical,
    super.textCapitalization,
    super.textInputAction,

  });

  @override
  Widget macos(BuildContext context) {
    return TextFieldMacos(adpProperties: fieldProperties);
  }

  @override
  Widget windows(BuildContext context) {
    return TextFieldWindows(adpProperties: fieldProperties);
  }
}
