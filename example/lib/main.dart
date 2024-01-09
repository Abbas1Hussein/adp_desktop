import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.windows,
    targetWeb: DesktopTargetPlatform.macOS,
    isDebugging: true,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdpApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {

    return AdaptiveTabView(
      onChanged: _onChanged,
      currentIndex: currentValue,
      contentMargin: EdgeInsets.all(16.0),
      tabs: List.generate(
        3,
        (index) => AdaptiveTab(
          icon: [
            const AdaptiveIcon(AdpIcons.alarm),
            const AdaptiveIcon(AdpIcons.add),
            const AdaptiveIcon(AdpIcons.airplane)
          ][index],
          label: Text('AdaptiveTab'),
        ),
      ),
      children: List.generate(
        3,
        (index) => AdaptiveDatePicker(),
      ),
    );
  }

  void _onChanged(value) => setState(() => currentValue = value);
}
