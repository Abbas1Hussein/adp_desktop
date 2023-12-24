import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdaptiveNavigationView(
        navigationAppBar: AdaptiveNavigationAppBar(
          title: const Text('title'),
          leading: const Text('leading'),

          actions: [
            const AdaptiveNABDivider(),
            AdaptiveNABPulldownButton(
              items: [
                const AdaptivePulldownMenuItem(child: Text('1')),
                const AdaptivePulldownMenuDivider(),
                const AdaptivePulldownMenuItem(child: Text('2')),
              ],
              label: 'label',
              tooltipMessage: 'tooltipMessage',
              icon: AdpIcons.add.platform,
            ),
            const AdaptiveNABDivider(),
            AdaptiveNABIconButton(
              label: 'label',
              onPressed: () {},
              icon: const AdaptiveIcon(AdpIcons.add),
            ),
          ],
        ),
        items: const [
          AdaptiveNavigationViewItem(
            label: Text('home'),
            icon: AdaptiveIcon(AdpIcons.app),
          )
        ],
        children: const [Center()],
      ),
    );
  }
}
