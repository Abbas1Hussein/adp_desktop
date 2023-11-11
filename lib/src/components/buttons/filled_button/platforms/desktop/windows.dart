import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

class FilledButtonWindows extends StatelessWidget {
  const FilledButtonWindows({
    super.key,
    this.property,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
    this.backgroundColor,
    required this.padding,
    required this.borderRadius,
    required this.child,
  });

  /// customize the appearance of the button on Windows.
  final FilledButtonWindowsProperty? property;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Color to be used when the button is in a disabled state.
  final Color? disabledColor;

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// Callback when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The child widget to be displayed within the button.
  final Widget child;

  /// The border radius to apply to the button.
  final BorderRadius borderRadius;

  /// The padding to apply around the button's child content.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    final border = ButtonState.all(
      RoundedRectangleBorder(borderRadius: borderRadius),
    );

    final edgeInsetsGeometry = ButtonState.all(padding);

    return FilledButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: property?.style ??
          theme.buttonTheme.filledButtonStyle?.copyWith(
            backgroundColor: _backgroundColor,
            shape: border,
            padding: edgeInsetsGeometry,
          ) ??
          ButtonStyle(
            backgroundColor: _backgroundColor,
            shape: border,
            padding: edgeInsetsGeometry,
          ),
      focusable: property?.focusable ?? true,
      autofocus: property?.autofocus ?? false,
      focusNode: property?.focusNode,
      child: child,
    );
  }

  ButtonState<Color?>? get _backgroundColor {
    if (onPressed != null && onLongPress != null) {
      return ButtonState.all(backgroundColor);
    }
    return ButtonState.all(disabledColor);
  }
}

class FilledButtonWindowsProperty extends ButtonWindowsProperty {
  const FilledButtonWindowsProperty({
    super.style,
    super.autofocus,
    super.focusNode,
    super.focusable,
  });
}
