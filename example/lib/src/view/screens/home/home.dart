import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../controllers/platforms_controller.dart';
import '../../../controllers/theme_controller.dart';
import 'tabs/additional/additional.dart';
import 'tabs/buttons/buttons.dart';
import 'tabs/fields/fields.dart';
import 'tabs/icons/icons.dart';
import 'tabs/indicators/indicators.dart';
import 'tabs/layouts/layouts.dart';
import 'tabs/navigation/navigation.dart';
import 'tabs/pickers/pickers.dart';
import 'tabs/surfaces/surfaces.dart';

class HomeScreen extends StatefulWidget {
  final ThemeController controller;

  const HomeScreen({required this.controller, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PlatformController controller;

  int _currentIndex = 0;

  @override
  void initState() {
    controller = PlatformController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      contentPadding: EdgeInsets.zero,
      appBar: AdaptiveNavigationAppBar(
        title: const Text('Adaptive Desktop'),
        actions: [
          AdaptiveActionButton(
            label: 'github',
            onPressed: () {
              launchUrlString('https://github.com/Abbas1Hussein/adp_desktop');
            },
            icon: const AdaptiveIcon(AdpIcons.link),
          ),
          AdaptiveActionButton(
            label: 'pub',
            onPressed: () {
              launchUrlString('https://pub.dev/packages/adp_desktop');
            },
            icon: const AdaptiveIcon(AdpIcons.link),
          ),
          const AdaptiveActionDivider(),
          AdaptiveActionPulldownButton(
            items: [
              AdaptiveActionPulldownItem(
                onTap: widget.controller.lightMode,
                enabled: context.brightness.isLight,
                leading: const AdaptiveIcon.all(Icons.light_mode),
                child: Text(Brightness.light.name),
              ),
              AdaptiveActionPulldownItem(
                onTap: widget.controller.darkMode,
                enabled: context.brightness.isDark,
                leading: const AdaptiveIcon.all(Icons.dark_mode),
                child: Text(Brightness.dark.name),
              ),
            ],
            label: context.brightness.name,
            icon: context.brightness.isDark
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          AdaptiveActionPulldownButton(
            items: [
              AdaptiveActionPulldownItem(
                onTap: _showSystemsDialog,
                child: Text(ThemeMode.system.name),
              ),
              AdaptiveActionPulldownItem(
                enabled:
                    PlatformRuining.targetPlatform ==
                    DesktopTargetPlatform.macOS,
                onTap: () =>
                    _showConfirmationDialog(DesktopTargetPlatform.macOS),
                child: Text(DesktopTargetPlatform.macOS.name),
              ),
              AdaptiveActionPulldownItem(
                enabled:
                    PlatformRuining.targetPlatform ==
                    DesktopTargetPlatform.windows,
                onTap: () =>
                    _showConfirmationDialog(DesktopTargetPlatform.windows),
                child: Text(DesktopTargetPlatform.windows.name),
              ),
            ],
            label: PlatformRuining.targetPlatform.name,
            icon: Icons.devices,
          ),
        ],
      ),
      sidebar: AdaptiveNavigationSidebar(
        searchField: const AdaptiveTextSearchField(suggestions: []),
        currentIndex: _currentIndex,
        onChanged: (value) => setState(() => _currentIndex = value),
        items: List.generate(
          children.length,
          (index) => AdaptiveNavigationSidebarItem(
            label: Text(labels[index]),
            icon: AdaptiveIcon.all(icons[index]),
          ),
        ),
      ),
      children: children,
    );
  }

  void _showSystemsDialog() async {
    await _confirmationDialog(
      targetPlatform: defaultTargetPlatform.desktopTargetPlatform,
      onApplied: () async => await controller.clear(),
    );
  }

  void _showConfirmationDialog(DesktopTargetPlatform targetPlatform) async {
    await _confirmationDialog(
      targetPlatform: targetPlatform,
      onApplied: () => controller.togglePlatformFrom(targetPlatform),
    );
  }

  Future<void> _confirmationDialog({
    required DesktopTargetPlatform targetPlatform,
    required VoidCallback onApplied,
  }) async {
    await DialogPresenter.showConfirmationDialog(
      context,
      title: 'toggle platform to ${targetPlatform.name}',
      message: 'after restart the app this will applied',
      confirmLabel: 'apply',
    ).then((result) {
      if (result == true) onApplied();
    });
  }

  List<String> labels = const [
    'Buttons',
    'Fields',
    'Icons',
    'Indicators',
    'Layouts',
    'Navigation\'s',
    'Pickers',
    'Surfaces',
    'Additional',
  ];

  List<IconData> icons = [
    Icons.smart_button,
    Icons.text_fields,
    Icons.insert_emoticon,
    Icons.indeterminate_check_box,
    Icons.layers,
    Icons.navigation,
    Icons.calendar_today,
    Icons.card_giftcard,
    Icons.add_box_rounded,
  ];

  List<Widget> children = const [
    ButtonsTab(),
    Fields(),
    IconsTab(),
    Indicators(),
    Layouts(),
    NavigationPreview(),
    Pickers(),
    Surfaces(),
    Additional(),
  ];
}
