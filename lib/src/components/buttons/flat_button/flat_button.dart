import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom button widget that adapts its appearance based on the platform.
///
/// Use this widget to create buttons with platform-specific styling and behavior.
/// It supports macOS, Windows, Android, and iOS.
class AdaptiveFlatButton extends CoreAdaptiveComponent<
    FlatButtonWindowsProperty, FlatButtonMacosProperty> {
  final Widget child;

  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onBackTap] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Triggered when a pointer moves into a position within this widget without
  /// buttons pressed.
  final PointerHoverEventListener? onHover;

  /// Triggered when a mouse pointer has exited this widget when the widget is
  /// still mounted.
  final PointerExitEventListener? onExit;

  /// The mouse cursor for mouse pointers that are hovering over the region.
  /// The [cursor] defaults to [MouseCursor.defer], deferring the choice of
  /// cursor to the next region behind it in hit-test order.
  final MouseCursor cursor;

  /// The color of the button's background.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  final Color? disabledColor;

  const AdaptiveFlatButton({
    super.key,
    super.builders,
    super.properties,
    this.onHover,
    this.onExit,
    this.color,
    this.disabledColor,
    this.onPressed,
    this.onLongPress,
    this.cursor = MouseCursor.defer,
    required this.child,
  });

  @override
  Widget macos(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onHover: onHover,
      onExit: onExit,
      child: FlatButtonMacos(property: properties?.macos, child: child),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onHover: onHover,
      onExit: onExit,
      child: FlatButtonWindows(property: properties?.windows, child: child),
    );
  }
}
