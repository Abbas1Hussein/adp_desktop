import 'package:flutter/cupertino.dart';

import '../../../properties/macos.dart';

class FilledButtonMacos extends StatelessWidget {
  final FilledButtonMacosProperty? property;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;


  const FilledButtonMacos({
    super.key,
    this.property,
    this.onPressed,
    this.onLongPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: CupertinoButton.filled(
        minSize: property?.minSize,
        padding: property?.padding,
        pressedOpacity: property?.pressedOpacity ?? 0.7,
        alignment: property?.alignment ?? Alignment.center,
        borderRadius: property?.borderRadius ?? BorderRadius.circular(8.0),
        disabledColor: property?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class FilledButtonMacosProperty extends ButtonMacosProperty {
  /// Minimum size of the button.
  ///
  /// Defaults to kMinInteractiveDimensionCupertino which the iOS Human
  /// Interface Guidelines recommends as the minimum tappable area.
  final double? minSize;

  /// The color of the button's background when the button is disabled.
  final Color? disabledColor;

  final BorderRadius? borderRadius;

  const FilledButtonMacosProperty({
    this.minSize,
    this.borderRadius,
    this.disabledColor,
    super.padding,
    super.pressedOpacity,
    super.alignment,
    super.secondary,
  }) : super(borderRadius: borderRadius);
}
