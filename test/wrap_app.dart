import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

/// Determines the target desktop platform based on the 'platform' environment variable.
///
/// If the environment variable is set to 'macos', returns [DesktopTargetPlatform.macOS].
/// If it is set to 'windows', returns [DesktopTargetPlatform.windows].
///
/// Throws a [StateError] if the 'platform' environment variable is not set to a valid value.
DesktopTargetPlatform getTargetPlatformFromEnvironment() {
  const platform = String.fromEnvironment('platform');

  switch (platform) {
    case 'macos':
      return DesktopTargetPlatform.macOS;
    case 'windows':
      return DesktopTargetPlatform.windows;
  }

  throw StateError(
    'Error: Please run the tests with the appropriate platform specified.\n'
    'Usage: flutter test --dart-define=platform="macos" or flutter test --dart-define=platform="windows"',
  );
}

/// Initializes default settings for desktop tests.
///
/// If [platform] is provided, uses it as the target platform; otherwise, determines
/// the platform from the 'platform' environment variable using [getTargetPlatformFromEnvironment].
/// Initializes [DefaultsPlatformManager] with the chosen platform, enabling debugging
/// and testing modes.
void initializeDesktopDefaultsTests([DesktopTargetPlatform? platform]) {
  final targetPlatform = getTargetPlatformFromEnvironment();
  DefaultsPlatformManager.initialize(
    platform ?? targetPlatform,
    isDebugging: true,
    isTesting: true,
  );
}

/// Wraps the provided [child] widget with an adaptive app configuration.
///
/// The adaptive app includes configurations for macOS and Windows platforms.
Widget wrapApp({required Widget child}) {
  return AdpApp(
    home: child,
    themeMode: ThemeMode.dark,
    titleBarConfig: AdaptiveTitleBarConfig(mode: TitleBarMode.hidden),
    properties: Properties(
      macos: AppMacosProperty(
        darkTheme: MacosThemeData.dark(),
        theme: MacosThemeData.light(),
      ),
      windows: AppWindowsProperty(
        darkTheme: FluentThemeData.dark(),
        theme: FluentThemeData.light(),
      ),
    ),
  );
}

/// Wraps the provided [child] widget with an adaptive scaffold configuration.
///
/// The adaptive scaffold includes configurations for macOS and Windows platforms.
Widget wrapAppWithScaffold({
  required Widget child,
}) {
  return wrapApp(child: AdaptiveScaffoldPage(content: child));
}