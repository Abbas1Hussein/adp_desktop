import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../properties/macos.dart';

const _defaultsIconBoxConstraints = BoxConstraints(
  minHeight: 20,
  minWidth: 20,
  maxWidth: 30,
  maxHeight: 30,
);

class IconButtonMacos extends StatelessWidget {
  final IconButtonMacosProperty? property;

  /// The widget to use as the icon.
  ///
  /// Typically an [Icon] widget.
  final Widget icon;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The mouse cursor to use when hovering over this widget.
  final MouseCursor? mouseCursor;

  const IconButtonMacos({
    super.key,
    this.property,
    this.onPressed,
    this.mouseCursor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MacosIconButton(
      icon: icon,
      onPressed: onPressed,
      padding: property?.padding,
      hoverColor: property?.hoverColor,
      borderRadius: property?.borderRadius,
      semanticLabel: property?.semanticLabel,
      disabledColor: property?.disabledColor,
      pressedOpacity: property?.pressedOpacity,
      backgroundColor: property?.backgroundColor,
      shape: property?.shape ?? BoxShape.rectangle,
      alignment: property?.alignment ?? Alignment.center,
      mouseCursor: mouseCursor ?? SystemMouseCursors.basic,
      boxConstraints: property?.boxConstraints ?? _defaultsIconBoxConstraints,
    );
  }
}

class IconButtonMacosProperty extends ButtonMacosProperty {
  /// The background color of this [MacosIconButton].
  ///
  /// Defaults to [CupertinoColors.activeBlue]. Set to [Colors.transparent] for
  /// a transparent background color.
  final Color? backgroundColor;

  /// The color of the button's background when the button is disabled.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  ///
  /// Set to Colors.transparent to disable the hover effect.
  final Color? hoverColor;

  /// The shape to make the button.
  ///
  /// Defaults to `BoxShape.rectangle`.
  final BoxShape? shape;

  /// The border radius for the button.
  ///
  /// This should only be set if setting [shape] to `BoxShape.rectangle`.
  ///
  /// Defaults to `BorderRadius.circular(7.0)`.
  final BorderRadius? borderRadius;

  /// The box constraints for the button.
  ///
  /// Defaults to
  /// ```dart
  /// const BoxConstraints(
  ///   minHeight: 20,
  ///   minWidth: 20,
  ///   maxWidth: 30,
  ///   maxHeight: 30,
  /// ),
  ///```
  final BoxConstraints? boxConstraints;

  const IconButtonMacosProperty({
    super.padding,
    super.alignment,
    super.pressedOpacity,
    super.semanticLabel,
    super.secondary,
    this.shape,
    this.backgroundColor,
    this.disabledColor,
    this.hoverColor,
    this.borderRadius,
    this.boxConstraints,
  }) : super(borderRadius: borderRadius);
}
