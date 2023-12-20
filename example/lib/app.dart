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
  late GlobalKey<FormState> key;

  @override
  void initState() {
    key = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: const AdaptiveAppBar(),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdaptiveTextFormField(
                placeholder: 'Enter a username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              AdaptiveTextFormField(
                placeholder: 'Enter your password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              AdaptiveFlatButton(
                onPressed: _login,
                child: const Text('Login - Adp'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (key.currentState?.validate() ?? false) {
      // Validation successful, proceed with login logic
      print('Login successful!');
    } else {
      // Validation failed, show an error message or perform error handling
      print('Login failed. Please check your credentials.');
    }
  }
}
