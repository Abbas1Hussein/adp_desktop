import 'package:flutter/foundation.dart';
enum AdaptiveTargetPlatform {
  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,
}

TargetPlatform defaultAdaptiveTargetPlatform(AdaptiveTargetPlatform platform) {
  switch (platform) {
    case AdaptiveTargetPlatform.macOS:
      return TargetPlatform.macOS;
    case AdaptiveTargetPlatform.windows:
      return TargetPlatform.windows;
  }
}
