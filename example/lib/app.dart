import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.macOS,
    targetWeb: DesktopTargetPlatform.windows,
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
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    return  AdaptiveScaffold(
      appBar: const AdaptiveAppBar(),
      body: Center(
        child: AdaptiveTextField(
          placeholder: 'placeholder',
          prefix: const Text('prefix'),
          suffix: const Text('suffix'),
          onTap: () {
            print('onTap');
          },
          onTapOutside: (event) {
            print('onTapOutside');
          },
          onSubmitted: (value) {
            print('onSubmitted');
          },
          onChanged: (value) {
            print('onChanged');
          },
          onEditingComplete: () {
            print('onEditingComplete');
          },
        ),
      ),
    );
  }
}
