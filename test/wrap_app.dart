import 'package:adp_desktop/adp_desktop.dart';

/// Determines the target desktop platform based on the 'platform' environment variable.
///
/// If the environment variable is set to 'macos', returns [DesktopTargetPlatform.macOS].
/// If it is set to 'windows', returns [DesktopTargetPlatform.windows].
DesktopTargetPlatform getTargetPlatformFromEnvironment() {
  const targetPlatform = String.fromEnvironment('platform');

  /// Throws an [UnimplementedError] if running a single test and the 'platform' parameter
  /// on [initializeDesktopDefaultsTests] is not provided.
  if (targetPlatform.isEmpty) {
    throw UnimplementedError(
      'Please specify the target platform using initializeDesktopDefaultsTests when running a single test.',
    );
  }
  switch (targetPlatform) {
    case 'macos':
      return DesktopTargetPlatform.macOS;
    case 'windows':
      return DesktopTargetPlatform.windows;
  }

  /// Throws a [UnimplementedError] if the 'platform' environment variable is not set to a valid value.
  throw UnimplementedError(
    'Please run the tests with the appropriate platform specified.\n'
    'Run: flutter test --dart-define=platform="macos" or flutter test --dart-define=platform="windows"',
  );
}

/// Initializes default settings for desktop tests.
///
/// If testing a single file, must provide the [platform] parameter to specify
/// the target platform.
///
/// If testing multiple files, the target platform is
/// determined from the 'platform' environment variable using [getTargetPlatformFromEnvironment].
void initializeDesktopDefaultsTests([DesktopTargetPlatform? platform]) {
  final targetPlatform = platform ?? getTargetPlatformFromEnvironment();
  DefaultsPlatformManager.initialize(
    targetPlatform: targetPlatform,
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
