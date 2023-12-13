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
  static const content =
      "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...";

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: const AdaptiveAppBar(),
      body: Center(
        child: AdaptiveFlatButton(
          color: AdpColors.purple,
          child: const Text('Show Dialog'),
          onPressed: () {
            showAdpDialog(
              context: context,
              child: AdaptiveDialog(
                title: const Text('Adaptive Dialog'),
                content: const Text(content),
                primary: AdaptiveFlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Yes'),
                ),
                secondary: AdaptiveFlatButton(
                  child: const Text('No'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
