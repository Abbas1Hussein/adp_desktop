import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../properties/macos.dart';
class FlatButtonMacos extends StatelessWidget {
  final FlatButtonMacosProperty? property;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The color of the button's background.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  ///
  /// Ignored if the [PushButton] doesn't also have a [color].
  ///
  /// Defaults to [CupertinoColors.quaternarySystemFill] when [color] is
  /// specified. Must not be null.
  final Color? disabledColor;

  const FlatButtonMacos({
    super.key,
    this.color,
    this.property,
    this.disabledColor,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PushButton(
      onPressed: onPressed,
      controlSize: property?.controlSize ?? ControlSize.large,
      alignment: property?.alignment ?? Alignment.center,
      pressedOpacity: property?.pressedOpacity ?? 0.7,
      semanticLabel: property?.semanticLabel,
      borderRadius: property?.borderRadius,
      secondary: property?.secondary,
      disabledColor: disabledColor,
      padding: property?.padding,
      color: color,
      child: child,
    );
  }
}

class FlatButtonMacosProperty extends ButtonMacosProperty {
  const FlatButtonMacosProperty({
    super.controlSize,
    super.padding,
    super.pressedOpacity,
    super.borderRadius,
    super.alignment,
    super.semanticLabel,
    super.secondary,
  });
}