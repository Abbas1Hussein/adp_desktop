import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';

/// A checkbox is a type of button that lets the user choose between
/// two opposite states, actions, or values. A selected checkbox is
/// considered on when it contains a checkmark and off when it's empty.
/// A checkbox is almost always followed by a title unless it appears in
/// a checklist.
///
/// Use this widget to create checkbox buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosCheckbox] is utilized.
/// - On Windows, [Checkbox] is used.
class AdaptiveCheckbox extends CoreAdaptiveComponent {
  /// Creates a adp-style checkbox.
  ///
  /// * [AdaptiveRadioButton], let users select one option from a collection of two or more mutually exclusive, visible options.
  const AdaptiveCheckbox({
    Key? key,
    this.label,
    this.value,
    this.onChanged,
    this.checkedColor,
    this.semanticLabel,
    this.uncheckedColor,
    this.uncheckedBorderColor,
  }) : super(key: key);

  /// The current value of the AdaptiveCheckbox (true for checked, false for unchecked).
  ///
  /// - If `null`, the checkbox is in its third state.
  final bool? value;

  /// Called when the value of the [AdaptiveCheckbox] should change.
  ///
  /// This callback passes a new value, but doesn't update its
  /// state internally.
  ///
  /// If null, the checkbox is considered disabled.
  final ValueChanged<bool?>? onChanged;

  /// The label of the adp radio button.
  ///
  /// This, if non-null, is displayed at the right of the checkbox,
  /// and is affected by user touch.
  ///
  /// Usually a [Text] or [Icon] widget.
  final Widget? label;

  /// Color to use when the checkbox is checked.
  final Color? checkedColor;

  /// Color to use when the checkbox is unchecked.
  ///
  /// On macOS platform, this color will be used when the [onChanged] callback is null.
  final Color? uncheckedColor;

  /// Color of the AdaptiveCheckbox border when unchecked.
  ///
  /// On macOS platform, this color will be used when the [onChanged] callback is null.
  final Color? uncheckedBorderColor;

  /// Semantic label for accessibility.
  final String? semanticLabel;


  bool get _enabled => onChanged != null;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final checkboxTheme = CheckboxThemeData.standard(FluentTheme.of(context));

    final BorderRadiusGeometry radius = BorderRadius.circular(6.0);

    return Checkbox(
      checked: value,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      style: CheckboxThemeData(
        checkedDecoration: _enabled
            ? ButtonState.all(
            BoxDecoration(color: checkedColor, borderRadius: radius))
            : checkboxTheme.checkedDecoration,
        uncheckedDecoration: _enabled && uncheckedColor != null
            ? ButtonState.all(
          BoxDecoration(
            color: uncheckedColor,
            borderRadius: radius,
            border: Border.all(
              color: uncheckedBorderColor ?? Colors.transparent,
            ),
          ),
        )
            : checkboxTheme.uncheckedDecoration,
        padding: checkboxTheme.padding,
        margin: checkboxTheme.margin,
        thirdstateDecoration: checkboxTheme.thirdstateDecoration,
        thirdstateIconColor: checkboxTheme.thirdstateIconColor,
        foregroundColor: checkboxTheme.foregroundColor,
        checkedIconColor: checkboxTheme.checkedIconColor,
        uncheckedIconColor: checkboxTheme.uncheckedIconColor,
        icon: checkboxTheme.icon,
      ),
      content: label,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: MacosCheckbox(
        size: 18.0,
        value: value,
        onChanged: onChanged,
        activeColor: checkedColor,
        disabledColor: uncheckedColor ?? CupertinoColors.quaternaryLabel,
        offBorderColor: uncheckedBorderColor ?? CupertinoColors.tertiaryLabel,
        semanticLabel: semanticLabel,
      ),
    ).margeWith(
          label != null
              ? GestureDetector(
                  onTap: _enabled
                      ? () => onChanged!(!(value != null && value!))
                      : null,
                  child: label,
                )
              : null,
          4.0,
        ).applyDisabledEffect(!_enabled);
  }

}
