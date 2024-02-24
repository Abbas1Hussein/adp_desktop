import 'package:adp_desktop/adp_desktop.dart';

class TitleBarPreview extends StatelessWidget {
  const TitleBarPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTitleBar(
      config: AdaptiveTitleBarConfig(
        appIcon: const SizedBox.shrink(),
        appTitle: Text(
          'Abbas Hussein',
          style: AdaptiveTypography.of(context).body,
        ),
      ),
      child: AdaptiveScaffoldPage(
        content: Center(
          child: AdaptiveButton(
            child: const Text('back'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
