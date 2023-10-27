import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

class FlatButtonWindows extends StatelessWidget {
  final FlatButtonWindowsProperty? property;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback, [onLongPress], [onTapDown], and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  ///
  /// If this callback, [onPressed], [onTapDown] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Typically the button's label.
  ///
  /// Usually a [Text] widget
  final Widget child;

  final Color? color;
  final Color? disabledColor;

  const FlatButtonWindows({
    super.key,
    this.color,
    this.property,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: property?.focusNode,
      autofocus: property?.autofocus ?? false,
      focusable: property?.focusable ?? true,
      onTapDown: property?.onTapDown,
      onTapUp: property?.onTapUp,
      style: property?.style ??
          ButtonStyle(
            backgroundColor: color != null
                ? ButtonState.all<Color>(
                    (onPressed != null
                        ? color
                        : disabledColor ?? Colors.transparent)!,
                  )
                : null,
          ),
      child: child,
    );
  }
}

class FlatButtonWindowsProperty extends ButtonWindowsProperty {
  const FlatButtonWindowsProperty({
    super.onTapDown,
    super.onTapUp,
    super.style,
    super.autofocus,
    super.focusNode,
    super.focusable,
  });
}
