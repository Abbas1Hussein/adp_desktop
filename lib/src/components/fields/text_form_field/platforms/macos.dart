import 'dart:ui';

import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../adaptive_field_properties.dart';
import '../../overlay_visibility/macos.dart';
import '../../text_field/platforms/macos.dart';

class TextFormFieldMacos extends StatelessWidget {
  const TextFormFieldMacos({
    super.key,
    this.adpProperties,
  });

  final AdaptiveFormFieldProperties? adpProperties;


  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      onTapOutside: adpProperties?.onTapOutside,
      child: _MacosTextFormField(
        key: key,
        context: context,
        onTap: adpProperties?.onTap,
        onSaved: adpProperties?.onSaved,
        onChanged: adpProperties?.onChanged,
        validator: adpProperties?.validator,
        onFieldSubmitted: adpProperties?.onFieldSubmitted,
        onEditingComplete: adpProperties?.onEditingComplete,
        initialValue: adpProperties?.initialValue,
        placeholder: adpProperties?.placeholder,
        errorHighlightColor: adpProperties?.errorHighlightColor,
        autovalidateMode:
            adpProperties?.autovalidateMode ?? AutovalidateMode.disabled,
        placeholderStyle:
            adpProperties?.placeholderStyle ?? kDefaultPlaceholderStyle,
        prefixMode: adpProperties?.prefixMode?.overlayMode ??
            OverlayVisibilityMode.always,
        suffixMode: adpProperties?.suffixMode?.overlayMode ??
            OverlayVisibilityMode.always,
        clearButtonMode: OverlayVisibilityMode.editing,
        padding: adpProperties?.padding ?? const EdgeInsets.all(4.0),
        decoration: adpProperties?.decoration,
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
        cursorRadius: adpProperties?.cursorRadius ?? const Radius.circular(2.0),
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
    );
  }
}

/// A [FormField] that contains a [_MacosTextFormField].
///
/// This is a convenience widget that wraps a [_MacosTextFormField] widget in a
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
class _MacosTextFormField extends FormField<String> {
  /// Creates a [FormField] that contains a [_MacosTextFormField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  _MacosTextFormField({
    Key? key,
    this.controller,
    required BuildContext context,
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
    Color? errorHighlightColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    TextSelectionControls? selectionControls,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String? placeholder,
    TextStyle? placeholderStyle = kDefaultPlaceholderStyle,
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
                  DecoratedBox(
                    decoration: decoration?.copyWith(
                          color: decoration.color?.withOpacity(0.7),
                        ) ??
                        const BoxDecoration(),
                    child: MacosTextField(
                      padding: padding,
                      enableInteractiveSelection: enableInteractiveSelection,
                      clearButtonMode: clearButtonMode,
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
                      focusedDecoration: decoration != null
                          ? null
                          : kDefaultFocusedBorderDecoration,
                      decoration: decoration != null
                          ? null
                          : kDefaultRoundedBorderDecoration.copyWith(
                              border: Border.all(
                                color: field.errorText != null
                                    ? errorHighlightColor ??
                                        MacosColors.appleRed
                                    : MacosColors.transparent,
                                width: 1.5,
                              ),
                            ),
                      selectionControls: selectionControls,
                      contextMenuBuilder: contextMenuBuilder,
                    ),
                  ),
                  if (field.errorText != null)
                    _buildDefaultErrorMessage(
                      field.errorText!,
                      errorHighlightColor,
                      context,
                    ),
                ],
              ),
            );
          },
        );

  static Widget _buildDefaultErrorMessage(
    String errorText,
    Color? errorHighlightColor,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 2.0,
        start: 4.0,
        end: 2.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
          style: MacosTheme.of(context).typography.subheadline.copyWith(
              color: MacosColors.appleRed, fontWeight: FontWeight.bold),
          child: Text(errorText),
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
  _MacosTextFormField get widget => super.widget as _MacosTextFormField;

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
  void didUpdateWidget(_MacosTextFormField oldWidget) {
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
