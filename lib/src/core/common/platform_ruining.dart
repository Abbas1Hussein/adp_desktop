import 'package:flutter/foundation.dart';

import '../core.dart';
import '../enum/target.dart';

/// Instance of [DefaultsPlatformManager] for managing platform configurations.
final kPlatformManager = DefaultsPlatformManager.instance;

/// Helper class for platform-related checks and information retrieval.
abstract final class PlatformRuining {
  const PlatformRuining._();

  /// Check if the app is running on Debugging macOS.
  ///
  /// Returns true if [DefaultsPlatformManager._platform] is initialized with [DesktopTargetPlatform.macOS] and isDebugging is 'true'.
  /// Otherwise, returns false.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     DesktopTargetPlatform.macOS,
  ///     isDebugging: true,
  ///   );
  ///   runApp(const App());
  /// }
  static final isFakeMacos = _isTargetPlatform(DesktopTargetPlatform.macOS);

  /// Check if the app is running on Real macOS.
  ///
  /// Returns true if [DefaultsPlatformManager] is not initialized or initialized with isDebugging as 'false'.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     DesktopTargetPlatform.macOS,
  ///     isDebugging: false,
  ///   );
  ///   runApp(const App());
  /// }
  static final isRealMacos =
      !isWeb && _defaultTargetPlatform == TargetPlatform.macOS;

  /// Whether the app is running on either Real or Debugging macOS.
  static final isMacos = isRealMacos || isFakeMacos;

  /// Check if the app is running on Debugging Windows.
  ///
  /// Returns true if [DefaultsPlatformManager._platform] is initialized with [DesktopTargetPlatform.windows] and isDebugging is 'true'.
  /// Otherwise, returns false.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     DesktopTargetPlatform.windows,
  ///     isDebugging: true,
  ///   );
  ///   runApp(const App());
  /// }
  static final isFakeWindows = _isTargetPlatform(DesktopTargetPlatform.windows);

  /// Check if the app is running on Real Windows.
  ///
  /// Returns true if [DefaultsPlatformManager._platform] is not initialized or initialized with isDebugging as 'false'.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   DefaultsPlatformManager.initialize(
  ///     DesktopTargetPlatform.windows,
  ///     isDebugging: false,
  ///   );
  ///   runApp(const App());
  /// }
  static final isRealWindows =
      !isWeb && _defaultTargetPlatform == TargetPlatform.windows;

  /// Whether the app is running on either Real or Debugging Windows.
  static final isWindows = isRealWindows || isFakeWindows;

  /// Whether the application is running on the web platform.
  static const isWeb = kIsWeb;

  /// Retrieve the current platform from [DefaultsPlatformManager], or use the default if it's null.
  static final targetPlatform = _debugDesktopTargetPlatform ??
      _defaultTargetPlatform.desktopTargetPlatform;

  /// The default target platform when not in debugging mode.
  static final _defaultTargetPlatform = defaultTargetPlatform;

  /// Whether the app is currently in debugging mode.
  static final isDebugging =
      kPlatformManager != null && kPlatformManager!.isDebugging;

  /// The target platform when in debugging mode, obtained from [kPlatformManager]. Null if not in debugging mode.
  static final _debugDesktopTargetPlatform =
      isDebugging ? kPlatformManager!.targetPlatform : null;

  /// Check if the current or target platforms match the specified platform.
  static bool _isTargetPlatform(DesktopTargetPlatform platform) {
    if (isWeb) {
      return kPlatformManager?.targetWeb == platform;
    }

    if (_defaultTargetPlatform == TargetPlatform.linux) {
      return kPlatformManager?.targetLinux == platform;
    }

    return _debugDesktopTargetPlatform == platform;
  }
}
