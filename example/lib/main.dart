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

    BottomNavigation;

    return AdaptiveNavigationView(
      appBar: AdaptiveNavigationAppBar(
        title: const Text('Adaptive app'),
        leading: const AdaptiveIcon(AdpIcons.home),
        actions: _buildActions(),
      ),
      sidebar: AdaptiveNavigationSidebar(
        onChanged: _onChanged,
        currentIndex: currentValue,
        items: [
          const AdaptiveNavigationSidebarItem(
            label: Text('add'),
            icon: AdaptiveIcon(AdpIcons.add),
          ),
          const AdaptiveNavigationSidebarItem(
            label: Text('delete'),
            icon: AdaptiveIcon(AdpIcons.delete),
          ),
          const AdaptiveNavigationSidebarItem(
            label: Text('edit'),
            icon: AdaptiveIcon(AdpIcons.edit),
          ),
        ],
      ),
      children: List.generate(3, (index) => const AdaptiveDatePicker()),
    );
  }

  void _onChanged(value) => setState(() => currentValue = value);

  List<AdaptiveActionEntry> _buildActions() {
    return [
      AdaptiveActionPulldownButton(
        items: [
          const AdaptivePulldownMenuItem(child: Text('data')),
          const AdaptivePulldownMenuDivider(),
        ],
        label: 'label',
        icon: AdpIcons.archive,
      ),
      const AdaptiveActionDivider(),
      AdaptiveActionButton(
        label: 'add',
        onPressed: () {
          Navigator.push(context, AdaptivePageRoute(
            builder: (context, animation, secondaryAnimation) {
              return widget;
            },
          ));
        },
        icon: const AdaptiveIcon(AdpIcons.add),
      ),
      AdaptiveActionButton(
        label: 'remove',
        onPressed: () {},
        icon: const AdaptiveIcon(AdpIcons.delete),
      ),
      AdaptiveActionButton(
        label: 'edit',
        onPressed: () {},
        icon: const AdaptiveIcon(AdpIcons.edit),
      ),
    ];
  }
}
