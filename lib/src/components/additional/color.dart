import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/adaptive.dart';

abstract final class AdpColors {
  const AdpColors._();

  static const Color black = Colors.black;

  static const Color white = Colors.white;

  static final Color green =
      _dynamic(macosColor: MacosColors.appleGreen, fluentColor: Colors.green);

  static final Color red =
      _dynamic(macosColor: MacosColors.appleRed, fluentColor: Colors.red);

  static final Color blue =
      _dynamic(macosColor: MacosColors.appleBlue, fluentColor: Colors.blue);

  static final Color yellow =
      _dynamic(macosColor: MacosColors.appleYellow, fluentColor: Colors.yellow);

  static final Color orange =
      _dynamic(macosColor: MacosColors.appleOrange, fluentColor: Colors.orange);

  static final Color purple =
      _dynamic(macosColor: MacosColors.applePurple, fluentColor: Colors.purple);

  static final Color gray = _dynamic(
      macosColor: MacosColors.systemGrayColor, fluentColor: Colors.grey);

  static final Color teal = _dynamic(
      macosColor: MacosColors.systemTealColor, fluentColor: Colors.teal);

  static final Color cyan = _dynamic(
      macosColor: MacosColors.appleCyan, fluentColor: Colors.teal.lighter);

  static final Color magenta = _dynamic(
      macosColor: MacosColors.systemPinkColor, fluentColor: Colors.magenta);

  /// Returns the adaptive color for the current platform.
  ///
  /// * [fluentColor]: The color to use on Windows.
  /// * [macosColor]: The color to use on macOS.
  static Color _dynamic({
    required Color fluentColor,
    required Color macosColor,
  }) =>
      adaptiveValue<Color>(windows: () => fluentColor, macos: () => macosColor);
}

Color handelBackgroundColor(Color? color, BuildContext context) {
  return adaptiveValue<Color>(
    macos: () {
      if (color != null) {
        return MacosDynamicColor.resolve(color, context);
      } else {
        return MacosTheme.brightnessOf(context).resolve(
          CupertinoColors.white,
          CupertinoColors.darkBackgroundGray,
        );
      }
    },
    windows: () {
      return color ??
          FluentTheme.of(context).resources.solidBackgroundFillColorBase;
    },
  );
}
