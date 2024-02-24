import 'package:adp_desktop/adp_desktop.dart';

class TabViewPreview extends StatefulWidget {
  const TabViewPreview({super.key});

  @override
  State<TabViewPreview> createState() => _TabViewPreviewState();
}

class _TabViewPreviewState extends State<TabViewPreview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTabView(
      currentIndex: currentIndex,
      onChanged: (value) {
        setState(() => currentIndex = value);
      },
      tabs: tabs,
      children: List.generate(
        tabs.length,
        (index) => Center(
          child: AdaptiveButton(
            child: tabs[index].label,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  final List<AdaptiveTab> tabs = const [
    AdaptiveTab(label: Text('Main Home')),
    AdaptiveTab(label: Text('Series')),
    AdaptiveTab(label: Text('Movies')),
    AdaptiveTab(label: Text('Watched')),
    AdaptiveTab(label: Text('Favorite')),
    AdaptiveTab(label: Text('Settings')),
  ];
}
