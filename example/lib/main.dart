import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
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
  bool currentValue = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      endDrawer: const AdaptiveDrawer(),
      drawer: AdaptiveDrawer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DummyText.generateAnswer),
          ),
        ),
      ),
      appBar: AdaptiveAppBar(title: const Text('Abbas Hussein')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(DummyText.generateQuestion),
            Text(DummyText.generateAnswer),
            AdaptiveFlatButton(
              child: const Text('Go'),
              onPressed: () {
                Navigator.push(
                  context,
                  AdaptivePageRoute(
                    builder: (context) {
                      return  AdaptiveScaffoldPage(
                        appBar: AdaptiveAppBarPage(),
                        content: const SizedBox.shrink(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const AdaptiveIcon(AdpIcons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: AdaptiveIcon(AdpIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: AdaptiveIcon(AdpIcons.save),
            label: 'save',
          ),
          BottomNavigationBarItem(
            icon: AdaptiveIcon(AdpIcons.alarm),
            label: 'alarm',
          ),
        ],
      ),
    );
  }
}
