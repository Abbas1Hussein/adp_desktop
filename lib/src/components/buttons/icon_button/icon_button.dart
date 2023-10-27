import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

class AdaptiveIconButton extends CoreAdaptiveComponent<
    IconButtonWindowsProperty, IconButtonMacosProperty> {
  /// The widget to use as the icon.
  ///
  /// Typically an [AdaptiveIcon] widget.
  final Widget icon;

  final VoidCallback? onPressed;

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

  const AdaptiveIconButton({
    super.key,
    super.builders,
    super.properties,
    this.onExit,
    this.onHover,
    this.onPressed,
    this.cursor = MouseCursor.defer,
    required this.icon,
  });

  @override
  @mustCallSuper
  Widget macos(BuildContext context) {
    return MouseRegion(
      onExit: onExit,
      onHover: onHover,
      cursor: cursor,
      child: IconButtonMacos(
        icon: icon,
        onPressed: onPressed,
        property: properties?.macos,
      ),
    );
  }

  @override
  @mustCallSuper
  Widget windows(BuildContext context) {
    return MouseRegion(
      onExit: onExit,
      onHover: onHover,
      cursor: cursor,
      child: IconButtonWindows(
        icon: icon,
        onPressed: onPressed,
        property: properties?.windows,
      ),
    );
  }
}
