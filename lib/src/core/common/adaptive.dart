import 'package:flutter/foundation.dart';

import '../enum/target.dart';
import 'platform_ruining.dart';

typedef Value<T> = T Function();

/// Returns the adaptive value based on the current platform.
T adaptiveValue<T>({required Value<T> macos, required Value<T> windows}) {
  if (kIsWeb) {
    return _handleWebPlatform<T>(macos, windows);
  }

  if (defaultTargetPlatform == TargetPlatform.linux) {
    return _handleLinuxPlatform<T>(macos, windows);
  }

  return _handleDesktopPlatform<T>(macos, windows);
}

/// Handle specific Linux platform configuration [TargetLinux].
///
/// Example:
///   DefaultsPlatformManager.initialize(
///     DesktopTargetPlatform.windows,
///     targetLinux: DesktopTargetPlatform.macOS,
///   );
/// When running Linux components, it will use the `macOS` design.
/// If no specific Linux platform is configured, it retrieves [windows].
T _handleLinuxPlatform<T>(Value<T> macos, Value<T> windows) {
  if (kPlatformManager?.targetLinux == DesktopTargetPlatform.windows) {
    return windows();
  } else {
    return macos();
  }
}

/// Handle specific web platform configuration [DesktopTargetPlatform].
/// Example:
///   DefaultsPlatformManager.initialize(
///     DesktopTargetPlatform.windows,
///     targetWeb: DesktopTargetPlatform.macOS,
///   );
/// When running web components, it will use the `macOS` design.
/// If no specific web platform is configured, it retrieves [windows].
T _handleWebPlatform<T>(Value<T> macos, Value<T> windows) {
  if (kPlatformManager?.targetWeb == DesktopTargetPlatform.windows) {
    return windows();
  } else {
    return macos();
  }
}

/// Handle platform configurations for platforms desktop, other than Linux.
/// It returns an adaptive value based on the current platform.
///
/// Parameters:
///   - macos: A function that provides the value for macOS platform (req).
///   - windows: A function that provides the value for Windows platform (req).
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
