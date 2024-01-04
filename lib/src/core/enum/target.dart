import 'package:flutter/foundation.dart';

import '../exception/platform_exceptions.dart';

enum DesktopTargetPlatform {
  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,
}

extension TargetPlatformEx on DesktopTargetPlatform {
  TargetPlatform get targetPlatform {
    switch (this) {
      case DesktopTargetPlatform.macOS:
        return TargetPlatform.macOS;
      case DesktopTargetPlatform.windows:
        return TargetPlatform.windows;
    }
  }
}

extension DesktopTargetPlatformEx on TargetPlatform {
  DesktopTargetPlatform get desktopTargetPlatform {
    switch (this) {
      case TargetPlatform.macOS:
        return DesktopTargetPlatform.macOS;
      case TargetPlatform.windows:
        return DesktopTargetPlatform.windows;

      default: throw UnsupportedPlatformException(name);
    }
  }
}

