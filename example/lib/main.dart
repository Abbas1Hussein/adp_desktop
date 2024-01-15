import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() async {
  DefaultsPlatformManager.initialize(
    isDebugging: true,
    DesktopTargetPlatform.windows,
    targetWeb: DesktopTargetPlatform.macOS,
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
      appBar: AdaptiveNavigationAppBar(
        leading: const AdaptiveIcon(AdpIcons.documentChart),
        title: const Text('documentChart'),
        actions: [
          AdaptiveActionButton(
            label: 'delete',
            icon: const AdaptiveIcon(AdpIcons.delete),
            onPressed: () {},
          ),
          AdaptiveActionButton(
            label: 'archive',
            icon: const AdaptiveIcon(AdpIcons.archive),
            onPressed: () {},
          ),
          AdaptiveActionButton(
            label: 'download',
            icon: const AdaptiveIcon(AdpIcons.download),
            onPressed: () {},
          ),
          AdaptiveActionButton(
            label: 'settings',
            icon: const AdaptiveIcon(AdpIcons.settings),
            onPressed: () {},
          ),
        ],
      ),
      sidebar: AdaptiveNavigationSidebar(
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
    );
  }

  List<Widget> get children {
    return [
      const FirstScreen(),
      const Text('AdaptiveTab 2'),
      const Text('AdaptiveTab 3'),
      const Text('AdaptiveTab 4'),
      const Text('AdaptiveTab 5'),
      const Text('AdaptiveTab 6'),
    ].map((e) => Center(child: e)).toList();
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveIconButton(
            icon: const AdaptiveIcon(AdpIcons.app),
            onPressed: () {},
          ),
          AdaptiveIconButton.label(
            label: const Text('app'),
            icon: const AdaptiveIcon(AdpIcons.app),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(title: Text('Second Screen')),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(child: AdaptiveDatePicker()),
          Center(
            child: AdaptiveButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Go back to First Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
