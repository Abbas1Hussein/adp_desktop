import 'dart:ui';

import 'package:flutter/cupertino.dart' show CupertinoColors;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../properties/adaptive_field_properties.dart';
import '../../../properties/macos.dart';


const TextStyle _kDefaultPlaceholderStyle = TextStyle(fontWeight: FontWeight.w400, color: CupertinoColors.placeholderText);

class TextFormFieldMacos extends StatelessWidget {
  final FieldMacosProperty? property;

  final AdaptiveFormFieldProperties? adaptiveProperties;

  const TextFormFieldMacos({
    super.key,
    this.property,
    this.adaptiveProperties,
  });

  @override
  Widget build(BuildContext context) {
    return MacosTextFormField(
      key: key,
      restorationId: 'editable',
      onTap: adaptiveProperties?.onTap,
      initialValue: adaptiveProperties?.initialValue,
      validator: adaptiveProperties?.validator,
      onSaved: adaptiveProperties?.onSaved,
      style: adaptiveProperties?.style,
      prefix: property?.prefix,
      suffix: adaptiveProperties?.suffix,
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
      placeholderStyle: property?.placeholderStyle ?? _kDefaultPlaceholderStyle,
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
      onFieldSubmitted: adaptiveProperties?.onFieldSubmitted,
      scrollController: adaptiveProperties?.scrollController,
      selectionControls: adaptiveProperties?.selectionControls,
      onEditingComplete: adaptiveProperties?.onEditingComplete,
      textAlignVertical: adaptiveProperties?.textAlignVertical,
      focusedDecoration:
          property?.focusedDecoration ?? kDefaultFocusedBorderDecoration,
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
      autovalidateMode:
          adaptiveProperties?.autovalidateMode ?? AutovalidateMode.disabled,
      enableInteractiveSelection:
          adaptiveProperties?.enableInteractiveSelection ?? true,
      selectionWidthStyle:
          adaptiveProperties?.selectionWidthStyle ?? BoxWidthStyle.tight,
      dragStartBehavior:
          adaptiveProperties?.dragStartBehavior ?? DragStartBehavior.start,
      clearButtonMode: property?.clearButtonMode ?? OverlayVisibilityMode.never,
      selectionHeightStyle:
          adaptiveProperties?.selectionHeightStyle ?? BoxHeightStyle.tight,
      textCapitalization:
          adaptiveProperties?.textCapitalization ?? TextCapitalization.none,
    );
  }
}

