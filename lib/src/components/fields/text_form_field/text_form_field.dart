import 'package:flutter/widgets.dart';

import '../adaptive_field_properties.dart';
import '../text_field/text_field.dart';
import 'platforms/platforms.dart';

/// A custom text form field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text form field with platform-specific
/// styling and behavior:
/// - On Windows, [TextFormBox] is used.
class AdaptiveTextFormField extends AdaptiveTextField {
  /// This widget extends [AdaptiveTextField] and includes additional properties
  /// and callbacks specific to form fields.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// Form(
  ///   key: key,
  ///   child: Column(
  ///     mainAxisAlignment: MainAxisAlignment.center,
  ///     children: [
  ///       AdaptiveTextFormField(
  ///         placeholder: 'Enter a username',
  ///         validator: (value) {
  ///           if (value == null || value.isEmpty) {
  ///             return 'Please enter a username';
  ///           }
  ///           return null;
  ///         },
  ///       ),
  ///       const SizedBox(height: 8.0),
  ///       AdaptiveTextFormField(
  ///         placeholder: 'Enter your password',
  ///         obscureText: true,
  ///         validator: (value) {
  ///           if (value == null || value.isEmpty) {
  ///             return 'Please enter a password';
  ///           }
  ///           return null;
  ///         },
  ///       ),
  ///       const SizedBox(height: 8.0),
  ///       AdaptiveFlatButton(
  ///         onPressed: () {
  ///           if (key.currentState?.validate() ?? false) {
  ///             // Validation successful, proceed with login logic
  ///             print('Login successful!');
  ///           } else {
  ///             // Validation failed, show an error message or perform error handling
  ///             print('Login failed. Please check your credentials.');
  ///           }
  ///         },
  ///         child: const Text('Login - Adp'),
  ///       ),
  ///     ],
  ///   ),
  /// ),
  /// ```
  const AdaptiveTextFormField({
    super.key,
    super.builders,
    super.autocorrect,
    super.autofillHints,
    super.autofocus,
    super.contextMenuBuilder,
    super.controller,
    super.cursorColor,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorWidth,
    super.decoration,
    super.dragStartBehavior,
    super.enabled,
    super.enableInteractiveSelection,
    super.enableSuggestions,
    super.expands,
    super.focusNode,
    super.inputFormatters,
    super.keyboardAppearance,
    super.keyboardType,
    super.maxLength,
    super.maxLengthEnforcement,
    super.maxLines,
    super.minLines,
    super.obscureText,
    super.obscuringCharacter,
    super.onChanged,
    super.onEditingComplete,
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
  /// in the field. When an error occurs.
  ///
  /// If [errorHighlightColor] is null, the default error highlighting behavior
  /// of the underlying platform's text field implementation is used.
  final Color? errorHighlightColor;

  @override
  Widget macos(BuildContext context) {
    return TextFormFieldMacos(adpProperties: formFieldProperties);
  }

  @override
  Widget windows(BuildContext context) {
    return TextFormFieldWindows(adpProperties: formFieldProperties);
  }
}

extension _AdaptiveTextFormFieldEx on AdaptiveTextFormField {
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
