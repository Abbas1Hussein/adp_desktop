import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.macOS,
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
    return AdaptiveNavigationView(
      navigationAppBar: const AdaptiveNavigationAppBar(
        title: Text('Adaptive app'),
        leading: AdaptiveIcon(AdpIcons.home),
        automaticallyImplyLeading: true,
      ),
      currentIndex: currentValue,
      onChanged: (value) {
        setState(() {
          currentValue = value;
        });
      },
      items: [
        const AdaptiveNavigationViewItem(
          label: Text('label'),
          icon: AdaptiveIcon(AdpIcons.add),
        ),
        const AdaptiveNavigationViewItem(
          label: Text('label - 2'),
          icon: AdaptiveIcon(AdpIcons.homeFilled),
        ),
        const AdaptiveNavigationViewItem(
          label: Text('label - 3'),
          icon: AdaptiveIcon(AdpIcons.heartBroken),
        ),
      ],
      children: [
        const SizedBox(),
        const SizedBox(),
        const SizedBox(),
      ],
    );
  }
}
