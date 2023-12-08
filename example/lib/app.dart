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
  final List<AdpIcons> mainMenuIcons = const [
    AdpIcons.app, // Main Menu
    AdpIcons.tvFilled, // TV Series
    AdpIcons.tv, // Movies
    AdpIcons.save, // Saved
    AdpIcons.document, // Watch Later
    AdpIcons.downloadFile, // Downloads
    AdpIcons.settings, // Settings
  ];
  final List<String> mainMenuTexts = const [
    'القائمة الرئيسية', // Main Menu
    'المسلسلات', // TV Series
    'الافلام', // Movies
    'المحفوظات', // Saved
    'المشاهدة لاحقًا', // Watch Later
    'التنزيلات', // Downloads
    'الاعدادات', // Settings
  ];

  late List<AdaptiveNavigationViewItem> items;

  int get mainMenuLength => mainMenuTexts.length;

  int currentIndex = 0;

  @override
  void initState() {
    items = List.generate(
      mainMenuLength,
      (index) => AdaptiveNavigationViewItem(
        icon: AdaptiveIcon(mainMenuIcons[index]),
        label: Text(mainMenuTexts[index]),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      onChanged: _onChanged,
      currentIndex: currentIndex,
      selectedColor: AdpColors.red,
      items: _buildTabs(),
      children: buildChildren(),
    );
  }

  void _onChanged(value) {
    setState(() {
      currentIndex = value;
    });
  }

  List<Widget> buildChildren() {
    return items.map(
      (element) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [element.label, element.icon!],
          ),
        );
      },
    ).toList();
  }

  List<AdaptiveNavigationViewItem> _buildTabs() {
    return items.map(
      (e) {
        return AdaptiveNavigationViewItem(
          label: e.label,
          icon: e.icon,
        );
      },
    ).toList();
  }
}

class CustomAdaptiveWidget extends StatefulWidget {
  const CustomAdaptiveWidget({super.key});

  @override
  State<CustomAdaptiveWidget> createState() => _CustomAdaptiveWidgetState();
}

class _CustomAdaptiveWidgetState extends State<CustomAdaptiveWidget> {
  double currentValue = 100;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('AdaptiveAppBar'),
    );
  }
}
