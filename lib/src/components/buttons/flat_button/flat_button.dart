import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom button widget that adapts its appearance based on the platform.
///
/// Use this widget to create buttons with platform-specific styling and behavior.
/// It supports macOS, Windows, Android, and iOS.
class AdaptiveFlatButton extends CoreAdaptiveComponent<FlatButtonWindowsProperty, FlatButtonMacosProperty> {
  const AdaptiveFlatButton({
    super.key,
    super.builders,
    super.properties,
    this.color,
    this.disabledColor,
    this.onPressed,
    this.onLongPress,
    required this.child,
  });

  final Widget child;

  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The color of the button's background.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  final Color? disabledColor;

  @override
  Widget macos(BuildContext context) {
    return FlatButtonMacos(property: properties?.macos, child: child);
  }

  @override
  Widget windows(BuildContext context) {
    return FlatButtonWindows(property: properties?.windows, child: child);
  }
}
