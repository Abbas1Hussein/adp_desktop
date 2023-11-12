import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultPlatforms.initialize(
    AdaptiveTargetPlatform.windows,
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
      appBar: AdaptiveAppBar(
        title: const Text('Adaptive AppBar'),
        actions: [
          AdaptiveTextButton(child: const Text('1'), onPressed: () {}),
          AdaptiveTextButton(child: const Text('2'), onPressed: () {}),
          AdaptiveTextButton(child: const Text('3'), onPressed: () {}),
        ],
      ),
      properties: Properties(
        macos: NavigationViewMacosProperty(
          isResizable: true,
          bottom: AdaptiveTextSearchField<int>(
            placeholder: 'Search',
            suggestions: [
              AdaptiveSearchItem(searchKey: 'searchKey', value: 00),
              AdaptiveSearchItem(searchKey: 'searchKey2', value: 11),
              AdaptiveSearchItem(searchKey: 'searchKey3', value: 22),
            ],
            onSelected: (value) {
              print('searchKey: ${value.searchKey}, value: ${value.value}');
            },
          ),
        ),
      ),
      currentIndex: 0,
      tabs: [
        const CustomAdaptiveWidget(),
        const Center(child: AdaptiveRatingIndicator(rating: 6, amount: 11)),
        Center(
          child: AdaptiveTextSearchField<int>(
            suggestions: [
              AdaptiveSearchItem(searchKey: 'searchKey', value: 00),
              AdaptiveSearchItem(searchKey: 'searchKey2', value: 11),
              AdaptiveSearchItem(searchKey: 'searchKey3', value: 22),
            ],
            onSelected: (value) {
              print('searchKey: ${value.searchKey}, value: ${value.value}');
            },
          ),
        ),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdaptiveFlatButton(
        color: AdaptiveColors.magenta,
        onPressed: () => print('onPressed'),
        onLongPress: () => print('onLongPress'),
        child: const Text('AdaptiveFilledButton'),
      ),
    );
  }
}
