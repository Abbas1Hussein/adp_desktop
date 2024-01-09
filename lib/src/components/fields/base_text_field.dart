import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../core/common/construct/component.dart';
import 'fields_properties.dart';
import 'overlay_visibility/overlay_visibility.dart';

abstract class BaseTextField extends CoreAdaptiveComponent {
  const BaseTextField({
    super.key,
    super.builders,
    this.focusNode,
    this.contextMenuBuilder,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.decoration,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.padding,
    this.keyboardType,
    this.readOnly,
    this.maxLength,
    this.maxLines= 1,
    this.controller,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.obscureText = false,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.minLines,
    this.expands = false,
    this.maxLengthEnforcement,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus = false,
    this.obscuringCharacter,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionControls,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.restorationId,
    this.keyboardAppearance,
    this.dragStartBehavior,
    this.textInputAction,
    this.showCursor,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.errorHighlightColor,
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
  final bool autofocus;

  /// Character to use for obscuring the text.
  final String? obscuringCharacter;

  /// Input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Enable or disable the text field.
  final bool enabled;

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

  /// An optional value to initialize the form field to, or null otherwise.
  final String? initialValue;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// Callback function that is called when the user submits the text field's value.
  ///
  /// The [onFieldSubmitted] function is triggered when the user presses the
  /// "submit" or "done" button on the keyboard after entering text into the
  /// text field. It receives the current text value of the field as a [String]
  /// parameter.
  ///
  /// Example usage:
  /// ```dart
  /// TextField(
  ///   onFieldSubmitted: (value) {
  ///     // Handle the submitted value here
  ///     print("Submitted: $value");
  ///   },
  /// )
  /// ```
  final ValueChanged<String>? onFieldSubmitted;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  ///
  /// The returned value is exposed by the [FormFieldState.errorText] property.
  /// The [TextFormField] uses this to override the [InputDecoration.errorText]
  /// value.
  ///
  /// Alternating between error and normal state can cause the height of the
  /// [TextFormField] to change if no other subtext decoration is set on the
  /// field. To create a field whose height is fixed regardless of whether or
  /// not an error is displayed, either wrap the  [TextFormField] in a fixed
  /// height parent like [SizedBox], or set the [InputDecoration.helperText]
  /// parameter to a space.
  final FormFieldValidator<String>? validator;

  /// Used to enable/disable this form field auto validation and update its
  /// error text.
  ///
  /// {@template flutter.widgets.FormField.autovalidateMode}
  /// If [AutovalidateMode.onUserInteraction], this FormField will only
  /// auto-validate after its content changes. If [AutovalidateMode.always], it
  /// will auto-validate even without user interaction. If
  /// [AutovalidateMode.disabled], auto-validation will be disabled.
  ///
  /// Defaults to [AutovalidateMode.disabled], cannot be null.
  /// {@endtemplate}
  final AutovalidateMode? autovalidateMode;

  /// The color used to highlight the field when an error is present.
  ///
  /// If the [errorHighlightColor] is specified, it is used to indicate an error
  /// in the field. When an error occurs, the input field is highlighted with
  /// this color to draw attention to the issue.
  ///
  /// If [errorHighlightColor] is null, the default error highlighting behavior
  /// of the underlying platform's text field implementation is used.
  final Color? errorHighlightColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: super.build(context),
    );
  }
}

extension AdaptiveTextFieldEx on BaseTextField {
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

  AdaptiveFormFieldProperties get formFieldProperties {
    return AdaptiveFormFieldProperties(
      // Behavior
      readOnly: readOnly,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      enableInteractiveSelection: enableInteractiveSelection,

      // Callbacks
      onTap: onTap,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
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
      initialValue: initialValue,
      placeholderStyle: placeholderStyle,
      textAlignVertical: textAlignVertical,
      errorHighlightColor: errorHighlightColor,

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
      autovalidateMode: autovalidateMode,
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
