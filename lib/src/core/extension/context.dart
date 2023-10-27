import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../components/additional/typography.dart';
import '../common/adaptive.dart';

/// Extension for adding additional functionality to the BuildContext.
extension DesktopContextEx on BuildContext {
  BuildContext get _context => this;

  /// Get the AdpTypography from the current context.
  AdpTypography get typography => AdpTypography.of(_context);

  /// Get the MacosTheme from the current context.
  MacosThemeData get macosTheme => MacosTheme.of(_context);

  /// Get the FluentTheme from the current context.
  FluentThemeData get windowsTheme => FluentTheme.of(_context);

  /// Get the brightness (light/dark) from the theme.
  Brightness? get brightness {
    return adaptiveValue<Brightness>(
      macos: () => macosTheme.brightness,
      windows: () => windowsTheme.brightness,
    );
  }

  /// Get the platform (windows, macos, linux) from the theme.
  TargetPlatform get platform => kPlatformRuining;

  /// Check if the brightness is set to dark.
  bool get isDark => brightness == Brightness.dark;

  /// Check if the brightness is set to light.
  bool get isLight => brightness == Brightness.light;

  /// Check if the platform is macOS.
  bool get isMacos => platform == TargetPlatform.macOS;

  /// Check if the platform is Windows.
  bool get isWindows => platform == TargetPlatform.windows;

  /// Check if the platform is Linux.
  bool get isLinux => platform == TargetPlatform.linux;
}
