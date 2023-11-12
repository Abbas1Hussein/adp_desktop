import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

class FlatButtonWindows extends StatelessWidget {
  const FlatButtonWindows({
    super.key,
    this.color,
    this.property,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
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
    return Button(
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: property?.focusNode,
      autofocus: property?.autofocus ?? false,
      focusable: property?.focusable ?? true,
      style: property?.style ??
          theme.buttonTheme.defaultButtonStyle?.copyWith(
            backgroundColor: _backgroundColor,
          ) ??
          ButtonStyle(backgroundColor: _backgroundColor),
      child: child,
    );
  }

  ButtonState<Color?>? get _backgroundColor {
    return ButtonState.resolveWith(
      (states) => ButtonState.forStates(
        states,
        none: color,
        disabled: disabledColor,
      ),
    );
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
