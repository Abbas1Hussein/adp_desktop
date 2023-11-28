import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.macOS,
    isDebugging: true,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print("isFakeMacos: ${PlatformRuining.isFakeMacos}");
    print("isRealMacos: ${PlatformRuining.isRealMacos}");
    print(PlatformRuining.targetPlatform);
    print("isFakeWindows: ${PlatformRuining.isFakeWindows}");
    print("isRealWindows: ${PlatformRuining.isRealWindows}");
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
          icon: AdaptiveIcon(AdpIcons.add),
          label: 'first',
        ),
        AdaptiveNavigationViewItem(
          icon: AdaptiveIcon(AdpIcons.arrowDown),
          label: 'second',
        ),
        AdaptiveNavigationViewItem(
          icon: AdaptiveIcon(AdpIcons.arrowUp),
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
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdaptiveCircularProgressIndicator(
            value: currentValue,
            //  borderColor: MacosColors.systemTealColor,
            //  innerColor: MacosColors.systemPinkColor,
          ),
          const SizedBox(height: 4.0),
          AdaptiveFlatButton(
            onPressed: inc,
            child: const Text('inc Circular'),
          ),
          const SizedBox(height: 4.0),
          AdaptiveFlatButton(
            onPressed: dis,
            child: const Text('dis Circular'),
          ),
        ],
      ),
    );
  }

  void inc() {
    setState(() {
      currentValue += 10;
    });
  }

  void dis() {
    setState(() {
      currentValue -= 10;
    });
  }
}
