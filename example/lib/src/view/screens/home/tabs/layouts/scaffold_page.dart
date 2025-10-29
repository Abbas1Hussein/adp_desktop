import 'package:adp_desktop/adp_desktop.dart';

class ScaffoldPagePreview extends StatelessWidget {
  const ScaffoldPagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: AdaptiveAppBarPage(
        title: const Text('Appbar Page'),
        actions: List.generate(labels.length, (index) {
          return AdaptiveActionButton(
            label: labels[index],
            icon: AdaptiveIcon(icons[index]),
            onPressed: () {},
          );
        }),
      ),
      content: const Center(child: Text("Give us a star")),
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

  List<String> get labels {
    return const [
      'Main Home',
      'Series',
      'Movies',
      'Watched',
      'Favorite',
      'Settings',
    ];
  }
}
