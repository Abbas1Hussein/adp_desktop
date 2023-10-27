import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';
import 'platforms/platforms.dart';

/// A custom radio button widget that adapts its appearance based on the platform.
///
/// Use this widget to create radio buttons that have platform-specific
/// styling and behavior. It supports macOS, Windows, Android, and iOS.
class AdaptiveRadio extends CoreAdaptiveComponent<RadioWindowsProperty, RadioMacosProperty> {
  /// The current value of the radio button.
  final bool value;

  /// The value that represents the selected radio button in a group.
  final bool? groupValue;

  /// Additional content to display alongside the radio button.
  final Widget? content;

  /// Callback function called when the radio button's value changes.
  final ValueChanged<bool?>? onChanged;

  const AdaptiveRadio({
    super.key,
    super.builders,
    super.properties,
    this.content,
    this.onChanged,
    this.groupValue,
    required this.value,
  });

  @override
  Widget macos(BuildContext context) {
    return RadioMacos(
      value: value,
      onChanged: onChanged,
      groupValue: groupValue,
    ).margeWith(content);
  }

  @override
  Widget windows(BuildContext context) {
    return RadioWindows(
      checked: value,
      onChanged: onChanged,
      content: content,
    );
  }
}
