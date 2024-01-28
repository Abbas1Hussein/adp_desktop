import 'package:flutter/material.dart';

class ThemeController extends ValueNotifier<ThemeMode?> {
  ThemeController({ThemeMode? value}) : super(value);

  bool get isDarkMode => value == ThemeMode.dark;

  bool get isLightMode => !isDarkMode;

  void darkMode() => toggleTheme(ThemeMode.dark);

  void lightMode() => toggleTheme(ThemeMode.light);

  void toggleTheme(ThemeMode mode) => value = mode;
}
