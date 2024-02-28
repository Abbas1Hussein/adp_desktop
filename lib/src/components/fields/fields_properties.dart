import 'dart:ui';

import 'package:adp_desktop/src/components/fields/base_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'overlay_visibility/overlay_visibility.dart';

abstract class _BaseFieldProperties {
  const _BaseFieldProperties({
    this.focusNode,
    this.contextMenuBuilder,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.suffix,
    this.suffixMode,
    this.keyboardType,
    this.readOnly,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.minLines,
    this.expands,
    this.maxLengthEnforcement,
    this.onEditingComplete,
    this.onTapOutside,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.obscuringCharacter,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionControls,
    this.onTap,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.restorationId,
    this.keyboardAppearance,
    this.dragStartBehavior,
    this.textInputAction,
    this.decoration,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.padding,
    this.showCursor,
  });

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Context menu builder for editable text.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Controls how tall the selection highlight boxes are computed to be.
  final BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final BoxWidthStyle? selectionWidthStyle;

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
  final int? maxLines;

  /// A controller for manipulating the text field's content.
  final TextEditingController? controller;

  /// Callback function for text changes.
  final ValueChanged<String>? onChanged;

  /// Callback function for submitting the text.
  final ValueChanged<String>? onSubmitted;

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
  final bool? expands;

  /// Determines how the maxLength limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Callback for editing completion.
  final VoidCallback? onEditingComplete;

  /// Callback for taps outside the text field.
  final TapRegionCallback? onTapOutside;

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

  /// Callback for each distinct tap except for every second tap of a double tap.
  final GestureTapCallback? onTap;

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
}

class AdaptiveFieldProperties extends _BaseFieldProperties {
  const AdaptiveFieldProperties({
    super.decoration,
    super.padding,
    super.placeholder,
    super.placeholderStyle,
    super.focusNode,
    super.contextMenuBuilder,
    super.prefix,
    super.prefixMode,
    super.suffix,
    super.suffixMode,
    super.keyboardType,
    super.readOnly,
    super.maxLength,
    super.maxLines,
    super.controller,
    super.onChanged,
    super.onSubmitted,
    super.autocorrect,
    super.cursorColor,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorWidth,
    super.enabled,
    super.enableSuggestions,
    super.expands,
    super.inputFormatters,
    super.maxLengthEnforcement,
    super.minLines,
    super.obscureText,
    super.onEditingComplete,
    super.onTapOutside,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.smartDashesType,
    super.smartQuotesType,
    super.autofillHints,
    super.autofocus,
    super.dragStartBehavior,
    super.enableInteractiveSelection,
    super.keyboardAppearance,
    super.obscuringCharacter,
    super.onTap,
    super.restorationId,
    super.scrollController,
    super.scrollPadding,
    super.scrollPhysics,
    super.selectionControls,
    super.showCursor,
    super.strutStyle,
    super.style,
    super.textAlign,
    super.textAlignVertical,
    super.textCapitalization,
    super.textInputAction,
  });

  factory AdaptiveFieldProperties.fromBaseTextField(
    BaseTextField baseTextField,
  ) {
    return AdaptiveFieldProperties(
      // Behavior
      readOnly: baseTextField.readOnly,
      autofocus: baseTextField.autofocus,
      enableSuggestions: baseTextField.enableSuggestions,
      enableInteractiveSelection: baseTextField.enableInteractiveSelection,

      // Callbacks
      onTap: baseTextField.onTap,
      onChanged: baseTextField.onChanged,
      onSubmitted: baseTextField.onSubmitted,
      onTapOutside: baseTextField.onTapOutside,
      onEditingComplete: baseTextField.onEditingComplete,

      // Limits
      maxLines: baseTextField.maxLines,
      minLines: baseTextField.minLines,
      maxLength: baseTextField.maxLength,
      maxLengthEnforcement: baseTextField.maxLengthEnforcement,

      // Appearance
      style: baseTextField.style,
      textAlign: baseTextField.textAlign,
      strutStyle: baseTextField.strutStyle,
      decoration: baseTextField.decoration,
      placeholder: baseTextField.placeholder,
      placeholderStyle: baseTextField.placeholderStyle,
      textAlignVertical: baseTextField.textAlignVertical,

      // Content
      controller: baseTextField.controller,
      keyboardType: baseTextField.keyboardType,
      inputFormatters: baseTextField.inputFormatters,
      obscuringCharacter: baseTextField.obscuringCharacter,
      textCapitalization: baseTextField.textCapitalization,

      // Focus and Navigation
      focusNode: baseTextField.focusNode,
      textInputAction: baseTextField.textInputAction,

      // Other
      enabled: baseTextField.enabled,
      expands: baseTextField.expands,
      padding: baseTextField.padding,
      suffixMode: baseTextField.suffixMode,
      prefixMode: baseTextField.prefixMode,
      restorationId: baseTextField.restorationId,
      dragStartBehavior: baseTextField.dragStartBehavior,

      // Widget
      prefix: baseTextField.prefix,
      suffix: baseTextField.suffix,
      contextMenuBuilder: baseTextField.contextMenuBuilder,

      // Platform-specific
      keyboardAppearance: baseTextField.keyboardAppearance,

      // Scroll
      scrollPadding: baseTextField.scrollPadding,
      scrollPhysics: baseTextField.scrollPhysics,
      scrollController: baseTextField.scrollController,

      // Selection
      showCursor: baseTextField.showCursor,
      selectionControls: baseTextField.selectionControls,
      selectionWidthStyle: baseTextField.selectionWidthStyle,
      selectionHeightStyle: baseTextField.selectionHeightStyle,

      // Visuals
      cursorColor: baseTextField.cursorColor,
      cursorWidth: baseTextField.cursorWidth,
      cursorHeight: baseTextField.cursorHeight,
      cursorRadius: baseTextField.cursorRadius,

      // Text Input
      autocorrect: baseTextField.autocorrect,
      obscureText: baseTextField.obscureText,
      autofillHints: baseTextField.autofillHints,
      smartDashesType: baseTextField.smartDashesType,
      smartQuotesType: baseTextField.smartQuotesType,
    );
  }
}

