import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../enum/target.dart';

abstract class CorePlatforms<WINDOWS, MACOS> {
  const CorePlatforms({this.windows, this.macos});

  final WINDOWS? windows;
  final MACOS? macos;
}

/// Manages the default platform settings for a Flutter desktop application.
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
/// ```
class DefaultsPlatformManager {
  const DefaultsPlatformManager._(
    this._platform, {
    DesktopTargetPlatform? targetLinux,
    DesktopTargetPlatform? targetWeb,
    bool isDebugging = false,
  })  : _targetLinux = targetLinux,
        _targetWeb = targetWeb,
        _isDebugging = isDebugging;

  final bool _isDebugging;
  final DesktopTargetPlatform _platform;
  final DesktopTargetPlatform? _targetLinux;
  final DesktopTargetPlatform? _targetWeb;

  static DefaultsPlatformManager? _instance;

  /// Initializes the DefaultsPlatformManager with the specified parameters.
  ///
  /// - [isTesting] is only for testing.
  ///
  /// Throws an error if the manager is already initialized.
  factory DefaultsPlatformManager.initialize(
    DesktopTargetPlatform platform, {
    DesktopTargetPlatform? targetLinux,
    DesktopTargetPlatform? targetWeb,
    bool isDebugging = false,
    @visibleForTesting bool isTesting = false,
  }) {
    if (_instance != null) {
      throw StateError('DefaultsPlatformManager is already initialized.');
    }
    if (!kIsWeb && !isTesting) {
      _initializeWindowConfiguration();
    }

    return _instance = DefaultsPlatformManager._(
      platform,
      targetWeb: targetWeb,
      targetLinux: targetLinux,
      isDebugging: isDebugging,
    );
  }

  /// Initializes window configuration for the application.
  ///
  /// hiding defaults TitleBar.
  static Future<void> _initializeWindowConfiguration() async {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
    });
  }

  /// Gets the desktop target platform for the application.
  DesktopTargetPlatform get desktopTargetPlatform => _platform;

  /// Gets the target Linux platform or defaults to Windows if not specified.
  DesktopTargetPlatform get targetLinux =>
      _targetLinux ?? DesktopTargetPlatform.windows;

  /// Gets the target web platform or defaults to Windows if not specified.
  DesktopTargetPlatform get targetWeb =>
      _targetWeb ?? DesktopTargetPlatform.windows;

  /// Gets the debugging status for the application.
  bool get isDebugging => _isDebugging;

  /// Gets the singleton instance of DefaultsPlatformManager.
  ///
  /// Throws an error if the manager is not initialized.
  static DefaultsPlatformManager? get instance {
    if (_instance == null) {
      throw StateError('DefaultsPlatformManager is not initialized.');
    }
    return _instance;
  }
}
