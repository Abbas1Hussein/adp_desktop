import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../properties/macos.dart';

const _kMiniButtonRadius = BorderRadius.all(Radius.circular(2.0));
const _kSmallButtonRadius = BorderRadius.all(Radius.circular(2.0));
const _kRegularButtonRadius = BorderRadius.all(Radius.circular(5.0));
const _kLargeButtonRadius = BorderRadius.all(Radius.circular(7.0));

class FlatButtonMacos extends StatelessWidget {
  const FlatButtonMacos({
    super.key,
    this.color,
    this.property,
    this.disabledColor,
    this.onLongPress,
    this.onPressed,
    this.borderRadius,
    this.padding,
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

  /// The border radius to apply to the button.
  final BorderRadius? borderRadius;

  /// The padding to apply around the button's child content.
  final EdgeInsetsGeometry? padding;

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
  bool get isNotRunningOnMacOS => defaultTargetPlatform != TargetPlatform.macOS;

  /// Calculates and returns the appropriate BorderRadius based on the control size.
  ///
  /// The BorderRadius is determined by the control size specified in the [property].
  /// If no control size is provided, the default is set to [ControlSize.large].
  ///
  /// The returned BorderRadius is used for styling the button's background.
  BorderRadius get radius {
    switch (property?.controlSize ?? ControlSize.large) {
      case ControlSize.small:
        return _kSmallButtonRadius;
      case ControlSize.mini:
        return _kMiniButtonRadius;
      case ControlSize.regular:
        return _kRegularButtonRadius;
      case ControlSize.large:
        return _kLargeButtonRadius;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = MacosTheme.of(context);
    return GestureDetector(
      onLongPress: enabled ? onLongPress : null,
      child: Container(
        foregroundDecoration: isNotRunningOnMacOS
            ? BoxDecoration(
                backgroundBlendMode: BlendMode.color,
                color: enabled
                    ? color ?? theme.primaryColor
                    : disabledColor ?? CupertinoColors.label,
                borderRadius: property?.borderRadius ?? radius,
              )
            : null,
        child: PushButton(
          onPressed: onPressed ?? (enabled ? () {} : null),
          controlSize: property?.controlSize ?? ControlSize.large,
          alignment: property?.alignment ?? Alignment.center,
          semanticLabel: property?.semanticLabel,
          borderRadius: borderRadius ?? radius,
          secondary: property?.secondary,
          disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
          padding: padding,
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
