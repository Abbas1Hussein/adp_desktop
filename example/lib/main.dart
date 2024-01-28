import 'package:adp_desktop/adp_desktop.dart';

import 'app/app.dart';
import 'app/controllers/platforms_controller.dart';
void main() async {
  final targetPlatform = await PlatformController().targetPlatform;

  DefaultsPlatformManager.initialize(targetPlatform: targetPlatform);
  runApp(const App());
}

