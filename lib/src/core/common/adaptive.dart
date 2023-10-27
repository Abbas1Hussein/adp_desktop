import 'package:flutter/foundation.dart';

import '../enum/target.dart';
import '../exception/platform_exceptions.dart';
import 'construct/platforms.dart';

typedef Value<T> = T Function();

/// Get the 'configuration' instance of DefaultPlatforms
final _defaultPlatforms = DefaultPlatforms.instance;

/// Retrieve the current platform from DefaultPlatforms, or use the default if it's null.
///
/// To test your app with a specific platform, you must initialize 'DefaultPlatforms' and set 'isDebugging' to true.
///
/// Example usage:
/// ```dart
/// void main() async {
///   DefaultPlatforms.initialize(
///     AdaptiveTargetPlatform.(windows, macos),
///     isDebugging: true,
///   );
///   runApp(const App());
/// }
/// ```
final kPlatformRuining =
    (_defaultPlatforms != null && _defaultPlatforms!.isDebugging
        ? _defaultPlatforms!.platform
        : defaultTargetPlatform);

/// Returns the adaptive value based on the current platform.
/// If no function is provided for the current platform, an exception is thrown.
T adaptiveValue<T>({Value<T>? macos, Value<T>? windows}) {
  if (kIsWeb) {
    return _handleWebPlatform<T>(macos, windows);
  }

  if (kPlatformRuining == TargetPlatform.linux) {
    return _handleLinuxPlatform<T>(macos, windows);
  }

  return _handleDesktopPlatform<T>(macos, windows);
}

/// Handle specific Linux platform configuration [TargetLinux].
/// Example:
///   DefaultPlatforms.initialize(
///     AdaptiveTargetPlatform.windows,
///     targetLinux: TargetLinux.macOS,
///   );
/// When running Linux components, it will use the 'macOS' design by default.
/// If no specific Linux platform is configured, it retrieves [windows].
T _handleLinuxPlatform<T>(Value<T>? macos, Value<T>? windows) {
  if (_defaultPlatforms?.targetLinux == AdaptiveTargetPlatform.windows) {
    if (windows != null) return windows();
    throw MissingPlatformException<T>('windows');
  } else {
    if (macos != null) return macos();
    throw MissingPlatformException<T>('macOS');
  }
}

/// Handle specific web platform configuration [AdaptiveTargetPlatform].
/// Example:
///   DefaultPlatforms.initialize(
///     AdaptiveTargetPlatform.windows,
///     targetWeb: AdaptiveTargetPlatform.macOS,
///   );
/// When running web components, it will use the 'macOS' design by default.
/// If no specific web platform is configured, it retrieves [windows].
T _handleWebPlatform<T>(
  Value<T>? macos,
  Value<T>? windows,
) {
  if (_defaultPlatforms?.targetWeb == AdaptiveTargetPlatform.windows) {
    if (windows != null) return windows();
    throw MissingPlatformException<T>('windows');
  } else if (_defaultPlatforms?.targetWeb == AdaptiveTargetPlatform.macOS) {
    if (macos != null) return macos();
    throw MissingPlatformException<T>('macOS');
  } else {
    throw UnsupportedPlatformException(kPlatformRuining.name);
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
///   - MissingPlatformException if a required platform-specific function is missing.
///   - UnsupportedPlatformException if the current platform is not recognized.
T _handleDesktopPlatform<T>(Value<T>? macos, Value<T>? windows) {
  switch (kPlatformRuining) {
    case TargetPlatform.windows:
      if (windows != null) return windows();
      throw MissingPlatformException<T>('windows');
    case TargetPlatform.macOS:
      if (macos != null) return macos();
      throw MissingPlatformException<T>('macOS');
    default:
      throw UnsupportedPlatformException<T>(kPlatformRuining.name);
  }
}
