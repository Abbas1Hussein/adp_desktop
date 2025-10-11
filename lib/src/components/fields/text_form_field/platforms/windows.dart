import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../../fields_properties.dart';
import '../../overlay_visibility/windows.dart';
import '../../text_field/platforms/windows.dart';

class TextFormFieldWindows extends StatelessWidget {
  const TextFormFieldWindows({
    super.key,
    this.adpProperties,
  });
  final AdaptiveFormFieldProperties? adpProperties;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: adpProperties?.padding ?? const EdgeInsets.all(4.0),
      child: TextFieldTapRegion(
        onTapOutside: adpProperties?.onTapOutside,
        child: TextFormBox(
          onTap: adpProperties?.onTap,
          onSaved: adpProperties?.onSaved,
          validator: adpProperties?.validator,
          onChanged: adpProperties?.onChanged,
          onFieldSubmitted: adpProperties?.onFieldSubmitted,
          onEditingComplete: adpProperties?.onEditingComplete,
          errorHighlightColor: adpProperties?.errorHighlightColor,
          style: adpProperties?.style,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: adpProperties?.prefix,
          ),
          enabled: adpProperties?.enabled ?? true,
          contextMenuBuilder: adpProperties?.contextMenuBuilder ?? kDefaultContextMenuBuilder,
          prefixMode: adpProperties?.prefixMode?.overlayMode ?? OverlayVisibilityMode.always,
          initialValue: adpProperties?.initialValue,
          autovalidateMode: adpProperties?.autovalidateMode,
          suffix: adpProperties?.suffix,
          suffixMode: adpProperties?.suffixMode?.overlayMode ?? OverlayVisibilityMode.always,
          maxLines: adpProperties?.maxLines ?? 1,
          minLines: adpProperties?.minLines,
          focusNode: adpProperties?.focusNode,
          maxLength: adpProperties?.maxLength,
          decoration: adpProperties?.decoration != null
              ? WidgetStateProperty.all(adpProperties!.decoration!)
              : null,
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
          textAlign: adpProperties?.textAlign ?? TextAlign.start,
          maxLengthEnforcement: adpProperties?.maxLengthEnforcement,
          enableSuggestions: adpProperties?.enableSuggestions ?? true,
          obscuringCharacter: adpProperties?.obscuringCharacter ?? '•',
          enableInteractiveSelection:
              adpProperties?.enableInteractiveSelection,
          cursorRadius:
              adpProperties?.cursorRadius ?? const Radius.circular(2.0),
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
      ),
    );
  }
}
