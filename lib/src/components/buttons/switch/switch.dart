import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';
import 'platforms/platforms.dart';

/// A custom switch widget that adapts its appearance based on the platform.
///
/// Use this widget to create switch controls that have platform-specific
/// styling and behavior. It supports macOS, Windows, Android, and iOS.
class AdaptiveSwitch extends CoreAdaptiveComponent<SwitchWindowsProperty, SwitchMacosProperty> {
  /// Additional content to display alongside the switch.
  final Widget? content;

  /// The current value of the switch.
  final bool value;

  /// Callback function called when the switch's value changes.
  final ValueChanged<bool>? onChanged;

  const AdaptiveSwitch({
    super.key,
    super.builders,
    super.properties,
    this.content,
    this.onChanged,
    required this.value,
  });


  @mustCallSuper
  @override
  Widget macos(BuildContext context) {
    return SwitchMacos(
      value: value,
      onChanged: onChanged,
      property: properties?.macos,
    ).margeWith(content);
  }

  @mustCallSuper
  @override
  Widget windows(BuildContext context) {
    return SwitchWindows(
      checked: value,
      content: content,
      onChanged: onChanged,
      property: properties?.windows,
    );
  }
}

