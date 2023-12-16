import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';

/// Initializes desktop default configurations.
void initializeDesktopDefaults([
  DesktopTargetPlatform? platform,
]) {
  DefaultsPlatformManager.initialize(
    platform ?? DesktopTargetPlatform.macOS,
    isDebugging: true,
  );
}

Widget wrapApp({required Widget child}) {
  return AdpApp(home: child);
}

Widget wrapAppWithScaffold({
  required Widget child,
}) {
  return wrapApp(child: AdaptiveScaffold(body: child));
}
