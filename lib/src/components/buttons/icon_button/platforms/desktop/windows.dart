import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

const _kWindowsIconBoxConstraints = BoxConstraints(
  minHeight: 20,
  minWidth: 20,
  maxWidth: 30,
  maxHeight: 30,
);

class IconButtonWindows extends StatelessWidget {
  const IconButtonWindows({
    super.key,
    this.property,
    this.color,
    this.disabledColor,
    this.hoverColor,
    this.onPressed,
    this.padding,
    this.constraints,
    this.borderRadius,
    required this.icon,
  });

  /// customize the appearance of the IconButtonWindows on windows.
  final IconButtonWindowsProperty? property;

  /// The widget to use as the icon.
  ///
  /// Typically an [Icon] widget.
  final Widget icon;

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The color of the IconButtonWindows.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  final Color? hoverColor;

  /// The border radius to apply to the button.
  final BorderRadius? borderRadius;

  /// The padding to apply around the button's child content.
  final EdgeInsetsGeometry? padding;

  /// The additional constraints to impose on the child.
  ///
  /// Default to [_kWindowsIconBoxConstraints].
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    final shape = ButtonState.all(
      RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
      ),
    );

    final edgeInsetsGeometry = ButtonState.all(padding);

    return ConstrainedBox(
      constraints: constraints ?? _kWindowsIconBoxConstraints,
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        style: property?.style ??
            theme.buttonTheme.iconButtonStyle?.copyWith(
              shape: shape,
              backgroundColor: _backgroundColor,
              padding: edgeInsetsGeometry,
            ) ??
            ButtonStyle(
              shape: shape,
              backgroundColor: _backgroundColor,
              padding: edgeInsetsGeometry,
            ),
        focusable: property?.focusable ?? true,
        autofocus: property?.autofocus ?? false,
        focusNode: property?.focusNode,
        iconButtonMode: property?.iconButtonMode,
      ),
    );
  }

  ButtonState<Color?>? get _backgroundColor {
    return ButtonState.resolveWith(
      (states) => ButtonState.forStates(
        states,
        none: color,
        disabled: disabledColor,
        hovering: hoverColor ?? color?.withOpacity(0.8),
        pressed: hoverColor?.withOpacity(0.6) ?? color?.withOpacity(0.6),
      ),
    );
  }
}

class IconButtonWindowsProperty extends ButtonWindowsProperty {
  const IconButtonWindowsProperty({
    super.style,
    super.focusable,
    super.autofocus,
    super.focusNode,
    this.iconButtonMode,
  });

  /// How this icon button will behave.
  ///
  /// If null, this may be affected by a [SmallIconButton] in the tree, if any.
  /// If null and without a [SmallIconButton], defaults to large.
  final IconButtonMode? iconButtonMode;
}
