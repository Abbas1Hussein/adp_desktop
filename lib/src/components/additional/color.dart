import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/adaptive.dart';

abstract class AdaptiveColors {
  const AdaptiveColors._();

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

  /// The adaptive green color.
  static Color get green {
    return dynamic(
      macosColor: MacosColors.appleGreen,
      fluentColor: fluent_ui.Colors.green,
    );
  }

  /// The adaptive red color.
  static Color get red {
    return dynamic(
      macosColor: MacosColors.appleRed,
      fluentColor: fluent_ui.Colors.red,
    );
  }

  /// The adaptive blue color.
  static Color get blue {
    return dynamic(
      macosColor: MacosColors.appleBlue,
      fluentColor: fluent_ui.Colors.blue,
    );
  }

  /// The adaptive yellow color.
  static Color get yellow {
    return dynamic(
      macosColor: MacosColors.appleYellow,
      fluentColor: fluent_ui.Colors.yellow,
    );
  }

  /// The adaptive orange color.
  static Color get orange {
    return dynamic(
      macosColor: MacosColors.appleOrange,
      fluentColor: fluent_ui.Colors.orange,
    );
  }

  /// The adaptive purple color.
  static Color get purple {
    return dynamic(
      macosColor: MacosColors.applePurple,
      fluentColor: fluent_ui.Colors.purple,
    );
  }

  /// The adaptive black color.
  static Color get black => Colors.black;

  /// The adaptive white color.
  static Color get white => Colors.white;

  /// The adaptive yellow color.
  static Color get magenta {
    return dynamic(
      macosColor: MacosColors.systemPinkColor,
      fluentColor: fluent_ui.Colors.magenta,
    );
  }

  /// The adaptive teal color.
  static Color get teal {
    return dynamic(
      macosColor: MacosColors.systemTealColor,
      fluentColor: fluent_ui.Colors.teal,
    );
  }

  /// The adaptive cyan color.
  static Color get cyan {
    return dynamic(
      macosColor: MacosColors.appleCyan,
      fluentColor: const Color(0xFF0078D4),
    );
  }

  /// The adaptive indigo color.
  static Color get indigo {
    return dynamic(
      macosColor: MacosColors.systemIndigoColor,
      fluentColor: const Color(0xFF6C757D),
    );
  }

  /// The adaptive brown color.
  static Color get brown {
    return dynamic(
      macosColor: MacosColors.appleBrown,
      fluentColor: const Color(0xFF8A8886),
    );
  }

  /// The adaptive gray color.
  static Color get gray {
    return dynamic(
      macosColor: MacosColors.systemGrayColor,
      fluentColor: fluent_ui.Colors.grey,
    );
  }
}
