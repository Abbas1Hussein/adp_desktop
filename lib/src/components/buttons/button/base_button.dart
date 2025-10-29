import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/component.dart';

abstract class AdaptiveBaseButton extends CoreAdaptiveComponent {
  const AdaptiveBaseButton({
    super.builders,
    super.key,
    this.shape,
    this.onTapUp,
    this.onTapDown,
    this.onLongPress,
    this.hoverColor,
    this.pressedColor,
    this.disabledColor,
    this.backgroundColor,
    this.mouseCursor = SystemMouseCursors.click,
    required this.child,
    required this.onPressed,
  });

  /// The child widget to be displayed within the button.
  final Widget child;

  /// The color of the button when it is being hovered over by the mouse.
  final Color? hoverColor;

  /// The color of the button when it is being pressed.
  final Color? pressedColor;

  /// The background color of the button in its normal state.
  final Color? backgroundColor;

  /// The background color of the button when it is disabled.
  final Color? disabledColor;

  final ShapeBorder? shape;

  /// The mouse cursor to use when hovering over this widget.
  final MouseCursor mouseCursor;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback, [onLongPress], [onTapDown], and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is pressed.
  ///
  /// If this callback, [onLongPress], [onPressed] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onTapDown;

  /// Called when the button is released.
  ///
  /// If this callback, [onLongPress], [onPressed] and [onTapDown] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onTapUp;

  /// Called when the button is long-pressed.
  ///
  /// If this callback, [onPressed], [onTapDown] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled =>
      onPressed != null ||
      onLongPress != null ||
      onTapDown != null ||
      onTapUp != null;

  ButtonStyle windowsDefaultStyle() {
    return ButtonStyle(
      shape: WidgetStateProperty.all(shape),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => WidgetStateExtension.forStates(
          states,
          pressed: pressedColor,
          hovering: hoverColor,
          disabled: disabledColor,
          none: backgroundColor,
        ),
      ),
    );
  }
}
