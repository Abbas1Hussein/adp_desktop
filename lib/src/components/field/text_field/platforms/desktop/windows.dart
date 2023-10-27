import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../../properties/adaptive_field_properties.dart';
import '../../../properties/windows.dart';

class TextFieldWindows extends StatelessWidget {
  final FieldWindowsProperty? property;

  final AdaptiveFieldProperties? adaptiveProperties;

  const TextFieldWindows({
    super.key,
    this.property,
    this.adaptiveProperties,
  });

  @override
  Widget build(BuildContext context) {
    return TextBox(
      key: key,
      restorationId: 'editable',
      onTap: adaptiveProperties?.onTap,
      style: adaptiveProperties?.style,
      prefix: property?.prefix,
      suffix: adaptiveProperties?.suffix,
      enabled: adaptiveProperties?.enabled,
      maxLines: adaptiveProperties?.maxLines,
      minLines: adaptiveProperties?.minLines,
      onChanged: adaptiveProperties?.onChanged,
      focusNode: adaptiveProperties?.focusNode,
      maxLength: adaptiveProperties?.maxLength,
      decoration: property?.decoration,
      strutStyle: adaptiveProperties?.strutStyle,
      showCursor: adaptiveProperties?.showCursor,
      controller: adaptiveProperties?.controller,
      onSubmitted: adaptiveProperties?.onSubmitted,
      cursorColor: adaptiveProperties?.cursorColor,
      placeholder: property?.placeholder,
      expands: adaptiveProperties?.expands ?? false,
      cursorHeight: adaptiveProperties?.cursorHeight,
      onTapOutside: adaptiveProperties?.onTapOutside,
      keyboardType: adaptiveProperties?.keyboardType,
      readOnly: adaptiveProperties?.readOnly ?? false,
      textDirection: adaptiveProperties?.textDirection,
      scrollPhysics: adaptiveProperties?.scrollPhysics,
      autofillHints: adaptiveProperties?.autofillHints,
      autofocus: adaptiveProperties?.autofocus ?? false,
      cursorWidth: adaptiveProperties?.cursorWidth ?? 2.0,
      smartDashesType: adaptiveProperties?.smartDashesType,
      smartQuotesType: adaptiveProperties?.smartQuotesType,
      autocorrect: adaptiveProperties?.autocorrect ?? true,
      textInputAction: adaptiveProperties?.textInputAction,
      inputFormatters: adaptiveProperties?.inputFormatters,
      obscureText: adaptiveProperties?.obscureText ?? false,
      placeholderStyle: property?.placeholderStyle,
      scrollController: adaptiveProperties?.scrollController,
      selectionControls: adaptiveProperties?.selectionControls,
      onEditingComplete: adaptiveProperties?.onEditingComplete,
      textAlignVertical: adaptiveProperties?.textAlignVertical,
      keyboardAppearance: adaptiveProperties?.keyboardAppearance,
      contextMenuBuilder: adaptiveProperties?.contextMenuBuilder,
      textAlign: adaptiveProperties?.textAlign ?? TextAlign.start,
      highlightColor: property?.highlightColor,
      unfocusedColor: property?.unfocusedColor,
      scribbleEnabled: property?.scribbleEnabled ?? true,
      maxLengthEnforcement: adaptiveProperties?.maxLengthEnforcement,
      clipBehavior: adaptiveProperties?.clipBehavior ?? Clip.hardEdge,
      enableSuggestions: adaptiveProperties?.enableSuggestions ?? true,
      padding: property?.padding ?? const EdgeInsets.all(7.0),
      prefixMode: property?.prefixMode ?? OverlayVisibilityMode.always,
      obscuringCharacter: adaptiveProperties?.obscuringCharacter ?? '•',
      spellCheckConfiguration: property?.spellCheckConfiguration,
      suffixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
      enableInteractiveSelection:
          adaptiveProperties?.enableInteractiveSelection,
      cursorRadius:
          adaptiveProperties?.cursorRadius ?? const Radius.circular(2.0),
      scrollPadding:
          adaptiveProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
      selectionWidthStyle: adaptiveProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
      dragStartBehavior: adaptiveProperties?.dragStartBehavior ?? DragStartBehavior.start,
      selectionHeightStyle: adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
      textCapitalization: adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
      enableIMEPersonalizedLearning: property?.enableIMEPersonalizedLearning ?? true,
      magnifierConfiguration: property?.magnifierConfiguration,
    );
  }
}
