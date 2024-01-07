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
      navigationAppBar: AdaptiveNavigationAppBar(
        title: const Text('Adaptive app'),
        leading: const AdaptiveIcon(AdpIcons.home),
        actions: [
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
            onPressed: () {},
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
        ],
      ),
      currentIndex: currentValue,
      onChanged: (value) => setState(() => currentValue = value),
      items: List.generate(
        3,
        (index) => AdaptiveNavigationViewItem(
          icon: [
            const AdaptiveIcon(AdpIcons.archive),
            const AdaptiveIcon(AdpIcons.alarm),
            const AdaptiveIcon(AdpIcons.app)
          ][index],
          label: Text('label: ${index + 1}'),
        ),
      ),
      children: List.generate(
          3,
          (index) => Center(
                child: Text('${index + 1}'),
              )),
    );
  }
}