/// A [FormField] that contains a [MacosTextFormField].
///
/// This is a convenience widget that wraps a [MacosTextFormField] widget in a
/// [FormField].
///
/// A [Form] ancestor is not required. The [Form] simply makes it easier to
/// save, reset, or validate multiple fields at once. To use without a [Form],
/// pass a `GlobalKey<FormFieldState>` (see [GlobalKey]) to the constructor and use
/// [GlobalKey.currentState] to save or reset the form field.
///
/// When a [controller] is specified, its [TextEditingController.text]
/// defines the [initialValue]. If this [FormField] is part of a scrolling
/// container that lazily constructs its children, like a [ListView] or a
/// [CustomScrollView], then a [controller] should be specified.
/// The controller's lifetime should be managed by a stateful widget ancestor
/// of the scrolling container.
///
/// If a [controller] is not specified, [initialValue] can be used to give
/// the automatically generated controller an initial value.
///
/// {@macro flutter.material.text-field.wantKeepAlive}
///
/// Remember to call [TextEditingController.dispose] of the [TextEditingController]
/// when it is no longer needed. This will ensure any resources used by the object
/// are discarded.
class MacosTextFormField extends FormField<String> {
  /// Creates a [FormField] that contains a [MacosTextFormField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  MacosTextFormField({
    Key? key,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    EdgeInsets padding = const EdgeInsets.all(4.0),
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius cursorRadius = const Radius.circular(2.0),
    Color? cursorColor,
    Widget Function(String error)? errorHighlightWidget,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    TextSelectionControls? selectionControls,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String? placeholder,
    TextStyle? placeholderStyle = _kDefaultPlaceholderStyle,
    ScrollController? scrollController,
    Widget? prefix,
    OverlayVisibilityMode prefixMode = OverlayVisibilityMode.always,
    Widget? suffix,
    OverlayVisibilityMode suffixMode = OverlayVisibilityMode.always,
    OverlayVisibilityMode clearButtonMode = OverlayVisibilityMode.never,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool enableInteractiveSelection = true,
    String? restorationId,
    MaxLengthEnforcement? maxLengthEnforcement,
    BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight,
    BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight,
    BoxDecoration? decoration = kDefaultRoundedBorderDecoration,
    BoxDecoration? focusedDecoration = kDefaultFocusedBorderDecoration,
    EditableTextContextMenuBuilder? contextMenuBuilder,
  })  : assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength > 0),
        super(
          key: key,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          enabled: enabled ?? true,
          builder: (FormFieldState<String> field) {
            final state = field as _MacosTextFormFieldState;
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MacosTextField(
                    enableInteractiveSelection: enableInteractiveSelection,
                    clearButtonMode: clearButtonMode,
                    focusedDecoration: focusedDecoration,
                    controller: state._effectiveController,
                    focusNode: focusNode,
                    keyboardType: keyboardType,
                    textInputAction: textInputAction,
                    style: style,
                    strutStyle: strutStyle,
                    textAlign: textAlign,
                    textAlignVertical: textAlignVertical,
                    textCapitalization: textCapitalization,
                    autofocus: autofocus,
                    readOnly: readOnly,
                    showCursor: showCursor,
                    obscuringCharacter: obscuringCharacter,
                    obscureText: obscureText,
                    autocorrect: autocorrect,
                    smartDashesType: smartDashesType ??
                        (obscureText
                            ? SmartDashesType.disabled
                            : SmartDashesType.enabled),
                    smartQuotesType: smartQuotesType ??
                        (obscureText
                            ? SmartQuotesType.disabled
                            : SmartQuotesType.enabled),
                    enableSuggestions: enableSuggestions,
                    maxLines: maxLines,
                    minLines: minLines,
                    expands: expands,
                    maxLength: maxLength,
                    onChanged: onChangedHandler,
                    onTap: onTap,
                    onEditingComplete: onEditingComplete,
                    onSubmitted: onFieldSubmitted,
                    inputFormatters: inputFormatters,
                    enabled: enabled,
                    cursorWidth: cursorWidth,
                    cursorHeight: cursorHeight,
                    cursorColor: cursorColor,
                    cursorRadius: cursorRadius,
                    scrollPadding: scrollPadding,
                    scrollPhysics: scrollPhysics,
                    keyboardAppearance: keyboardAppearance,
                    autofillHints: autofillHints,
                    placeholder: placeholder,
                    placeholderStyle: placeholderStyle,
                    scrollController: scrollController,
                    prefix: prefix,
                    prefixMode: prefixMode,
                    suffix: suffix,
                    suffixMode: suffixMode,
                    dragStartBehavior: dragStartBehavior,
                    maxLengthEnforcement: maxLengthEnforcement,
                    restorationId: restorationId,
                    selectionHeightStyle: selectionHeightStyle,
                    selectionWidthStyle: selectionWidthStyle,
                    decoration: decoration,
                    selectionControls: selectionControls,
                    contextMenuBuilder: contextMenuBuilder,
                  ),
                  if (field.errorText != null && errorHighlightWidget != null)
                    errorHighlightWidget(field.errorText!)
                  else if (field.errorText != null)
                    _buildDefaultErrorMessage(field),
                ],
              ),
            );
          },
        );

  static Widget _buildDefaultErrorMessage(_MacosTextFormFieldState field) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 2.0,
        start: 4.0,
        end: 2.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: CupertinoColors.destructiveRed,
            fontWeight: FontWeight.w500,
          ),
          child: Text(field.errorText!),
        ),
      ),
    );
  }

  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _MacosTextFormFieldState();
}

class _MacosTextFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;

  @override
  MacosTextFormField get widget => super.widget as MacosTextFormField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(MacosTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller!.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (value != null && _effectiveController!.text != value) {
      _effectiveController!.text = value;
    }
  }

  @override
  void reset() {
    super.reset();

    if (widget.initialValue != null) {
      setState(() {
        _effectiveController!.text = widget.initialValue!;
      });
    }
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
