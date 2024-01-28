import 'package:adp_desktop/adp_desktop.dart';

class NavigationViewPreview extends StatefulWidget {
  const NavigationViewPreview({Key? key}) : super(key: key);

  @override
  State<NavigationViewPreview> createState() => _NavigationViewPreviewState();
}

class _NavigationViewPreviewState extends State<NavigationViewPreview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationView(
      appBar: AdaptiveNavigationAppBar(
        title: const Text('Abbas Hussein'),
        actions: [
          AdaptiveActionButton(
            onPressed: () {},
            label: 'Button 4',
            icon: const AdaptiveIcon(AdpIcons.add),
          ),
          AdaptiveActionButton(
            onPressed: () {},
            label: 'Button 3',
            icon: const AdaptiveIcon(AdpIcons.delete),
          ),
          AdaptiveActionButton(
            onPressed: () {},
            label: 'Button 2',
            icon: const AdaptiveIcon(AdpIcons.edit),
          ),
          AdaptiveActionButton(
            onPressed: () {},
            label: 'Button 1',
            icon: const AdaptiveIcon(AdpIcons.download),
          ),
        ],
      ),
      sidebar: AdaptiveNavigationSidebar(
        currentIndex: currentIndex,
        onChanged: (value) {
          setState(() => currentIndex = value);
        },
        items: items,
      ),
      children: List.generate(
        items.length,
        (index) => Center(
          child: AdaptiveButton(
            child: items[index].label,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  final List<AdaptiveNavigationSidebarItem> items = const [
    AdaptiveNavigationSidebarItem(
      label: Text('Main Home'),
      icon: AdaptiveIcon(AdpIcons.home),
    ),
    AdaptiveNavigationSidebarItem(
      label: Text('Series'),
      icon: AdaptiveIcon(AdpIcons.bookFilled),
    ),
    AdaptiveNavigationSidebarItem(
      label: Text('Movies'),
      icon: AdaptiveIcon(AdpIcons.book),
    ),
    AdaptiveNavigationSidebarItem(
      label: Text('Watched'),
      icon: AdaptiveIcon(AdpIcons.circle),
    ),
    AdaptiveNavigationSidebarItem(
      label: Text('Favorite'),
      icon: AdaptiveIcon(AdpIcons.moon),
    ),
    AdaptiveNavigationSidebarItem(
      label: Text('Settings'),
      icon: AdaptiveIcon(AdpIcons.settings),
    ),
  ];
}
