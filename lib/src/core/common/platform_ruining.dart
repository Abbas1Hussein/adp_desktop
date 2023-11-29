import 'package:flutter/foundation.dart';

import '../core.dart';
import '../enum/target.dart';

/// instance of [DefaultsPlatformManager] for managing platform configurations.
final kPlatformManager = DefaultsPlatformManager.instance;

abstract final class PlatformRuining {
  const PlatformRuining._();

  /// Check if the app is running on Debugging macOS.
  ///
  /// Returns true if [DefaultsPlatformManager] is initialized with [DesktopTargetPlatform.macOS] and isDebugging is 'true'.
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
      !kIsWeb && _defaultTargetPlatform == TargetPlatform.macOS;

  /// Check if the app is running on Debugging Windows.
  ///
  /// Returns true if [DefaultsPlatformManager] is initialized with [DesktopTargetPlatform.windows] and isDebugging is 'true'.
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
  /// Returns true if [DefaultsPlatformManager] is not initialized or initialized with isDebugging as 'false'.
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
      !kIsWeb && _defaultTargetPlatform == TargetPlatform.windows;

  /// Retrieve the current platform from [DefaultsPlatformManager], or use the default if it's null.
  static final targetPlatform = _debugDesktopTargetPlatform ??
      _defaultTargetPlatform.desktopTargetPlatform;

  /// The default target platform when not in debugging mode.
  static final _defaultTargetPlatform = defaultTargetPlatform;

  /// Indicates whether the app is currently in debugging mode.
  static final isDebugging =
      kPlatformManager != null && kPlatformManager!.isDebugging;

  /// The target platform when in debugging mode, obtained
  ///
  /// from [kPlatformManager]. Null if not in debugging mode.
  static final _debugDesktopTargetPlatform =
      isDebugging ? kPlatformManager!.desktopTargetPlatform : null;

  /// check if the current or target platforms match the specified platform.
  static bool _isTargetPlatform(DesktopTargetPlatform platform) {
    if (kIsWeb) {
      return kPlatformManager?.targetWeb == platform;
    }

    if (_defaultTargetPlatform == TargetPlatform.linux) {
      return kPlatformManager?.targetLinux == platform;
    }

    return _debugDesktopTargetPlatform == platform;
  }
}
