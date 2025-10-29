import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatformController {
  Future<DesktopTargetPlatform> get targetPlatform async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final platform =
        sharedPreferences.getString('targetPlatform') ??
        defaultTargetPlatform.name;

    return DesktopTargetPlatform.values.firstWhere(
      (element) => element.name.contains(platform),
      orElse: () {
        if (kIsWeb) return DesktopTargetPlatform.windows;

        return defaultTargetPlatform.desktopTargetPlatform;
      },
    );
  }

  Future<void> toggleToMacOS() async =>
      togglePlatformFrom(DesktopTargetPlatform.macOS);

  Future<void> toggleToWindows() async =>
      togglePlatformFrom(DesktopTargetPlatform.windows);

  Future<void> togglePlatformFrom(DesktopTargetPlatform targetPlatform) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('targetPlatform', targetPlatform.name);
  }

  Future<void> clear() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('targetPlatform');
  }
}
