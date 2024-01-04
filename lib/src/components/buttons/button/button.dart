import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'base_button.dart';
import 'platforms/macos.dart';

class AdaptiveButton extends AdaptiveBaseButton {
  const AdaptiveButton({
    super.builders,
    super.key,
    super.border,
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
  }) : type = AdaptiveButtonType.base;

  const AdaptiveButton.filled({
    super.builders,
    super.key,
    super.border,
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
  }) : type = AdaptiveButtonType.filled;

  const AdaptiveButton.outlined({
    super.builders,
    super.key,
    super.border,
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
  }) : type = AdaptiveButtonType.outlined;

  final AdaptiveButtonType type;

  @override
  Widget windows(BuildContext context) {
    Widget? button;

    switch (type) {
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
  Widget macos(BuildContext context) {
    final theme = MacosTheme.of(context);
    switch (type) {
      case AdaptiveButtonType.base:
        return MacosButton(
          border: border,
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
          border: border,
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onPressed: onPressed,
          onLongPress: onLongPress,
          mouseCursor: mouseCursor,
          pressedOpacity: 0.6,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          disabledColor: disabledColor ?? CupertinoColors.secondaryLabel,
          backgroundColor: backgroundColor ?? theme.primaryColor,
          pressedColor: pressedColor ?? theme.primaryColor.withOpacity(0.6),
          hoverColor: hoverColor ?? theme.primaryColor.withOpacity(0.6),
          child: DefaultTextStyle(
            style: theme.typography.body.copyWith(
              color:
                  CupertinoDynamicColor.resolve(CupertinoColors.white, context),
            ),
            child: child,
          ),
        );
      case AdaptiveButtonType.outlined:
        return MacosButton(
          border: border ??
              Border.all(
                width: 1.5,
                color: theme.brightness.resolve(CupertinoColors.black,
                    CupertinoColors.extraLightBackgroundGray),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
          borderRadius: BorderRadius.circular(2),
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
            style: theme.typography.body
                .copyWith(fontWeight: MacosFontWeight.w510),
            child: child,
          ),
        );
    }
  }
}

enum AdaptiveButtonType { base, filled, outlined }
