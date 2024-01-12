import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';

void initializeDesktopDefaultsTests([DesktopTargetPlatform? platform]) {
  DefaultsPlatformManager.initialize(
    platform ?? DesktopTargetPlatform.macOS,
    isDebugging: true,
    isTesting: true,
  );
}

Widget wrapApp({required Widget child}) {
  return AdpApp(home: child);
}

Widget wrapAppWithScaffold({
  required Widget child,
}) {
  return wrapApp(child: AdaptiveScaffoldPage(content: child));
}
