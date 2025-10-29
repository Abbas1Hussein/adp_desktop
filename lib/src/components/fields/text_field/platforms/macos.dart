import 'dart:ui';

import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/gestures.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../fields_properties.dart';
import '../../overlay_visibility/macos.dart';

Widget kDefaultContextMenuBuilder(
  BuildContext context,
  EditableTextState editableTextState,
) {
  return CupertinoAdaptiveTextSelectionToolbar.editableText(
    editableTextState: editableTextState,
  );
}

const TextStyle kDefaultPlaceholderStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: CupertinoColors.placeholderText,
);

class TextFieldMacos extends StatelessWidget {
  const TextFieldMacos({super.key, this.adpProperties});

  final AdaptiveFieldProperties? adpProperties;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: adpProperties?.onTapOutside,
      child: DecoratedBox(
        decoration: adpProperties?.decoration?.copyWith(
              color: adpProperties?.decoration?.color?.withValues(alpha: 0.7),
            ) ??
            const BoxDecoration(),
        child: MacosTextField(
          key: key,
          onTap: adpProperties?.onTap,
          onChanged: adpProperties?.onChanged,
          onSubmitted: adpProperties?.onSubmitted,
          onEditingComplete: adpProperties?.onEditingComplete,
          placeholder: adpProperties?.placeholder,
          placeholderStyle:
              adpProperties?.placeholderStyle ?? kDefaultPlaceholderStyle,
          clearButtonMode: OverlayVisibilityMode.editing,
          prefixMode: adpProperties?.prefixMode?.overlayMode ??
              OverlayVisibilityMode.always,
          suffixMode: adpProperties?.suffixMode?.overlayMode ??
              OverlayVisibilityMode.always,
          padding: adpProperties?.padding ?? const EdgeInsets.all(4.0),
          decoration: adpProperties?.decoration != null
              ? null
              : kDefaultRoundedBorderDecoration,
          focusedDecoration: adpProperties?.decoration != null
              ? null
              : kDefaultFocusedBorderDecoration,
          prefix: adpProperties?.prefix,
          style: adpProperties?.style,
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: adpProperties?.suffix,
          ),
          enabled: adpProperties?.enabled,
          maxLines: adpProperties?.maxLines ?? 1,
          minLines: adpProperties?.minLines,
          focusNode: adpProperties?.focusNode,
          maxLength: adpProperties?.maxLength,
          strutStyle: adpProperties?.strutStyle,
          showCursor: adpProperties?.showCursor,
          controller: adpProperties?.controller,
          cursorColor: adpProperties?.cursorColor,
          expands: adpProperties?.expands ?? false,
          cursorHeight: adpProperties?.cursorHeight,
          keyboardType: adpProperties?.keyboardType,
          readOnly: adpProperties?.readOnly ?? false,
          restorationId: adpProperties?.restorationId,
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
          obscuringCharacter: adpProperties?.obscuringCharacter ?? '•',
          keyboardAppearance: adpProperties?.keyboardAppearance,
          contextMenuBuilder:
              adpProperties?.contextMenuBuilder ?? kDefaultContextMenuBuilder,
          textAlign: adpProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: adpProperties?.maxLengthEnforcement,
          enableSuggestions: adpProperties?.enableSuggestions ?? true,
          cursorRadius:
              adpProperties?.cursorRadius ?? const Radius.circular(2.0),
          scrollPadding:
              adpProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
          enableInteractiveSelection:
              adpProperties?.enableInteractiveSelection ?? true,
          selectionWidthStyle:
              adpProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
          dragStartBehavior:
              adpProperties?.dragStartBehavior ?? DragStartBehavior.start,
          selectionHeightStyle:
              adpProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
          textCapitalization:
              adpProperties?.textCapitalization ?? TextCapitalization.none,
        ),
      ),
    );
  }
}
