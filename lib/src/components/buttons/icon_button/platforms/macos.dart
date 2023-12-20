import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../properties/macos.dart';

const _kMacosIconBoxConstraints = BoxConstraints(
  minHeight: 20,
  minWidth: 20,
  maxWidth: 30,
  maxHeight: 30,
);

class IconButtonMacos extends StatelessWidget {
  const IconButtonMacos({
    super.key,
    this.property,
    this.onPressed,
    this.disabledColor,
    this.hoverColor,
    this.color,
    this.padding,
    this.constraints,
    this.borderRadius,
    required this.icon,
  });

  final IconButtonMacosProperty? property;

  /// The widget to use as the icon.
  ///
  /// Typically an [Icon] widget.
  final Widget icon;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The color of this [IconButtonMacos].
  ///
  /// Defaults to [CupertinoColors.activeBlue]. Set to [Colors.transparent] for
  /// a transparent background color.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  final Color? hoverColor;

  /// The border radius for the button.
  ///
  /// This should only be set if setting [shape] to `BoxShape.rectangle`.
  ///
  /// Defaults to `BorderRadius.circular(7.0)`.
  final BorderRadius? borderRadius;

  /// The internal padding for the button's [icon].
  ///
  /// Defaults to `EdgeInsets.all(8)`.
  final EdgeInsetsGeometry? padding;

  /// The additional constraints to impose on the child.
  ///
  /// Default to [_kMacosIconBoxConstraints].
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return MacosIconButton(
      icon: icon,
      padding: padding,
      onPressed: onPressed,
      backgroundColor: color,
      borderRadius: borderRadius,
      disabledColor: disabledColor?.withOpacity(0.6),
      hoverColor: hoverColor ?? color?.withOpacity(0.8),
      semanticLabel: property?.semanticLabel,
      pressedOpacity: property?.pressedOpacity ?? 0.4,
      shape: property?.shape ?? BoxShape.rectangle,
      alignment: property?.alignment ?? Alignment.center,
      boxConstraints: constraints ?? _kMacosIconBoxConstraints,
    );
  }
}

class IconButtonMacosProperty extends ButtonMacosProperty {
  const IconButtonMacosProperty({
    super.alignment,
    super.pressedOpacity,
    super.semanticLabel,
    this.shape,
  });

  /// The shape to make the button.
  ///
  /// Defaults to `BoxShape.rectangle`.
  final BoxShape? shape;
}
