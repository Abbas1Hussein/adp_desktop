import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../../core/common/construct/component.dart';
import '../adaptive_field_properties.dart';
import 'platforms/platforms.dart';

class AdaptiveTextField extends CoreAdaptiveComponent {
  const AdaptiveTextField({
    super.key,
    super.builders,
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
    this.foregroundDecoration,
    this.decoration,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
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

  /// Context menu builder for editable text.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// Controls how tall the selection highlight boxes are computed to be.
  final BoxHeightStyle? selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final BoxWidthStyle? selectionWidthStyle;

  /// Controls the [BoxDecoration] of the text field behind the text input.
  final BoxDecoration? decoration;

  /// Controls the [BoxDecoration] of the text field in front of the text input.
  final BoxDecoration? foregroundDecoration;

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

  /// Text direction for the text field.
  final TextDirection? textDirection;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: super.build(context),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return TextFieldMacos(adaptiveProperties: fieldProperties);
  }

  @override
  Widget windows(BuildContext context) {
    return TextFieldWindows(adaptiveProperties: fieldProperties);
  }

  AdaptiveFieldProperties get fieldProperties {
    return AdaptiveFieldProperties(
      onTap: onTap,
      style: style,
      prefix: prefix,
      suffix: suffix,
      padding: padding,
      prefixMode: prefixMode,
      suffixMode: suffixMode,
      decoration: decoration,
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,
      maxLines: maxLines,
      autofocus: autofocus,
      autocorrect: autocorrect,
      autofillHints: autofillHints,
      foregroundDecoration: foregroundDecoration,
      contextMenuBuilder: contextMenuBuilder,
      controller: controller,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorWidth: cursorWidth,
      dragStartBehavior: dragStartBehavior,
      enabled: enabled,
      enableInteractiveSelection: enableInteractiveSelection,
      enableSuggestions: enableSuggestions,
      expands: expands,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardAppearance: keyboardAppearance,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      minLines: minLines,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTapOutside: onTapOutside,
      readOnly: readOnly,
      restorationId: restorationId,
      scrollController: scrollController,
      scrollPadding: scrollPadding,
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      showCursor: showCursor,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      textInputAction: textInputAction,
    );
  }
}
