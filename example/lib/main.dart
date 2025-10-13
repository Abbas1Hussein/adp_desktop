import 'package:adp_desktop/adp_desktop.dart';

import 'src/app.dart';
import 'src/controllers/platforms_controller.dart';

void main() async {
  final targetPlatform = await PlatformController().targetPlatform;

  DefaultsPlatformManager.initialize(targetPlatform: targetPlatform, isDebugging: true);

  runApp(const App());
}
