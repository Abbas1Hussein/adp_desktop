import 'package:fluent_ui/fluent_ui.dart';

import '../../../buttons.dart';

class TextButtonWindows extends StatelessWidget {
  const TextButtonWindows({
    super.key,
    this.property,
    this.color,
    this.disabledColor,
    this.onPressed,
    this.onLongPress,
    required this.child,
  });

  /// customize the appearance of the TextButton on windows.
  final TextButtonWindowsProperty? property;

  /// The color of the TextButton.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// Callback triggered when the user tapped.
  final VoidCallback? onPressed;

  /// Callback triggered when the user performs a long press.
  final VoidCallback? onLongPress;

  /// The child widget displayed within the TextButtonWindows.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    return HyperlinkButton(
      onLongPress: onLongPress,
      focusNode: property?.focusNode,
      autofocus: property?.autofocus ?? false,
      focusable: property?.focusable ?? true,
      style: property?.style ??
          theme.buttonTheme.filledButtonStyle?.copyWith(
            backgroundColor: _backgroundColor,
            foregroundColor: ButtonState.all(disabledColor?.withOpacity(0.8)),
          ) ??
          ButtonStyle(
            backgroundColor: _backgroundColor,
            foregroundColor: ButtonState.all(disabledColor?.withOpacity(0.8)),
          ),
      onPressed: onPressed,
      child: child,
    );
  }

  ButtonState<Color?>? get _backgroundColor {
    if (onPressed != null && onLongPress != null) {
      return ButtonState.all(color);
    }
    return null;
  }
}

class TextButtonWindowsProperty extends ButtonWindowsProperty {
  const TextButtonWindowsProperty({
    super.style,
    super.autofocus,
    super.focusNode,
    super.focusable,
  });
}
