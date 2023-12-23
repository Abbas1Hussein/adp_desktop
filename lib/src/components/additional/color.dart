import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/adaptive.dart';

abstract final class AdpColors {
  const AdpColors._();

  /// The black color.
  static const Color black = Colors.black;

  /// The white color.
  static const Color white = Colors.white;

  /// The adaptive green color.
  static final Color green = dynamic(
    macosColor: MacosColors.appleGreen,
    fluentColor: Colors.green,
  );

  /// The adaptive red color.
  static final Color red = dynamic(
    macosColor: MacosColors.appleRed,
    fluentColor: Colors.red,
  );

  /// The adaptive blue color.
  static final Color blue = dynamic(
    macosColor: MacosColors.appleBlue,
    fluentColor: Colors.blue,
  );

  /// The adaptive yellow color.
  static final Color yellow = dynamic(
    macosColor: MacosColors.appleYellow,
    fluentColor: Colors.yellow,
  );

  /// The adaptive orange color.
  static final Color orange = dynamic(
    macosColor: MacosColors.appleOrange,
    fluentColor: Colors.orange,
  );

  /// The adaptive purple color.
  static final Color purple = dynamic(
    macosColor: MacosColors.applePurple,
    fluentColor: Colors.purple,
  );

  /// The adaptive yellow color.
  static final Color magenta = dynamic(
    macosColor: MacosColors.systemPinkColor,
    fluentColor: Colors.magenta,
  );

  /// The adaptive teal color.
  static final Color teal = dynamic(
    macosColor: MacosColors.systemTealColor,
    fluentColor: Colors.teal,
  );

  /// The adaptive cyan color.
  static final Color cyan = dynamic(
    macosColor: MacosColors.appleCyan,
    fluentColor: const Color(0xFF0078D4),
  );

  /// The adaptive indigo color.
  static final Color indigo = dynamic(
    macosColor: MacosColors.systemIndigoColor,
    fluentColor: const Color(0xFF6C757D),
  );

  /// The adaptive brown color.
  static final Color brown = dynamic(
    macosColor: MacosColors.appleBrown,
    fluentColor: const Color(0xFF8A8886),
  );

  /// The adaptive gray color.
  static final Color gray = dynamic(
    macosColor: MacosColors.systemGrayColor,
    fluentColor: Colors.grey,
  );

  /// Returns the adaptive color for the current platform.
  ///
  /// * [fluentColor]: The color to use on Windows.
  /// * [macosColor]: The color to use on macOS.
  static Color dynamic({
    required Color fluentColor,
    required Color macosColor,
  }) {
    return adaptiveValue<Color>(
      windows: () => fluentColor,
      macos: () => macosColor,
    );
  }
}
