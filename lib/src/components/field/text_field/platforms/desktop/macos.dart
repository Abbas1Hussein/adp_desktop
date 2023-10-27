import 'dart:ui';

import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/gestures.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../properties/adaptive_field_properties.dart';
import '../../../properties/macos.dart';

const TextStyle _kDefaultPlaceholderStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: CupertinoColors.placeholderText,
);

class TextFieldMacos extends StatelessWidget {
  final FieldMacosProperty? property;

  final AdaptiveFieldProperties? adaptiveProperties;

  const TextFieldMacos({
    super.key,
    this.property,
    this.adaptiveProperties,
  });

  @override
  Widget build(BuildContext context) {
    if (property?.useBorderless != null && property?.useBorderless == true) {
      return MacosTextField.borderless(
        key: key,
        onTap: adaptiveProperties?.onTap,
        style: adaptiveProperties?.style,
        prefix: property?.prefix,
        suffix: adaptiveProperties?.suffix,
        restorationId: 'editable',
        enabled: adaptiveProperties?.enabled,
        maxLines: adaptiveProperties?.maxLines,
        minLines: adaptiveProperties?.minLines,
        onChanged: adaptiveProperties?.onChanged,
        focusNode: adaptiveProperties?.focusNode,
        maxLength: adaptiveProperties?.maxLength,
        decoration: property?.decoration ?? kDefaultRoundedBorderDecoration,
        strutStyle: adaptiveProperties?.strutStyle,
        showCursor: adaptiveProperties?.showCursor,
        controller: adaptiveProperties?.controller,
        cursorColor: adaptiveProperties?.cursorColor,
        placeholder: property?.placeholder,
        expands: adaptiveProperties?.expands ?? false,
        cursorHeight: adaptiveProperties?.cursorHeight,
        keyboardType: adaptiveProperties?.keyboardType,
        readOnly: adaptiveProperties?.readOnly ?? false,
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
        placeholderStyle: property?.placeholderStyle ?? _kDefaultPlaceholderStyle,
        scrollController: adaptiveProperties?.scrollController,
        selectionControls: adaptiveProperties?.selectionControls,
        onEditingComplete: adaptiveProperties?.onEditingComplete,
        textAlignVertical: adaptiveProperties?.textAlignVertical,
        focusedDecoration: property?.focusedDecoration ?? kDefaultFocusedBorderDecoration,
        keyboardAppearance: adaptiveProperties?.keyboardAppearance,
        contextMenuBuilder: adaptiveProperties?.contextMenuBuilder,
        textAlign: adaptiveProperties?.textAlign ?? TextAlign.start,
        maxLengthEnforcement: adaptiveProperties?.maxLengthEnforcement,
        enableSuggestions: adaptiveProperties?.enableSuggestions ?? true,
        padding: property?.padding ?? const EdgeInsets.all(7.0),
        prefixMode: property?.prefixMode ?? OverlayVisibilityMode.always,
        obscuringCharacter: adaptiveProperties?.obscuringCharacter ?? '•',
        suffixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
        cursorRadius:
            adaptiveProperties?.cursorRadius ?? const Radius.circular(2.0),
        scrollPadding:
            adaptiveProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
        enableInteractiveSelection:
            adaptiveProperties?.enableInteractiveSelection ?? true,
        selectionWidthStyle:
            adaptiveProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
        dragStartBehavior:
            adaptiveProperties?.dragStartBehavior ?? DragStartBehavior.start,
        clearButtonMode:
            property?.clearButtonMode ?? OverlayVisibilityMode.never,
        selectionHeightStyle:
            adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
        textCapitalization:
            adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
      );
    } else {
      return MacosTextField(
        key: key,
        onTap: adaptiveProperties?.onTap,
        style: adaptiveProperties?.style,
        prefix: property?.prefix,
        suffix: adaptiveProperties?.suffix,
        restorationId: 'editable',
        enabled: adaptiveProperties?.enabled,
        maxLines: adaptiveProperties?.maxLines,
        minLines: adaptiveProperties?.minLines,
        onChanged: adaptiveProperties?.onChanged,
        focusNode: adaptiveProperties?.focusNode,
        maxLength: adaptiveProperties?.maxLength,
        decoration: property?.decoration ?? kDefaultRoundedBorderDecoration,
        strutStyle: adaptiveProperties?.strutStyle,
        showCursor: adaptiveProperties?.showCursor,
        controller: adaptiveProperties?.controller,
        cursorColor: adaptiveProperties?.cursorColor,
        placeholder: property?.placeholder,
        expands: adaptiveProperties?.expands ?? false,
        cursorHeight: adaptiveProperties?.cursorHeight,
        keyboardType: adaptiveProperties?.keyboardType,
        readOnly: adaptiveProperties?.readOnly ?? false,
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
        placeholderStyle: property?.placeholderStyle ?? _kDefaultPlaceholderStyle,
        scrollController: adaptiveProperties?.scrollController,
        selectionControls: adaptiveProperties?.selectionControls,
        onEditingComplete: adaptiveProperties?.onEditingComplete,
        textAlignVertical: adaptiveProperties?.textAlignVertical,
        focusedDecoration: property?.focusedDecoration ?? kDefaultFocusedBorderDecoration,
        keyboardAppearance: adaptiveProperties?.keyboardAppearance,
        contextMenuBuilder: adaptiveProperties?.contextMenuBuilder,
        textAlign: adaptiveProperties?.textAlign ?? TextAlign.start,
        maxLengthEnforcement: adaptiveProperties?.maxLengthEnforcement,
        enableSuggestions: adaptiveProperties?.enableSuggestions ?? true,
        padding: property?.padding ?? const EdgeInsets.all(7.0),
        prefixMode: property?.prefixMode ?? OverlayVisibilityMode.always,
        obscuringCharacter: adaptiveProperties?.obscuringCharacter ?? '•',
        suffixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
        cursorRadius:
            adaptiveProperties?.cursorRadius ?? const Radius.circular(2.0),
        scrollPadding:
            adaptiveProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
        enableInteractiveSelection:
            adaptiveProperties?.enableInteractiveSelection ?? true,
        selectionWidthStyle:
            adaptiveProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
        dragStartBehavior:
            adaptiveProperties?.dragStartBehavior ?? DragStartBehavior.start,
        clearButtonMode:
            property?.clearButtonMode ?? OverlayVisibilityMode.never,
        selectionHeightStyle:
            adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
        textCapitalization:
            adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
      );
    }
  }
}
