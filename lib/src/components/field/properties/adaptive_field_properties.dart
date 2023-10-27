import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseFieldProperties {
  const BaseFieldProperties({
    this.focusNode,
    this.contextMenuBuilder,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.prefixText,
    this.suffix,
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
    this.textDirection,
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
    this.clipBehavior,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.restorationId,
    this.keyboardAppearance,
    this.dragStartBehavior,
    this.textInputAction,
    this.showCursor,
  });

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.EditableText.contextMenuBuilder}
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Controls how tall the selection highlight boxes are computed to be.
  final BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final BoxWidthStyle? selectionWidthStyle;

  /// The text to display before the input field.
  final String? prefixText;

  /// An optional widget to display after the input field.
  final Widget? suffix;

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

  /// A callback function that is called when the text in the field changes.
  final ValueChanged<String>? onChanged;

  /// A callback function that is called when the user submits the text.
  final ValueChanged<String>? onSubmitted;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool? obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool? autocorrect;

  /// {@macro flutter.services.TextInputConfiguration.smartDashesType}
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.services.TextInputConfiguration.smartQuotesType}
  final SmartQuotesType? smartQuotesType;

  /// {@macro flutter.services.TextInputConfiguration.enableSuggestions}
  final bool? enableSuggestions;

  /// {@macro flutter.widgets.editableText.minLines}
  ///  * [expands], which determines whether the field should fill the height of
  ///    its parent.
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool? expands;

  /// Determines how the [maxLength] limit should be enforced.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.onTapOutside}
  final TapRegionCallback? onTapOutside;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization? textCapitalization;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// {@macro flutter.widgets.editableText.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign? textAlign;

  /// {@macro flutter.material.InputDecorator.textAlignVertical}
  final TextAlignVertical? textAlignVertical;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool? autofocus;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  final String? obscuringCharacter;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// Disables the text field when false.
  final bool? enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double? cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  final double? cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The color to use when painting the cursor.
  final Color? cursorColor;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// {@template flutter.material.textfield.onTap}
  /// Called for each distinct tap except for every second tap of a double tap.
  final GestureTapCallback? onTap;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  /// {@macro flutter.widgets.editableText.autofillHints}
  /// {@macro flutter.services.AutofillConfiguration.autofillHints}
  final Iterable<String>? autofillHints;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets? scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool? enableInteractiveSelection;

  /// {@template flutter.material.textfield.restorationId}
  /// Restoration ID to save and restore the state of the text field.
  final String? restorationId;

  /// The appearance of the keyboard.
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior? dragStartBehavior;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;
}

class AdaptiveFieldProperties extends BaseFieldProperties {
  const AdaptiveFieldProperties({
    super.focusNode,
    super.contextMenuBuilder,
    super.prefixText,
    super.suffix,
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
    super.clipBehavior,
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
    super.textDirection,
    super.textInputAction,
  });
}

class AdaptiveFormFieldProperties extends BaseFieldProperties {
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

  /// Function that returns the widget representing this form field. It is
  /// passed the form field state as input, containing the current value and
  /// validation state of this field.
  final FormFieldBuilder<String>? builder;

  /// An optional value to initialize the form field to, or null otherwise.
  final String? initialValue;

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


  const AdaptiveFormFieldProperties({
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.autovalidateMode,
    this.initialValue,
    this.builder,
    super.focusNode,
    super.contextMenuBuilder,
    super.prefixText,
    super.suffix,
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
    super.clipBehavior,
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
    super.textDirection,
    super.textInputAction,
  });
}