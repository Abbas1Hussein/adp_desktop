import 'dart:ui';

import 'package:adp_desktop/adp_desktop.dart';

/// adaptive brightness for different platforms.
class AdaptiveBrightness {
  static Brightness of(BuildContext context) {
    return adaptiveValue(
      macos: () => MacosTheme.brightnessOf(context),
      windows: () => FluentTheme.of(context).brightness,
    );
  }
}

extension AdaptiveBrightnessEx on Brightness {
  /// whether the brightness is dark.
  bool get isDark => this == Brightness.dark;

  /// checks whether the brightness is light.
  bool get isLight => !isDark;
}

extension ContextEx on BuildContext {
  /// adaptive brightness using the AdaptiveBrightness class.
  Brightness get brightness => AdaptiveBrightness.of(this);
}
