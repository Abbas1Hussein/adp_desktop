import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../components/additional/typography.dart';
import '../common/adaptive.dart';

/// Extension for adding additional functionality to the BuildContext.
extension DesktopContextEx on BuildContext {
  BuildContext get _context => this;

  /// Get the AdpTypography from the current context.
  AdaptiveTypography get typography => AdaptiveTypography.of(_context);

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

  /// Check if the brightness is set to dark.
  bool get isDark => brightness == Brightness.dark;

  /// Check if the brightness is set to light.
  bool get isLight => brightness == Brightness.light;
}
