import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/property.dart';
import '../../navigation/tab_view/tab_view.dart';
import '../base_text_field.dart';
import '../text_field/platforms/macos.dart';
import 'search_item.dart';

/// A custom text search field widget that adapts its appearance based on the platform.
///
/// Use this widget to create text search field  with platform-specific
/// styling and behavior:
/// - On macOS, [MacosSearchField] is utilized.
/// - On Windows, [AutoSuggestBox] is used.
final class AdaptiveTextSearchField<T> extends BaseTextField {
  /// An AdaptiveTextSearchField provides a list of suggestions for a user to select from
  /// as they type.
  ///
  /// See also:
  ///
  ///  * [AdaptiveTextField], which provides a versatile text input field.
  ///  * [AdaptiveTextFormField], a form field that wraps around AdaptiveTextField, enhancing it for form validation.
  ///  * [Overlay], which is used to show the suggestion popup
  const AdaptiveTextSearchField({
    super.key,
    super.builders,
    super.style,
    super.enabled,
    super.autofocus,
    super.controller,
    super.decoration,
    super.focusNode,
    super.placeholder,
    super.placeholderStyle,
    super.inputFormatters,
    super.onChanged,
    this.onSelected,
    this.emptyWidget,
    required this.suggestions,
  });

  /// Widget to show when the search returns no results.
  final Widget? emptyWidget;

  /// List of suggestions to be displayed in the search results.
  final List<AdaptiveSearchItem<T>> suggestions;

  /// Callback function called when the user selects a value from the search results.
  final ValueChanged<AdaptiveSearchItem<T>>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [super.build(context)],
    );
  }

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AutoSuggestBox<T>(
        style: style,
        focusNode: focusNode,
        decoration: decoration,
        controller: controller,
        autofocus: autofocus,
        inputFormatters: inputFormatters,
        placeholderStyle: placeholderStyle,
        onChanged: (text, reason) => onChanged?.call(text),
        placeholder: placeholder ?? FluentLocalizations.of(context).searchLabel,
        noResultsFoundBuilder:
            emptyWidget != null ? (context) => emptyWidget! : null,
        items: suggestions.map((e) => e.toWindows(context)).toList(),
        onSelected: (value) {
          onSelected?.call(AdaptiveSearchItem.fromAutoSuggestBoxItem(value));
        },
        enabled: enabled,
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return DecoratedBox(
      decoration: decoration?.copyWith(
            gradient: decoration?.gradient,
            border: decoration?.border,
            boxShadow: decoration?.boxShadow,
            backgroundBlendMode: decoration?.backgroundBlendMode,
            color: decoration?.color?.withOpacity(0.6),
            borderRadius: decoration?.borderRadius ??
                kDefaultRoundedBorderDecoration.borderRadius,
          ) ??
          const BoxDecoration(),
      child: MacosSearchField<T>(
        maxLines: 1,
        style: style,
        focusNode: focusNode,
        controller: controller,
        autofocus: autofocus,
        inputFormatters: inputFormatters,
        emptyWidget: emptyWidget ??
            Padding(
              padding: kContentPadding,
              child: Text(FluentLocalizations.of(context).noResultsFoundLabel),
            ),
        decoration: decoration != null
            ? null
            : kDefaultRoundedBorderDecoration,
        focusedDecoration:
            decoration != null ? null : kDefaultFocusedBorderDecoration,
        placeholderStyle: placeholderStyle ?? kDefaultPlaceholderStyle,
        placeholder:
            placeholder ?? MaterialLocalizations.of(context).searchFieldLabel,
        results: suggestions.map((e) => e.toMacos(context)).toList(),
        onResultSelected: (value) {
          onSelected?.call(AdaptiveSearchItem.fromSearchItem(value));
        },
        onChanged: onChanged,
        enabled: enabled,
      ),
    );
  }
}
