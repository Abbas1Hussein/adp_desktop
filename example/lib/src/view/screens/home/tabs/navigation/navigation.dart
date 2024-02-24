import 'package:adp_desktop/adp_desktop.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/display_button.dart';
import '../../../../widgets/title.dart';
import 'navigation_view.dart';
import 'tab_view.dart';

class NavigationPreview extends StatelessWidget{
  const NavigationPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTitle(
          path: HighlightPaths.navigationView,
          title: 'Navigation View',
          message: 'AdaptiveNavigationView: The NavigationView control provides top-level navigation for your app.',
        ),
        DisplayNavButton(child: NavigationViewPreview()),
        CustomTitle(
          path: HighlightPaths.tabView,
          title: 'Tab View',
          message: 'AdaptiveTabView: is a way to display a set of tabs and their respective content.',
        ),
        DisplayNavButton(child: TabViewPreview()),
      ],
    );
  }
}
