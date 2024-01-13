import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

/// You must run tests on macOS and Windows.
const kDefaultTestTargetPlatform = DesktopTargetPlatform.windows;

void initializeDesktopDefaultsTests([DesktopTargetPlatform? platform]) {
  DefaultsPlatformManager.initialize(
    platform ?? kDefaultTestTargetPlatform,
    isDebugging: true,
    isTesting: true,
  );
}

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

Widget wrapAppWithScaffold({
  required Widget child,
}) {
  return wrapApp(child: AdaptiveScaffoldPage(content: child));
}
