import 'package:adp_desktop/adp_desktop.dart';

import 'src/controllers/platforms_controller.dart';
import 'src/controllers/theme_controller.dart';
import 'src/view/screens/home/home.dart';


void main() async {
  final targetPlatform = await PlatformController().targetPlatform;

  DefaultsPlatformManager.initialize(targetPlatform: targetPlatform);
  runApp(const App());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeController controller;

  @override
  void initState() {
    controller = ThemeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode?>(
      valueListenable: controller,
      builder: (context, value, child) {
        return AdpApp(
          debugShowCheckedModeBanner: false,
          themeMode: value,
          properties: Properties(
            windows: const AppWindowsProperty(),
            macos: const AppMacosProperty(),
          ),
          home: HomeScreen(controller: controller),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
