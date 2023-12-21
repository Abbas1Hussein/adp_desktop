import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../../core/common/construct/component.dart';
import '../adaptive_field_properties.dart';
import '../overlay_visibility/overlay_visibility.dart';
import 'platforms/platforms.dart';

/// A custom text field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text field  with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTextField] is utilized.
/// - On Windows, [TextBox] is used.
class AdaptiveTextField extends CoreAdaptiveComponent {
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
  ///   * [AdaptiveTextFormField], which is the adp text field with the [Form] integration.
  const AdaptiveTextField({
    super.key,
    super.builders,
    this.autocorrect,
    this.autofillHints,
    this.autofocus,
    this.controller,
    this.contextMenuBuilder,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth,
    this.decoration,
    this.dragStartBehavior,
    this.enableInteractiveSelection,
    this.enableSuggestions,
    this.enabled,
    this.expands = false,
    this.focusNode,
    this.inputFormatters,
    this.keyboardAppearance,
    this.keyboardType,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.obscuringCharacter,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.readOnly,
    this.restorationId,
    this.scrollController,
    this.scrollPadding,
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.strutStyle,
    this.style,
    this.suffix,
    this.suffixMode,
    this.textAlign,
    this.textAlignVertical,
    this.textCapitalization,
    this.textInputAction,
  })  : assert(obscuringCharacter == null || obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          expands != null && !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(
          obscureText != null && !obscureText || maxLines == 1,
          'Obscured fields cannot be multiline.',
        ),
        assert(maxLength == null || maxLength > 0),
        // Assert the following instead of setting it directly to avoid surprising the user by silently changing the value they set.
        assert(
          !identical(textInputAction, TextInputAction.newline) ||
              maxLines == 1 ||
              !identical(keyboardType, TextInputType.text),
          'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline AdaptiveTextField.',
        );

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Context menu builder for editable text.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Controls how tall the selection highlight boxes are computed to be.
  final ui.BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final ui.BoxWidthStyle? selectionWidthStyle;

  /// Controls the [BoxDecoration] of the text field behind the text input.
  final BoxDecoration? decoration;

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
  /// Defaults to [FieldOverlayVisibilityMode.always] and cannot be null.
  ///
  /// Has no effect when [prefix] is null.
  final FieldOverlayVisibilityMode? prefixMode;

  /// An optional widget to display after the input field.
  final Widget? suffix;

  /// Controls the visibility of the [suffix] widget based on the state of
  /// text entry when the [suffix] argument is not null.
  ///
  /// Defaults to [FieldOverlayVisibilityMode.always] and cannot be null.
  ///
  /// Has no effect when [suffix] is null.
  final FieldOverlayVisibilityMode? suffixMode;

  /// Padding around the text entry area between the [prefix] and [suffix].
  final EdgeInsets? padding;

  /// The type of keyboard to display for text input.
  final TextInputType? keyboardType;

  /// Indicates whether the text field is read-only.
  final bool? readOnly;

  /// The maximum number of characters the text field can contain.
  final int? maxLength;

  /// The maximum number of lines for a multi-line text field.
  ///
  /// Defaults to 1px.
  final int? maxLines;

  /// A controller for manipulating the text field's content.
  final TextEditingController? controller;

  /// Callback for each distinct tap except for every second tap of a double tap.
  final GestureTapCallback? onTap;

  /// Callback for taps outside the text field.
  final TapRegionCallback? onTapOutside;

  /// Callback function for text changes.
  final ValueChanged<String>? onChanged;

  /// Callback function for submitting the text.
  final ValueChanged<String>? onSubmitted;

  /// Callback for editing completion.
  final VoidCallback? onEditingComplete;

  /// Indicates whether the text should be obscured.
  final bool? obscureText;

  /// Indicates whether autocorrect is enabled.
  final bool? autocorrect;

  /// Smart dashes type for text input.
  final SmartDashesType? smartDashesType;

  /// Smart quotes type for text input.
  final SmartQuotesType? smartQuotesType;

  /// Enable suggestions for text input.
  final bool? enableSuggestions;

  /// Minimum number of lines for a multi-line text field.
  final int? minLines;

  /// Determines whether the field should fill the height of its parent.
  ///
  /// If true, minLines and maxLines will ignore,
  final bool? expands;

  /// Determines how the maxLength limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Text capitalization style.
  final TextCapitalization? textCapitalization;

  /// Style to use for the text being edited.
  final TextStyle? style;

  /// Strut style for the text.
  final StrutStyle? strutStyle;

  /// Text alignment within the text field.
  final TextAlign? textAlign;

  /// Vertical text alignment within the text field.
  final TextAlignVertical? textAlignVertical;

  /// Autofocus on the text field.
  final bool? autofocus;

  /// Character to use for obscuring the text.
  final String? obscuringCharacter;

  /// Input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Enable or disable the text field.
  final bool? enabled;

  /// Width of the cursor.
  final double? cursorWidth;

  /// Height of the cursor.
  final double? cursorHeight;

  /// Radius of the cursor.
  final Radius? cursorRadius;

  /// Color of the cursor.
  final Color? cursorColor;

  /// Text selection controls.
  final TextSelectionControls? selectionControls;

  /// Scroll physics for the text field.
  final ScrollPhysics? scrollPhysics;

  /// Scroll controller for the text field.
  final ScrollController? scrollController;

  /// Autofill hints for the text field.
  final Iterable<String>? autofillHints;

  /// Scroll padding for the text field.
  final EdgeInsets? scrollPadding;

  /// Enable or disable interactive selection.
  final bool? enableInteractiveSelection;

  /// Restoration ID for saving and restoring the state of the text field.
  final String? restorationId;

  /// Appearance of the keyboard.
  final Brightness? keyboardAppearance;

  /// Drag start behavior for the text field.
  final DragStartBehavior? dragStartBehavior;

  /// Action button type for the keyboard.
  final TextInputAction? textInputAction;

  /// Show or hide the cursor.
  final bool? showCursor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: super.build(context),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return TextFieldMacos(adpProperties: fieldProperties);
  }

