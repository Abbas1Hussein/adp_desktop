import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultPlatforms.initialize(
    AdaptiveTargetPlatform.macOS,
    targetWeb: AdaptiveTargetPlatform.windows,
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
  int currentValue = 1;

  final activeColor = [
    AdaptiveColors.purple,
    AdaptiveColors.red,
    AdaptiveColors.cyan,
    AdaptiveColors.magenta,
    AdaptiveColors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          5,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: AdaptiveRadio(
                value: index,
                groupValue: currentValue,
                activeColor: activeColor[index],
                disabledColor: activeColor.reversed.toList()[index],
                content: Text('Adp R a d i o ${index + 1}'),
                onChanged: onChanged,
              ),
            );
          },
        ),
      ),
    );
  }

  void onChanged(int? value) {
    setState(() {
      currentValue = value!;
    });
  }
}
