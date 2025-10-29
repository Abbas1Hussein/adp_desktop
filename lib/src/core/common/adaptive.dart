import 'package:flutter/foundation.dart';

import '../enum/target.dart';
import 'platform_ruining.dart';

/// Type definition for a function returning a generic value.
typedef Value<T> = T Function();

/// Handles platform configurations for desktop platforms,
/// returns the adaptive value based on the current platform.
///
/// Example:
/// ```dart
/// final result = adaptiveValue(
///   macos: () => MacosValue,
///   windows: () => WindowsValue,
///   web: () => WebValue,
/// );
/// ```
T adaptiveValue<T>({
  required Value<T> macos,
  required Value<T> windows,
  Value<T>? web,
}) {
  if (kIsWeb) {
    return web?.call() ?? _handleWebPlatform<T>(macos, windows);
  }

  if (defaultTargetPlatform == TargetPlatform.linux) {
    return _handleLinuxPlatform<T>(macos, windows);
  }

  return _handleDesktopPlatform<T>(macos, windows);
}

T _handleLinuxPlatform<T>(Value<T> macos, Value<T> windows) {
  if (kPlatformManager.targetLinux == DesktopTargetPlatform.windows) {
    return windows();
  } else {
    return macos();
  }
}

T _handleWebPlatform<T>(Value<T> macos, Value<T> windows) {
  if (kPlatformManager.targetWeb == DesktopTargetPlatform.windows) {
    return windows();
  } else {
    return macos();
  }
}

T _handleDesktopPlatform<T>(Value<T> macos, Value<T> windows) {
  switch (PlatformRuining.targetPlatform) {
    case DesktopTargetPlatform.windows:
      return windows();
    case DesktopTargetPlatform.macOS:
      return macos();
  }
}
