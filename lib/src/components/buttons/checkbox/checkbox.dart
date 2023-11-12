import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';

/// A custom checkbox button widget that adapts its appearance based on the platform.
///
/// Use this widget to create checkbox buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosCheckbox] is utilized.
/// - On Windows, [Checkbox] is used.
class AdaptiveCheckbox extends CoreAdaptiveComponent {
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
  /// - If `null`:
  ///  - On macOS, the checkbox it is considered mixed.
  ///  - On Windows, the checkbox is in its third state.
  final bool? value;

  /// Callback function invoked when the AdaptiveCheckbox value changes.
  final ValueChanged<bool?>? onChanged;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// Label widget associated with the AdaptiveCheckbox.
  final Widget? label;

  /// Color to use when the AdaptiveCheckbox is checked.
  final Color? checkedColor;

  /// Color to use when the AdaptiveCheckbox is unchecked.
  ///
  /// On macOS platform, this color will be used when the [onChanged] callback is null.
  final Color? uncheckedColor;

  /// Color of the AdaptiveCheckbox border when unchecked.
  ///
  /// On macOS platform, this color will be used when the [onChanged] callback is null.
  final Color? uncheckedBorderColor;

  @override
  Widget macos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: MacosCheckbox(
        value: value,
        onChanged: onChanged,
        activeColor: checkedColor,
        disabledColor: uncheckedColor ?? CupertinoColors.quaternaryLabel,
        offBorderColor: uncheckedBorderColor ?? CupertinoColors.tertiaryLabel,
        semanticLabel: semanticLabel,
      ),
    ).margeWith(label);
  }

  @override
  Widget windows(BuildContext context) {
    final checkboxTheme = CheckboxThemeData.standard(FluentTheme.of(context));

    final BorderRadiusGeometry radius = BorderRadius.circular(6.0);

    return Checkbox(
      checked: value,
      onChanged: onChanged,
      semanticLabel: semanticLabel,
      style: CheckboxThemeData(
        checkedDecoration: checkedColor != null
            ? ButtonState.all(
                BoxDecoration(color: checkedColor, borderRadius: radius))
            : checkboxTheme.checkedDecoration,
        uncheckedDecoration: onChanged != null && uncheckedColor != null
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
}
