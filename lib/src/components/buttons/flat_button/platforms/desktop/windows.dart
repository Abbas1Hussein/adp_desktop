import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

class FlatButtonWindows extends StatelessWidget {
  const FlatButtonWindows({
    super.key,
    this.color,
    this.padding,
    this.property,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
    this.borderRadius,
    required this.child,
  });

  /// customize the appearance of the FlatButtonWindows on windows.
  final FlatButtonWindowsProperty? property;

  /// The color of the FlatButtonWindows.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// The border radius to apply to the button.
  final BorderRadius? borderRadius;

  /// The padding to apply around the button's child content.
  final EdgeInsetsGeometry? padding;

  /// Callback triggered when the user tapped.
  final VoidCallback? onPressed;

  /// Callback triggered when the user performs a long press.
  final VoidCallback? onLongPress;

  /// Typically the button's label.
  ///
  /// Usually a [Text] widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    final shape = ButtonState.all(
      RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
      ),
    );

    final edgeInsetsGeometry = ButtonState.all(padding);

    return Button(
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: property?.focusNode,
      autofocus: property?.autofocus ?? false,
      focusable: property?.focusable ?? true,
      style: property?.style ??
          theme.buttonTheme.defaultButtonStyle?.copyWith(
            shape: shape,
            backgroundColor: _backgroundColor,
            padding: edgeInsetsGeometry,
          ) ??
          ButtonStyle(
            shape: shape,
            backgroundColor: _backgroundColor,
            padding: edgeInsetsGeometry,
          ),
      child: child,
    );
  }

  ButtonState<Color?>? get _backgroundColor {
    if (onPressed != null && onLongPress != null) {
      return ButtonState.all(color);
    }
    return ButtonState.all(disabledColor);
  }
}

class FlatButtonWindowsProperty extends ButtonWindowsProperty {
  const FlatButtonWindowsProperty({
    super.style,
    super.autofocus,
    super.focusNode,
    super.focusable,
  });
}
