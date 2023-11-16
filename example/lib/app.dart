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
  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      appBar: const AdaptiveAppBar(title: Text('Adaptive AppBar')),
      currentIndex: 0,
      tabs: const [
        CustomAdaptiveWidget(),
        Center(child: AdaptiveRatingIndicator(rating: 6, amount: 11)),
        Center(),
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
    );
  }
}

class CustomAdaptiveWidget extends StatefulWidget {
  const CustomAdaptiveWidget({super.key});

  @override
  State<CustomAdaptiveWidget> createState() => _CustomAdaptiveWidgetState();
}

class _CustomAdaptiveWidgetState extends State<CustomAdaptiveWidget> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AdaptivePulldownMenuButton.singleChoice(
        title: 'menu',
        items: [
          AdaptivePulldownMenuItem(
            selected: true,
            leading: AdaptiveIcon(AdaptiveIcons.folderAdd),
            child: Text('New folder'),
          ),
          AdaptivePulldownMenuItem(
            leading: AdaptiveIcon(AdaptiveIcons.folderOpen),
            child: Text('Open'),
          ),
          AdaptivePulldownMenuItem(
            leading: AdaptiveIcon(AdaptiveIcons.wand),
            child: Text('Open with'),
          ),
        ],
      ),
    );
  }
}
