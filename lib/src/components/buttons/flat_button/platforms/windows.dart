import 'package:fluent_ui/fluent_ui.dart';

import '../../../../core/common/construct/property.dart';

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
    return FilledButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: property?.focusNode,
      autofocus: property?.autofocus ?? false,
      focusable: property?.focusable ?? true,
      style: property?.style ??
          ButtonStyle(backgroundColor: _backgroundColor).merge(theme.buttonTheme.defaultButtonStyle),
      child: DefaultTextStyle(style: theme.typography.body!, child: child),
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

class FlatButtonWindowsProperty extends CoreWindowsProperty {
  const FlatButtonWindowsProperty({
    this.style,
    this.focusNode,
    this.focusable = true,
    this.autofocus = false,
  });

  /// Customizes the visual style of this button.
  final ButtonStyle? style;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// An optional [FocusNode] that can be used to control the focus behavior of this button.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  /// If true, this button will automatically request focus when the widget is first built.
  final bool autofocus;

  /// If false, this button is not focusable.
  final bool focusable;
}
