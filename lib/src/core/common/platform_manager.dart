import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../enum/target.dart';

/// Manages default configurations for the desktop platform.
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
  factory DefaultsPlatformManager.initialize({
    required DesktopTargetPlatform targetPlatform,
    DesktopTargetPlatform? targetLinux,
    DesktopTargetPlatform? targetWeb,
    bool isDebugging = true,
    @visibleForTesting bool isTesting = false,
  }) {
    assert(_instance == null, 'DefaultsPlatformManager is already initialized.');

    if (!kIsWeb && !isTesting) {
      _initializeWindowConfiguration();
    }

    return _instance = DefaultsPlatformManager._(
      targetPlatform,
      targetWeb: targetWeb,
      targetLinux: targetLinux,
      isDebugging: isDebugging,
    );
  }

  /// Initializes window configuration for the application.
  ///
  /// Hides the default title bar.
  static Future<void> _initializeWindowConfiguration() async {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(titleBarStyle: TitleBarStyle.hidden);
    await windowManager.waitUntilReadyToShow(windowOptions);
    await windowManager.show();
  }

  /// the debugging status for the application.
  bool get isDebugging => _isDebugging;

  /// the desktop target platform for the application.
  DesktopTargetPlatform get targetPlatform => _platform;

  /// the target Linux platform or defaults to [targetPlatform] if not specified.
  DesktopTargetPlatform get targetLinux => _targetLinux ?? _platform;

  /// the target web platform or defaults to [targetPlatform] if not specified.
  DesktopTargetPlatform get targetWeb => _targetWeb ?? _platform;

  /// Gets the singleton instance of DefaultsPlatformManager.
  ///
  /// Throws an error if the manager is not initialized.
  static DefaultsPlatformManager get instance {
    assert(_instance != null, 'DefaultsPlatformManager is not initialized.');
    return _instance!;
  }
}
