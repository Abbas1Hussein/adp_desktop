import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';
import 'macos_checkbox.dart';

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
  /// See also:
  ///
  /// * [AdaptiveRadioButton], let users select one option from a collection of two or more mutually exclusive, visible options.
  const AdaptiveCheckbox({
    super.key,
    super.builders,
    this.label,
    this.icon,
    this.semanticLabel,
    this.foregroundColor,
    this.checkedIconColor,
    this.uncheckedIconColor,
    this.thirdstateIconColor,
    this.checkedDecoration,
    this.uncheckedDecoration,
    this.thirdstateDecoration,
    required this.value,
    required this.onChanged,
  });

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
  final ValueChanged<bool>? onChanged;

  /// The icon displayed in the checkbox when it's checked
  final IconData? icon;

  /// The label of the adp radio button.
  ///
  /// This, if non-null, is displayed at the right of the checkbox,
  /// and is affected by user touch.
  ///
  /// Usually a [Text].
  final Widget? label;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// The color of the [label] of the checkbox.
  final Color? foregroundColor;

  /// The color of the [icon] when the checkbox is checked
  final Color? checkedIconColor;

  /// The color of the [icon] when the checkbox is unchecked
  final Color? uncheckedIconColor;

  /// The color of the [icon] when the checkbox is in its third state
  final Color? thirdstateIconColor;

  /// The decoration of the checkbox when it's checked
  final Decoration? checkedDecoration;

  /// The decoration of the checkbox when it's unchecked and disabled.
  final Decoration? uncheckedDecoration;

  /// The decoration of the checkbox when it's in its third state
  final Decoration? thirdstateDecoration;


  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return Checkbox(
      checked: value,
      content: label,
      onChanged: onChanged != null ? (value) => onChanged?.call(value == true): null,
      semanticLabel: semanticLabel,
      style: CheckboxThemeData(
        icon: icon,
        foregroundColor:
            foregroundColor != null ? ButtonState.all(foregroundColor) : null,
        checkedIconColor:
            checkedIconColor != null ? ButtonState.all(checkedIconColor) : null,
        uncheckedIconColor: uncheckedIconColor != null
            ? ButtonState.all(uncheckedIconColor)
            : null,
        thirdstateIconColor: thirdstateIconColor != null
            ? ButtonState.all(thirdstateIconColor)
            : null,
        checkedDecoration: checkedDecoration != null
            ? ButtonState.all(checkedDecoration)
            : null,
        uncheckedDecoration: uncheckedDecoration != null
            ? ButtonState.all(uncheckedDecoration)
            : null,
        thirdstateDecoration: thirdstateDecoration != null
            ? ButtonState.all(thirdstateDecoration)
            : null,
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return CustomMacosCheckbox(
      icon: icon,
      value: value,
      label: label,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      foregroundColor: foregroundColor,
      checkedIconColor: checkedIconColor,
      uncheckedIconColor: uncheckedIconColor,
      thirdstateIconColor: thirdstateIconColor,
      checkedDecoration: checkedDecoration,
      uncheckedDecoration: uncheckedDecoration,
      thirdstateDecoration: thirdstateDecoration,
    );
  }
}
