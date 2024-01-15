import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/property.dart';
import 'base_button.dart';
import 'macos.dart';

/// An adaptive button that adjusts its appearance based on the platform.
///
/// This widget provides three variants:
/// - [AdaptiveButtonType.base]: A standard adaptive button.
/// - [AdaptiveButtonType.filled]: A filled adaptive colored button.
/// - [AdaptiveButtonType.outlined]: An outlined adaptive button with a border.
class AdaptiveButton extends AdaptiveBaseButton {
  /// Creates an instance of [AdaptiveButton] with the base type.
  const AdaptiveButton({
    super.builders,
    super.key,
    super.shape,
    super.onTapUp,
    super.onTapDown,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.child,
    required super.onPressed,
  }) : _type = AdaptiveButtonType.base;

  /// Creates an instance of [AdaptiveButton] with the filled type.
  const AdaptiveButton.filled({
    super.builders,
    super.key,
    super.shape,
    super.onTapUp,
    super.onTapDown,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.child,
    required super.onPressed,
  }) : _type = AdaptiveButtonType.filled;

  /// Creates an instance of [AdaptiveButton] with the outlined type.
  const AdaptiveButton.outlined({
    super.builders,
    super.key,
    super.shape,
    super.onTapUp,
    super.onTapDown,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.child,
    required super.onPressed,
  }) : _type = AdaptiveButtonType.outlined;

  /// The type of the adaptive button, determining its visual style.
  final AdaptiveButtonType _type;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    Widget? button;

    switch (_type) {
      case AdaptiveButtonType.base:
        button = Button(
          style: windowsDefaultStyle(),
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: child,
        );
      case AdaptiveButtonType.filled:
        button = FilledButton(
          style: windowsDefaultStyle(),
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: child,
        );

      case AdaptiveButtonType.outlined:
        button = OutlinedButton(
          style: windowsDefaultStyle(),
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: child,
        );
    }

    return MouseRegion(
      cursor: enabled ? mouseCursor : SystemMouseCursors.forbidden,
      child: button,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final theme = MacosTheme.of(context);
    switch (_type) {
      case AdaptiveButtonType.base:
        return MacosButton(
          shape: shape,
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          hoverColor: hoverColor,
          mouseCursor: mouseCursor,
          onLongPress: onLongPress,
          pressedColor: pressedColor,
          disabledColor: disabledColor,
          backgroundColor: backgroundColor,
          child: child,
        );
      case AdaptiveButtonType.filled:
        return MacosButton(
          shape: shape,
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          pressedOpacity: 0.6,
          disabledColor: disabledColor ?? CupertinoColors.secondaryLabel,
          backgroundColor: backgroundColor ?? theme.primaryColor,
          pressedColor: pressedColor ?? theme.primaryColor.withOpacity(0.6),
          hoverColor: hoverColor ?? theme.primaryColor.withOpacity(0.6),
          child: DefaultTextStyle(
            style: theme.typography.body.copyWith(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.white,
                context,
              ),
            ),
            child: child,
          ),
        );
      case AdaptiveButtonType.outlined:
        return MacosButton(
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(
              width: 1.5,
              color: theme.brightness.resolve(
                CupertinoColors.black,
                CupertinoColors.extraLightBackgroundGray,
              ),
              strokeAlign: BorderSide.strokeAlignOutside,
            )
          ),
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
          pressedOpacity: 0.7,
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          disabledColor: disabledColor,
          backgroundColor: backgroundColor,
          pressedColor: pressedColor,
          hoverColor: hoverColor,
          child: DefaultTextStyle(
            style: theme.typography.body.copyWith(
              fontWeight: MacosFontWeight.w510,
            ),
            child: child,
          ),
        );
    }
  }
}

/// different types of [AdaptiveButton] variants.
enum AdaptiveButtonType {
  /// The base type represents a standard adaptive button.
  base,

  /// The filled type represents a filled adaptive button with colored styling.
  filled,

  /// The outlined type represents an outlined adaptive button with a border.
  outlined,
}
