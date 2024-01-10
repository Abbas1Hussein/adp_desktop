import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() async {
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
    return AdaptiveTitleBar(
      appTitle: const Text('adp app'),
      appIcon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: AdaptiveIcon(AdpIcons.home),
      ),
      child: AdaptiveNavigationView(
        appBar: const AdaptiveNavigationAppBar(),
        sidebar: AdaptiveNavigationSidebar(
          searchField: const AdaptiveTextSearchField(suggestions: []),
          currentIndex: currentValue,
          onChanged: (value) {
            setState(() => currentValue = value);
          },
          items: [
            const AdaptiveNavigationSidebarItem(
              label: Text('app'),
              icon: AdaptiveIcon(AdpIcons.app),
            ),
            const AdaptiveNavigationSidebarItem(
              label: Text('movie'),
              icon: AdaptiveIcon(AdpIcons.move),
            ),
            const AdaptiveNavigationSidebarItem(
              label: Text('archive'),
              icon: AdaptiveIcon(AdpIcons.archive),
            ),
            const AdaptiveNavigationSidebarItem(
              label: Text('shield'),
              icon: AdaptiveIcon(AdpIcons.shield),
            ),
            const AdaptiveNavigationSidebarItem(
              label: Text('download'),
              icon: AdaptiveIcon(AdpIcons.download),
            ),
            const AdaptiveNavigationSidebarItem(
              label: Text('settings'),
              icon: AdaptiveIcon(AdpIcons.settings),
            ),
          ],
        ),
        children: children,
      ),
    );
  }

  List<Widget> get children {
    return [
      const AdaptiveWindowButtons(),
      const Text('AdaptiveTab 2'),
      const Text('AdaptiveTab 3'),
      const Text('AdaptiveTab 4'),
      const Text('AdaptiveTab 5'),
      const Text('AdaptiveTab 6'),
    ].map((e) => Center(child: e)).toList();
  }
}
