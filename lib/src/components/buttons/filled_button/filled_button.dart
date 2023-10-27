import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom filled button widget that adapts its appearance based on the platform.
///
/// Use this widget to create filled buttons that have platform-specific
/// styling and behavior. It supports macOS, Windows, Android, and iOS.
class AdaptiveFilledButton extends CoreAdaptiveComponent<
    FilledButtonWindowsProperty, FilledButtonMacosProperty> {
  final Widget child;

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
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

  const AdaptiveFilledButton({
    super.key,
    super.builders,
    super.properties,
    this.cursor = MouseCursor.defer,
    this.onExit,
    this.onHover,
    this.onLongPress,
    this.onPressed,
    required this.child,
  });

  @mustCallSuper
  @override
  Widget macos(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onExit: onExit,
      onHover: onHover,
      child: FilledButtonMacos(
        property: properties?.macos,
        onLongPress: onLongPress,
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  @mustCallSuper
  @override
  Widget windows(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onExit: onExit,
      onHover: onHover,
      child: FilledButtonWindows(
        property: properties?.windows,
        onLongPress: onLongPress,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
