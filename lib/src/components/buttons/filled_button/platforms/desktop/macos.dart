import 'package:flutter/cupertino.dart';

import '../../../properties/macos.dart';

class FilledButtonMacos extends StatelessWidget {
  const FilledButtonMacos({
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

  /// customize the appearance of the button on macOS.
  final FilledButtonMacosProperty? property;

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// Callback when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The child widget to be displayed within the button.
  final Widget child;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Color to be used when the button is in a disabled state.
  final Color? disabledColor;

  /// The border radius to apply to the button.
  final BorderRadius borderRadius;

  /// The padding to apply around the button's child content.
  final EdgeInsetsGeometry padding;

  /// Whether the button is enabled or disabled.
  ///
  /// Buttons are disabled by default. To enable a button, set its [onPressed],
  /// [onLongPress], [onTapDown] or [onTapUp] properties to a non-null value.
  bool get enabled => onPressed != null || onLongPress != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(
          primaryColor: backgroundColor,
        ),
        child: CupertinoButton.filled(
          minSize: property?.minSize,
          padding: padding,
          pressedOpacity: property?.pressedOpacity ?? 0.7,
          alignment: property?.alignment ?? Alignment.center,
          borderRadius: borderRadius,
          disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
          onPressed: onPressed ?? (enabled ? () {} : null),
          child: child,
        ),
      ),
    );
  }
}

class FilledButtonMacosProperty extends ButtonMacosProperty {
  const FilledButtonMacosProperty({
    super.pressedOpacity,
    super.alignment,
    super.secondary,
    this.minSize,
  });

  /// Minimum size of the button.
  ///
  /// Defaults to kMinInteractiveDimensionCupertino which the iOS Human
  /// Interface Guidelines recommends as the minimum tappable area.
  final double? minSize;
}
