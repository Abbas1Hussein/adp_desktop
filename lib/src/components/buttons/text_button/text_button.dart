import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

class AdaptiveTextButton extends CoreAdaptiveComponent<TextButtonWindowsProperty, TextButtonMacosProperty> {
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

  const AdaptiveTextButton({
    super.key,
    super.builders,
    super.properties,
    this.onHover,
    this.onExit,
    this.cursor = MouseCursor.defer,
    this.onLongPress,
    this.onPressed,
    required this.child,
  });

  @override
  Widget windows(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onHover: onHover,
      onExit: onExit,
      child: TextButtonWindows(
        property: properties?.windows,
        onLongPress: onLongPress,
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onHover: onHover,
      onExit: onExit,
      child: TextButtonMacos(
        property: properties?.macos,
        onLongPress: onLongPress,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
