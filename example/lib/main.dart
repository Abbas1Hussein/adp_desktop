import 'package:adp_desktop/adp_desktop.dart';

import 'buttons/checkbox.dart';

void main() async {
  DefaultsPlatformManager.initialize(
    targetPlatform: DesktopTargetPlatform.windows,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdpApp(
      home: const HomeScreen(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      properties: Properties(
        macos: AppMacosProperty(
          darkTheme: MacosThemeData.dark(),
          theme: MacosThemeData.light(),
        ),
        windows: AppWindowsProperty(
          darkTheme: FluentThemeData.dark(),
          theme: FluentThemeData.light(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Checked());
  }
}
