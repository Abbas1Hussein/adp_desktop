import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../../adaptive_field_properties.dart';

class TextFieldWindows extends StatelessWidget {
  const TextFieldWindows({
    super.key,
    this.adaptiveProperties,
  });

  final AdaptiveFieldProperties? adaptiveProperties;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: adaptiveProperties?.onTapOutside,
      child: TextBox(
        key: key,
        scribbleEnabled: true,
        onTap: adaptiveProperties?.onTap,
        onChanged: adaptiveProperties?.onChanged,
        onSubmitted: adaptiveProperties?.onSubmitted,
        onEditingComplete: adaptiveProperties?.onEditingComplete,
        style: adaptiveProperties?.style,
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: adaptiveProperties?.prefix,
        ),
        suffix: adaptiveProperties?.suffix,
        enabled: adaptiveProperties?.enabled,
        maxLines: adaptiveProperties?.maxLines ?? 1,
        minLines: adaptiveProperties?.minLines,
        focusNode: adaptiveProperties?.focusNode,
        maxLength: adaptiveProperties?.maxLength,
        decoration: adaptiveProperties?.decoration,
        strutStyle: adaptiveProperties?.strutStyle,
        showCursor: adaptiveProperties?.showCursor,
        controller: adaptiveProperties?.controller,
        placeholder: adaptiveProperties?.placeholder,
        placeholderStyle: adaptiveProperties?.placeholderStyle,
        cursorColor: adaptiveProperties?.cursorColor,
        expands: adaptiveProperties?.expands ?? false,
        cursorHeight: adaptiveProperties?.cursorHeight,
        keyboardType: adaptiveProperties?.keyboardType,
        restorationId: adaptiveProperties?.restorationId,
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
        scrollController: adaptiveProperties?.scrollController,
        selectionControls: adaptiveProperties?.selectionControls,
        textAlignVertical: adaptiveProperties?.textAlignVertical,
        keyboardAppearance: adaptiveProperties?.keyboardAppearance,
        contextMenuBuilder: adaptiveProperties?.contextMenuBuilder ?? _defaultContextMenuBuilder,
        textAlign: adaptiveProperties?.textAlign ?? TextAlign.start,
        maxLengthEnforcement: adaptiveProperties?.maxLengthEnforcement,
        prefixMode: toOverlayMode(adaptiveProperties?.prefixMode?.name),
        suffixMode: toOverlayMode(adaptiveProperties?.suffixMode?.name),
        enableSuggestions: adaptiveProperties?.enableSuggestions ?? true,
        padding: adaptiveProperties?.padding ?? kTextBoxPadding,
        foregroundDecoration: adaptiveProperties?.foregroundDecoration,
        obscuringCharacter: adaptiveProperties?.obscuringCharacter ?? '•',
        enableInteractiveSelection:
            adaptiveProperties?.enableInteractiveSelection,
        cursorRadius:
            adaptiveProperties?.cursorRadius ?? const Radius.circular(2.0),
        scrollPadding:
            adaptiveProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
        selectionWidthStyle:
            adaptiveProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
        dragStartBehavior:
            adaptiveProperties?.dragStartBehavior ?? DragStartBehavior.start,
        selectionHeightStyle:
            adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
        textCapitalization:
            adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
        enableIMEPersonalizedLearning: true,
      ),
    );
  }

  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  OverlayVisibilityMode toOverlayMode(String? mode) {
    switch (mode) {
      case 'always':
        return OverlayVisibilityMode.always;
      case 'never':
        return OverlayVisibilityMode.never;
      case 'notEditing':
        return OverlayVisibilityMode.notEditing;
      default:
        return OverlayVisibilityMode.always;
    }
  }
}
