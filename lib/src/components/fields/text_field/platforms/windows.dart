import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../fields_properties.dart';
import '../../overlay_visibility/windows.dart';

Widget kDefaultContextMenuBuilder(
  BuildContext context,
  EditableTextState editableTextState,
) {
  return AdaptiveTextSelectionToolbar.editableText(
    editableTextState: editableTextState,
  );
}

class TextFieldWindows extends StatelessWidget {
  const TextFieldWindows({
    super.key,
    this.adpProperties,
  });

  final AdaptiveFieldProperties? adpProperties;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: adpProperties?.onTapOutside,
      child: TextBox(
        key: key,
        onTap: adpProperties?.onTap,
        onChanged: adpProperties?.onChanged,
        onSubmitted: adpProperties?.onSubmitted,
        onEditingComplete: adpProperties?.onEditingComplete,
        style: adpProperties?.style,
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: adpProperties?.prefix,
        ),
        suffix: adpProperties?.suffix,
        enabled: adpProperties?.enabled,
        maxLines: adpProperties?.maxLines ?? 1,
        minLines: adpProperties?.minLines,
        focusNode: adpProperties?.focusNode,
        maxLength: adpProperties?.maxLength,
        decoration: adpProperties?.decoration,
        strutStyle: adpProperties?.strutStyle,
        showCursor: adpProperties?.showCursor,
        controller: adpProperties?.controller,
        placeholder: adpProperties?.placeholder,
        placeholderStyle: adpProperties?.placeholderStyle,
        cursorColor: adpProperties?.cursorColor,
        expands: adpProperties?.expands ?? false,
        cursorHeight: adpProperties?.cursorHeight,
        keyboardType: adpProperties?.keyboardType,
        restorationId: adpProperties?.restorationId,
        readOnly: adpProperties?.readOnly ?? false,
        scrollPhysics: adpProperties?.scrollPhysics,
        autofillHints: adpProperties?.autofillHints,
        autofocus: adpProperties?.autofocus ?? false,
        cursorWidth: adpProperties?.cursorWidth ?? 2.0,
        smartDashesType: adpProperties?.smartDashesType,
        smartQuotesType: adpProperties?.smartQuotesType,
        autocorrect: adpProperties?.autocorrect ?? true,
        textInputAction: adpProperties?.textInputAction,
        inputFormatters: adpProperties?.inputFormatters,
        obscureText: adpProperties?.obscureText ?? false,
        scrollController: adpProperties?.scrollController,
        selectionControls: adpProperties?.selectionControls,
        textAlignVertical: adpProperties?.textAlignVertical,
        keyboardAppearance: adpProperties?.keyboardAppearance,
        contextMenuBuilder:
            adpProperties?.contextMenuBuilder ?? kDefaultContextMenuBuilder,
        textAlign: adpProperties?.textAlign ?? TextAlign.start,
        maxLengthEnforcement: adpProperties?.maxLengthEnforcement,
        prefixMode: adpProperties?.prefixMode?.overlayMode ??
            OverlayVisibilityMode.always,
        suffixMode: adpProperties?.suffixMode?.overlayMode ??
            OverlayVisibilityMode.always,
        enableSuggestions: adpProperties?.enableSuggestions ?? true,
        padding: adpProperties?.padding ?? kTextBoxPadding,
        obscuringCharacter: adpProperties?.obscuringCharacter ?? '•',
        enableInteractiveSelection: adpProperties?.enableInteractiveSelection,
        cursorRadius: adpProperties?.cursorRadius ?? const Radius.circular(2.0),
        scrollPadding:
            adpProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
        selectionWidthStyle:
            adpProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
        dragStartBehavior:
            adpProperties?.dragStartBehavior ?? DragStartBehavior.start,
        selectionHeightStyle:
            adpProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
        textCapitalization:
            adpProperties?.textCapitalization ?? TextCapitalization.none,
        enableIMEPersonalizedLearning: true,
        highlightColor:
            adpProperties?.decoration != null ? Colors.transparent : null,
        unfocusedColor:
            adpProperties?.decoration != null ? Colors.transparent : null,
      ),
    );
  }
}
