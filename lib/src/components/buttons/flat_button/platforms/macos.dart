import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/platform_ruining.dart';
import '../../properties/macos.dart';

class FlatButtonMacos extends StatelessWidget {
  const FlatButtonMacos({
    super.key,
    this.color,
    this.property,
    this.disabledColor,
    this.onLongPress,
    this.onPressed,
    required this.child,
  });

  /// customize the appearance of the button on macOS.
  final FlatButtonMacosProperty? property;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The color of the button's background.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  ///
  /// Ignored if the [PushButton] doesn't also have a [color].
  ///
  /// Defaults to [CupertinoColors.quaternarySystemFill] when [color] is
  /// specified. Must not be null.
  final Color? disabledColor;

  /// if [onPressed] or [onLongPress] callback is not null.
  ///
  /// This getter is used to determine whether the button should respond to user interactions.
  bool get enabled => onPressed != null || onLongPress != null;

  /// Returns true if the current platform is not macOS.
  ///
  /// This getter is used to conditionally apply a foreground decoration
  /// to the button's container when the platform is not macOS.
  ///
  /// Note: This is particularly useful during testing on a non-Mac device
  /// to provide a near-realistic experience.
  bool get isNotRunningOnMacOS => PlatformRuining.isFakeMacos;

  /// Calculates and returns the appropriate BorderRadius based on the control size.
  ///
  /// The BorderRadius is determined by the control size specified in the [property].
  /// If no control size is provided, the default is set to [ControlSize.large].
  ///
  /// The returned BorderRadius is used for styling the button's background.
  BorderRadiusGeometry? get borderRadius {
    return property?.controlSize?.borderRadius ??
        const BorderRadius.all(Radius.circular(4.0));
  }

  @override
  Widget build(BuildContext context) {
    final theme = MacosTheme.of(context);

    final backgroundColor = enabled ? color : disabledColor;

    return GestureDetector(
      onLongPress: enabled ? onLongPress : null,
      child: Container(
        foregroundDecoration: isNotRunningOnMacOS
            ? BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
                backgroundBlendMode: backgroundColor != null ? BlendMode.color : null,
              )
            : null,
        child: PushButton(
          borderRadius: borderRadius,
          onPressed: enabled ? (onPressed ?? () {}) : null,
          controlSize: property?.controlSize ?? ControlSize.large,
          alignment: property?.alignment ?? Alignment.center,
          semanticLabel: property?.semanticLabel,
          secondary: property?.secondary,
          disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
          color: color ?? theme.primaryColor,
          child: child,
        ),
      ),
    );
  }
}

class FlatButtonMacosProperty extends ButtonMacosProperty {
  const FlatButtonMacosProperty({
    super.controlSize,
    super.alignment,
    super.semanticLabel,
    super.secondary,
  });
}
