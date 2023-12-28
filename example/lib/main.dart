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
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(title: const Text('Abbas Hussein')),
      drawer: AdaptiveDrawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(8.0), child: AdaptiveBackButton()),
            ...List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdaptiveListTile(
                  title: Text('T ${index + 1}'),
                  subtitle: Text('SUB ${index + 1}'),
                  leading: Text('L ${index + 1}'),
                  trailing: Text('TR ${index + 1}'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdaptiveFlatButton(
                child: const Text('AdaptiveFlatButton'),
                onPressed: () {},
              ),

              const AdaptiveBackButton(),

              const AdaptiveDatePicker(),
              const AdaptiveTimePicker(),
            ],
          ),
        ),
      ),
    );
  }
}
