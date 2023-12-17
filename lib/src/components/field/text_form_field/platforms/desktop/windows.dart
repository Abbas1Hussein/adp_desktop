// import 'dart:ui';
//
// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/services.dart';
//
// import '../../../adaptive_field_properties.dart';
// import '../../../properties/windows.dart';
//
// class TextFormFieldWindows extends StatelessWidget {
//   final FieldWindowsProperty? property;
//
//   final AdaptiveFormFieldProperties? adaptiveProperties;
//
//   const TextFormFieldWindows({
//     super.key,
//     this.property,
//     this.adaptiveProperties,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormBox(
//       key: key,
//       onTap: adaptiveProperties?.onTap,
//       style: adaptiveProperties?.style,
//       prefix: property?.prefix,
//       suffix: adaptiveProperties?.suffix,
//       restorationId: 'editable',
//       onFieldSubmitted:adaptiveProperties?.onFieldSubmitted,
//       initialValue: adaptiveProperties?.initialValue,
//       autovalidateMode: adaptiveProperties?.autovalidateMode,
//       onSaved: adaptiveProperties?.onSaved,
//       validator: adaptiveProperties?.validator,
//       enabled: adaptiveProperties?.enabled ?? true,
//       maxLines: adaptiveProperties?.maxLines,
//       minLines: adaptiveProperties?.minLines,
//       onChanged: adaptiveProperties?.onChanged,
//       focusNode: adaptiveProperties?.focusNode,
//       maxLength: adaptiveProperties?.maxLength,
//       decoration: property?.decoration,
//       strutStyle: adaptiveProperties?.strutStyle,
//       showCursor: adaptiveProperties?.showCursor,
//       controller: adaptiveProperties?.controller,
//       cursorColor: adaptiveProperties?.cursorColor,
//       placeholder: property?.placeholder,
//       expands: adaptiveProperties?.expands ?? false,
//       cursorHeight: adaptiveProperties?.cursorHeight,
//       onTapOutside: adaptiveProperties?.onTapOutside,
//       keyboardType: adaptiveProperties?.keyboardType,
//       readOnly: adaptiveProperties?.readOnly ?? false,
//       textDirection: adaptiveProperties?.textDirection,
//       scrollPhysics: adaptiveProperties?.scrollPhysics,
//       autofillHints: adaptiveProperties?.autofillHints,
//       autofocus: adaptiveProperties?.autofocus ?? false,
//       cursorWidth: adaptiveProperties?.cursorWidth ?? 2.0,
//       smartDashesType: adaptiveProperties?.smartDashesType,
//       smartQuotesType: adaptiveProperties?.smartQuotesType,
//       autocorrect: adaptiveProperties?.autocorrect ?? true,
//       textInputAction: adaptiveProperties?.textInputAction,
//       inputFormatters: adaptiveProperties?.inputFormatters,
//       obscureText: adaptiveProperties?.obscureText ?? false,
//       placeholderStyle: property?.placeholderStyle,
//       scrollController: adaptiveProperties?.scrollController,
//       selectionControls: adaptiveProperties?.selectionControls,
//       onEditingComplete: adaptiveProperties?.onEditingComplete,
//       textAlignVertical: adaptiveProperties?.textAlignVertical,
//       keyboardAppearance: adaptiveProperties?.keyboardAppearance,
//       contextMenuBuilder: adaptiveProperties?.contextMenuBuilder,
//       textAlign: adaptiveProperties?.textAlign ?? TextAlign.start,
//       highlightColor: property?.highlightColor,
//       unfocusedColor: property?.unfocusedColor,
//       scribbleEnabled: property?.scribbleEnabled ?? true,
//       maxLengthEnforcement: adaptiveProperties?.maxLengthEnforcement,
//       clipBehavior: adaptiveProperties?.clipBehavior ?? Clip.hardEdge,
//       enableSuggestions: adaptiveProperties?.enableSuggestions ?? true,
//       padding: property?.padding ?? kTextBoxPadding,
//       prefixMode: property?.prefixMode ?? OverlayVisibilityMode.always,
//       obscuringCharacter: adaptiveProperties?.obscuringCharacter ?? '•',
//       spellCheckConfiguration: property?.spellCheckConfiguration,
//       suffixMode: property?.suffixMode ?? OverlayVisibilityMode.always,
//       enableInteractiveSelection:
//           adaptiveProperties?.enableInteractiveSelection,
//       cursorRadius:
//           adaptiveProperties?.cursorRadius ?? const Radius.circular(2.0),
//       scrollPadding:
//           adaptiveProperties?.scrollPadding ?? const EdgeInsets.all(20.0),
//       selectionWidthStyle:
//           adaptiveProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
//       dragStartBehavior:
//           adaptiveProperties?.dragStartBehavior ?? DragStartBehavior.start,
//       selectionHeightStyle:
//           adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
//       textCapitalization:
//           adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
//       enableIMEPersonalizedLearning:
//           property?.enableIMEPersonalizedLearning ?? true,
//       magnifierConfiguration: property?.magnifierConfiguration ??
//           TextMagnifier.adaptiveMagnifierConfiguration,
//     );
//   }
// }