class AdaptiveFormFieldProperties extends _BaseFieldProperties {
  const AdaptiveFormFieldProperties({
    super.focusNode,
    super.contextMenuBuilder,
    super.suffix,
    super.decoration,
    super.padding,
    super.placeholder,
    super.placeholderStyle,
    super.prefix,
    super.prefixMode,
    super.suffixMode,
    super.keyboardType,
    super.readOnly,
    super.maxLength,
    super.maxLines,
    super.controller,
    super.onChanged,
    super.autocorrect,
    super.cursorColor,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorWidth,
    super.enabled,
    super.enableSuggestions,
    super.expands,
    super.inputFormatters,
    super.maxLengthEnforcement,
    super.minLines,
    super.obscureText,
    super.onEditingComplete,
    super.onTapOutside,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.smartDashesType,
    super.smartQuotesType,
    super.autofillHints,
    super.autofocus,
    super.dragStartBehavior,
    super.enableInteractiveSelection,
    super.keyboardAppearance,
    super.obscuringCharacter,
    super.onTap,
    super.restorationId,
    super.scrollController,
    super.scrollPadding,
    super.scrollPhysics,
    super.selectionControls,
    super.showCursor,
    super.strutStyle,
    super.style,
    super.textAlign,
    super.textAlignVertical,
    super.textCapitalization,
    super.textInputAction,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.errorHighlightColor,
  });

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

  factory AdaptiveFormFieldProperties.fromBaseTextField(
    BaseTextField baseTextField,
  ) {
    return AdaptiveFormFieldProperties(
      // Behavior
      readOnly: baseTextField.readOnly,
      autofocus: baseTextField.autofocus,
      enableSuggestions: baseTextField.enableSuggestions,
      enableInteractiveSelection: baseTextField.enableInteractiveSelection,

      // Callbacks
      onTap: baseTextField.onTap,
      onSaved: baseTextField.onSaved,
      onChanged: baseTextField.onChanged,
      validator: baseTextField.validator,
      onTapOutside: baseTextField.onTapOutside,
      onFieldSubmitted: baseTextField.onFieldSubmitted,
      onEditingComplete: baseTextField.onEditingComplete,

      // Limits
      maxLines: baseTextField.maxLines,
      minLines: baseTextField.minLines,
      maxLength: baseTextField.maxLength,
      maxLengthEnforcement: baseTextField.maxLengthEnforcement,

      // Appearance
      style: baseTextField.style,
      textAlign: baseTextField.textAlign,
      strutStyle: baseTextField.strutStyle,
      decoration: baseTextField.decoration,
      initialValue: baseTextField.initialValue,
      placeholder: baseTextField.placeholder,
      placeholderStyle: baseTextField.placeholderStyle,
      textAlignVertical: baseTextField.textAlignVertical,
      errorHighlightColor: baseTextField.errorHighlightColor,

      // Content
      controller: baseTextField.controller,
      keyboardType: baseTextField.keyboardType,
      inputFormatters: baseTextField.inputFormatters,
      obscuringCharacter: baseTextField.obscuringCharacter,
      textCapitalization: baseTextField.textCapitalization,

      // Focus and Navigation
      focusNode: baseTextField.focusNode,
      textInputAction: baseTextField.textInputAction,

      // Other
      enabled: baseTextField.enabled,
      expands: baseTextField.expands,
      padding: baseTextField.padding,
      suffixMode: baseTextField.suffixMode,
      prefixMode: baseTextField.prefixMode,
      restorationId: baseTextField.restorationId,
      dragStartBehavior: baseTextField.dragStartBehavior,
      autovalidateMode: baseTextField.autovalidateMode,

      // Widget
      prefix: baseTextField.prefix,
      suffix: baseTextField.suffix,
      contextMenuBuilder: baseTextField.contextMenuBuilder,

      // Platform-specific
      keyboardAppearance: baseTextField.keyboardAppearance,

      // Scroll
      scrollPadding: baseTextField.scrollPadding,
      scrollPhysics: baseTextField.scrollPhysics,
      scrollController: baseTextField.scrollController,

      // Selection
      showCursor: baseTextField.showCursor,
      selectionControls: baseTextField.selectionControls,
      selectionWidthStyle: baseTextField.selectionWidthStyle,
      selectionHeightStyle: baseTextField.selectionHeightStyle,

      // Visuals
      cursorColor: baseTextField.cursorColor,
      cursorWidth: baseTextField.cursorWidth,
      cursorHeight: baseTextField.cursorHeight,
      cursorRadius: baseTextField.cursorRadius,

      // Text Input
      autocorrect: baseTextField.autocorrect,
      obscureText: baseTextField.obscureText,
      autofillHints: baseTextField.autofillHints,
      smartDashesType: baseTextField.smartDashesType,
      smartQuotesType: baseTextField.smartQuotesType,
    );
  }
}
