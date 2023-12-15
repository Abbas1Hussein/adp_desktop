import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DefaultsPlatformManager.initialize(
    DesktopTargetPlatform.windows,
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
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: const AdaptiveAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AdaptiveFlatButton(
              color: AdpColors.purple,
              child: const Text('ConfirmationSheet'),
              onPressed: () {
                BottomSheetPresenter.showConfirmationSheet(
                  context,
                  title: DummyText.generateQuestion,
                  content: Text(DummyText.generateAnswer * 20),
                  confirmLabel: 'Ok',
                );
              },
            ),
            AdaptiveFlatButton(
              color: AdpColors.purple,
              child: const Text('Show InformationSheet'),
              onPressed: () {
                BottomSheetPresenter.showInformationSheet(
                  context,
                  title: DummyText.generateQuestion,
                  message: DummyText.generateAnswer * 20,
                );
              },
            ),

            AdaptiveFlatButton(
              color: AdpColors.purple,
              child: const Text('ConfirmationDialog'),
              onPressed: () {
                DialogPresenter.showConfirmationDialog(
                  context,
                  title: DummyText.generateQuestion,
                  message: DummyText.generateAnswer * 20,
                  confirmLabel: 'Ok',
                );
              },
            ),
            AdaptiveFlatButton(
              color: AdpColors.purple,
              child: const Text('Show InformationDialog'),
              onPressed: () {
                DialogPresenter.showInformationDialog(
                  context,
                  title: DummyText.generateQuestion,
                  message: DummyText.generateAnswer * 20,
                  confirmLabel: 'Ok',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
