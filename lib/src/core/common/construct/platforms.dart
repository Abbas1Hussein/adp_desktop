import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../enum/target.dart';

abstract class CorePlatforms<WINDOWS, MACOS> {
  const CorePlatforms({this.windows, this.macos});

  final WINDOWS? windows;
  final MACOS? macos;
}

/// To test your app with a specific platform, initialize [DefaultsPlatformManager] and set isDebugging to true.
///
/// Example usage:
/// ```dart
/// void main() async {
///   DefaultsPlatformManager.initialize(
///     DesktopTargetPlatform.windows,
///     isDebugging: true,
///   );
///   runApp(const App());
///
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

  factory DefaultsPlatformManager.initialize(
    DesktopTargetPlatform platform, {
    DesktopTargetPlatform? targetLinux,
    DesktopTargetPlatform? targetWeb,
    bool isDebugging = false,
  }) {
    _initWindowCong();
    return _instance ??= DefaultsPlatformManager._(
      platform,
      targetLinux: targetLinux,
      targetWeb: targetWeb,
      isDebugging: isDebugging,
    );
  }

  static Future<void> _initWindowCong() async {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  DesktopTargetPlatform get desktopTargetPlatform => _platform;

  DesktopTargetPlatform get targetLinux =>
      _targetLinux ?? DesktopTargetPlatform.windows;

  DesktopTargetPlatform get targetWeb =>
      _targetWeb ?? DesktopTargetPlatform.windows;

  bool get isDebugging => _isDebugging;

  static DefaultsPlatformManager? get instance => _instance;
}
