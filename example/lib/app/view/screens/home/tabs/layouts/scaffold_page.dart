import 'package:adp_desktop/adp_desktop.dart';

class ScaffoldPagePreview extends StatelessWidget {
  const ScaffoldPagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: AdaptiveAppBarPage(
        title: const Text('Appbar Page'),
        actions: List.generate(
          labels.length,
          (index) {
            return AdaptiveActionButton(
              label: (labels[index] as Text).data!,
              icon: AdaptiveIcon(icons[index]),
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }

  List<AdpIcons> get icons {
    return const [
      AdpIcons.home,
      AdpIcons.bookFilled,
      AdpIcons.book,
      AdpIcons.circle,
      AdpIcons.moon,
      AdpIcons.settings,
    ];
  }

  List<Widget> get labels {
    return const [
      Text('Main Home'),
      Text('Series'),
      Text('Movies'),
      Text('Watched'),
      Text('Favorite'),
      Text('Settings'),
    ];
  }
}
