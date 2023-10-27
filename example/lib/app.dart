import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultPlatforms.initialize(
    AdaptiveTargetPlatform.macOS,
    targetWeb: AdaptiveTargetPlatform.macOS,
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
      themeMode: ThemeMode.light,
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
  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      appBar: AdaptiveAppBar(
        title: const Text('Adaptive AppBar'),
        actions: [
          AdaptiveTextButton(child: const Text('1'), onPressed: () {}),
          AdaptiveTextButton(child: const Text('2'), onPressed: () {}),
          AdaptiveTextButton(child: const Text('3'), onPressed: () {}),
        ],
      ),
      tabs: const [
        Text('data1'),
        Text('data2'),
        Text('data3'),
      ],
      items: const [
        AdaptiveNavigationViewItem(
          icon: AdaptiveIcon(AdaptiveIcons.add),
          label: 'first',
        ),
        AdaptiveNavigationViewItem(
          icon: AdaptiveIcon(AdaptiveIcons.arrowDown),
          label: 'second',
        ),
        AdaptiveNavigationViewItem(
          icon: AdaptiveIcon(AdaptiveIcons.arrowUp),
          label: 'third',
        ),
      ],
      properties: Properties(
        macos: NavigationViewMacosProperty(
          isResizable: true,
          bottom: PushButton(
            controlSize: ControlSize.large,
            onPressed: () {},
            child: const Center(child: Text('PushButton')),
          ),
        ),
      ),
    );
  }
}
