import 'dart:ui';

import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/gestures.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../adaptive_field_properties.dart';

const TextStyle _kDefaultPlaceholderStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: CupertinoColors.placeholderText,
);

class TextFieldMacos extends StatelessWidget {
  const TextFieldMacos({
    super.key,
    this.adaptiveProperties,
  });

  final AdaptiveFieldProperties? adaptiveProperties;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: adaptiveProperties?.onTapOutside,
      child: DecoratedBox(
        decoration: adaptiveProperties?.decoration?.copyWith(
              color: adaptiveProperties?.decoration?.color?.withOpacity(0.7),
            ) ??
            const BoxDecoration(),
        child: MacosTextField(
          key: key,
          onTap: adaptiveProperties?.onTap,
          onChanged: adaptiveProperties?.onChanged,
          onSubmitted: adaptiveProperties?.onSubmitted,
          onEditingComplete: adaptiveProperties?.onEditingComplete,
          placeholder: adaptiveProperties?.placeholder,
          placeholderStyle:
              adaptiveProperties?.placeholderStyle ?? _kDefaultPlaceholderStyle,
          clearButtonMode: OverlayVisibilityMode.editing,
          prefixMode: toOverlayMode(adaptiveProperties?.prefixMode?.name),
          suffixMode: toOverlayMode(adaptiveProperties?.suffixMode?.name),
          padding: adaptiveProperties?.padding ?? const EdgeInsets.all(4.0),
          decoration: adaptiveProperties?.decoration == null
              ? kDefaultRoundedBorderDecoration
              : null,
          focusedDecoration: adaptiveProperties?.decoration == null
              ? kDefaultFocusedBorderDecoration
              : null,
          prefix: adaptiveProperties?.prefix,
          style: adaptiveProperties?.style,
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: adaptiveProperties?.suffix,
          ),
          enabled: adaptiveProperties?.enabled,
          maxLines: adaptiveProperties?.maxLines ?? 1,
          minLines: adaptiveProperties?.minLines,
          focusNode: adaptiveProperties?.focusNode,
          maxLength: adaptiveProperties?.maxLength,
          strutStyle: adaptiveProperties?.strutStyle,
          showCursor: adaptiveProperties?.showCursor,
          controller: adaptiveProperties?.controller,
          cursorColor: adaptiveProperties?.cursorColor,
          expands: adaptiveProperties?.expands ?? false,
          cursorHeight: adaptiveProperties?.cursorHeight,
          keyboardType: adaptiveProperties?.keyboardType,
          readOnly: adaptiveProperties?.readOnly ?? false,
          restorationId: adaptiveProperties?.restorationId,
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
          obscuringCharacter: adaptiveProperties?.obscuringCharacter ?? '•',
          keyboardAppearance: adaptiveProperties?.keyboardAppearance,
          contextMenuBuilder: adaptiveProperties?.contextMenuBuilder ??
              _defaultContextMenuBuilder,
          textAlign: adaptiveProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: adaptiveProperties?.maxLengthEnforcement,
          enableSuggestions: adaptiveProperties?.enableSuggestions ?? true,
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
          selectionHeightStyle:
              adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
          textCapitalization:
              adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
        ),
      ),
    );
  }

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return CupertinoAdaptiveTextSelectionToolbar.editableText(
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
