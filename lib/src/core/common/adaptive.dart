import 'package:flutter/foundation.dart';

import '../enum/target.dart';
import 'platform_ruining.dart';

/// Type definition for a function returning a generic value.
typedef Value<T> = T Function();

/// Returns the adaptive value based on the current platform.
///
/// Parameters:
///   - macos: A function providing the value for macOS platform (required).
///   - windows: A function providing the value for Windows platform (required).
///   - web: A function providing the value for the web platform (optional).
///
/// Returns:
///   - The adaptive value based on the current platform.
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

/// Handles specific Linux platform configurations [TargetLinux].
///
/// Example:
/// ```dart
/// DefaultsPlatformManager.initialize(
///   DesktopTargetPlatform.windows,
///   targetLinux: DesktopTargetPlatform.macOS,
/// );
/// ```
/// When running Linux components, it will use the `macOS` design.
/// If no specific Linux platform is configured, it retrieves [windows].
T _handleLinuxPlatform<T>(Value<T> macos, Value<T> windows) {
  if (kPlatformManager?.targetLinux == DesktopTargetPlatform.windows) {
    return windows();
  } else {
    return macos();
  }
}

/// Handles specific web platform configurations [DesktopTargetPlatform].
///
/// Example:
/// ```dart
/// DefaultsPlatformManager.initialize(
///   DesktopTargetPlatform.windows,
///   targetWeb: DesktopTargetPlatform.macOS,
/// );
/// ```
/// When running web components, it will use the `macOS` design.
/// If no specific web platform is configured, it retrieves [windows].
T _handleWebPlatform<T>(Value<T> macos, Value<T> windows) {
  if (kPlatformManager?.targetWeb == DesktopTargetPlatform.windows) {
    return windows();
  } else {
    return macos();
  }
}

/// Handles platform configurations for desktop platforms other than Linux.
/// Returns an adaptive value based on the current platform.
///
/// Parameters:
///   - macos: A function providing the value for macOS platform (required).
///   - windows: A function providing the value for Windows platform (required).
///
/// Returns:
///   - The adaptive value based on the current platform.
///
/// Throws:
///   - UnsupportedPlatformException if the current platform is not recognized.
T _handleDesktopPlatform<T>(Value<T> macos, Value<T> windows) {
  switch (PlatformRuining.targetPlatform) {
    case DesktopTargetPlatform.windows:
      return windows();
    case DesktopTargetPlatform.macOS:
      return macos();
  }
}
