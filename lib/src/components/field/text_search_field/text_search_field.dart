import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import 'search_item.dart';

class AdaptiveTextSearchField<T> extends CoreAdaptiveComponent {
  const AdaptiveTextSearchField({
    super.key,
    super.builders,
    this.controller,
    this.onSelected,
    this.decoration,
    this.focusNode,
    this.enabled = true,
    this.autofocus = false,
    this.placeholder,
    this.placeholderStyle,
    this.inputFormatters,
    this.foregroundDecoration,
    this.emptyWidget,
    required this.suggestions,
  });

  final List<AdaptiveSearchItem<T>> suggestions;

  /// Called when the user selected a value.
  final ValueChanged<AdaptiveSearchItem<T>>? onSelected;

  /// Widget to show when the search returns no results.
  final Widget? emptyWidget;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// Specifies the `TextEditingController` for [MacosSearchField].
  final TextEditingController? controller;

  /// Controls the [BoxDecoration] of the box behind the text input.
  final BoxDecoration? decoration;

  /// Controls the [BoxDecoration] of the box in front of the text input.
  ///
  /// If [highlightColor] is provided, this must not be provided
  final BoxDecoration? foregroundDecoration;

  /// A lighter colored placeholder hint that appears on the first line of the
  /// text field when the text entry is empty.
  ///
  /// Defaults to having no placeholder text.
  ///
  /// The text style of the placeholder text matches that of the text field's
  /// main text entry except a lighter font weight and a grey font color.
  final String? placeholder;

  /// The style to use for the placeholder text.
  ///
  /// The [placeholderStyle] is merged with the [style] [TextStyle] when applied
  /// to the [placeholder] text. To avoid merging with [style], specify
  /// [TextStyle.inherit] as false.
  ///
  /// Defaults to the [style] property with w300 font weight and grey color.
  ///
  /// If specifically set to null, placeholder's style will be the same as [style].
  final TextStyle? placeholderStyle;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text box is enabled
  final bool enabled;



  @override
  Widget macos(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MacosSearchField(
          controller: controller,
          autofocus: autofocus,
          focusNode: focusNode,
          emptyWidget: emptyWidget ?? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  FluentLocalizations.of(context).noResultsFoundLabel,
                ),
              ),
          decoration: decoration ?? kDefaultRoundedBorderDecoration,
          placeholder: placeholder ?? MaterialLocalizations.of(context).searchFieldLabel,
          placeholderStyle: placeholderStyle ?? const TextStyle(
                fontWeight: FontWeight.w400,
                color: CupertinoColors.placeholderText,
              ),
          focusedDecoration: foregroundDecoration ?? kDefaultFocusedBorderDecoration,
          inputFormatters: inputFormatters,
          results: suggestions.map((e) => e.toSearchItem()).toList(),
          onResultSelected: (value) {
            onSelected?.call(AdaptiveSearchItem.fromSearchItem(value));
          },
          enabled: enabled,
        ),
      ],
    );
  }

  @override
  Widget windows(BuildContext context) {
    return AutoSuggestBox(
      controller: controller,
      autofocus: autofocus,
      focusNode: focusNode,
      decoration: decoration,
      placeholder: placeholder ?? MaterialLocalizations.of(context).searchFieldLabel,
      placeholderStyle: placeholderStyle,
      foregroundDecoration: foregroundDecoration,
      inputFormatters: inputFormatters,
      noResultsFoundBuilder: emptyWidget != null ? (context) => emptyWidget! : null,
      items: suggestions.map((e) => e.toAutoSuggestBoxItem()).toList(),
      onSelected: (value) {
        onSelected?.call(AdaptiveSearchItem.fromAutoSuggestBoxItem(value));
      },
      enabled: enabled,
    );
  }
}