  @override
  Widget windows(BuildContext context) {
    return TextFieldWindows(adpProperties: fieldProperties);
  }
}

extension _AdaptiveTextFieldEx on AdaptiveTextField {
  AdaptiveFieldProperties get fieldProperties {
    return AdaptiveFieldProperties(
      // Behavior
      readOnly: readOnly,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      enableInteractiveSelection: enableInteractiveSelection,

      // Callbacks
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTapOutside: onTapOutside,
      onEditingComplete: onEditingComplete,

      // Limits
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,

      // Appearance
      style: style,
      textAlign: textAlign,
      strutStyle: strutStyle,
      decoration: decoration,
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,
      textAlignVertical: textAlignVertical,

      // Content
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscuringCharacter: obscuringCharacter,
      textCapitalization: textCapitalization,

      // Focus and Navigation
      focusNode: focusNode,
      textInputAction: textInputAction,

      // Other
      enabled: enabled,
      expands: expands,
      padding: padding,
      suffixMode: suffixMode,
      prefixMode: prefixMode,
      restorationId: restorationId,
      dragStartBehavior: dragStartBehavior,

      // Widget
      prefix: prefix,
      suffix: suffix,
      contextMenuBuilder: contextMenuBuilder,

      // Platform-specific
      keyboardAppearance: keyboardAppearance,

      // Scroll
      scrollPadding: scrollPadding,
      scrollPhysics: scrollPhysics,
      scrollController: scrollController,

      // Selection
      showCursor: showCursor,
      selectionControls: selectionControls,
      selectionWidthStyle: selectionWidthStyle,
      selectionHeightStyle: selectionHeightStyle,

      // Visuals
      cursorColor: cursorColor,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,

      // Text Input
      autocorrect: autocorrect,
      obscureText: obscureText,
      autofillHints: autofillHints,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
    );
  }
}
