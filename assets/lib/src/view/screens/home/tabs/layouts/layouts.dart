import 'package:adp_desktop/adp_desktop.dart' hide TitleBar;

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/display_button.dart';
import '../../../../widgets/title.dart';
import 'scaffold.dart';
import 'scaffold_page.dart';
import 'title_bar.dart';

class Layouts extends StatelessWidget {
  const Layouts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTitle(
          path: HighlightPaths.scaffold,
          title: 'Scaffold',
          message:
              'AdaptiveScaffold: This layout, sourced from the material library, serves as a top-level container for each route in the application.'
              '\nAdaptiveAppbar: Used to display information and actions relevant to the current page. Features the menu icon, back button, and more.'
              '\nAdaptiveDrawer: A sliding panel that appears horizontally from the edge of a Scaffold, revealing navigation links in the application.',
        ),
        DisplayNavButton(child: Scaffold()),
        CustomTitle(
          path: HighlightPaths.scaffoldPage,
          title: 'Scaffold Page',
          message:
              'AdaptiveScaffoldPage: layout serves as a top-level container for each route in the application.'
              '\nAdaptiveAppbarPage: Illustrates a page featuring an adaptive app bar layout. The app bar is designed to show information and actions related to the current page.',
        ),
        DisplayNavButton(child: ScaffoldPagePreview()),
        if (!PlatformRuining.isWeb)
          CustomTitle(
            path: HighlightPaths.titleBar,
            title: 'Title Bar',
            message: 'AdaptiveTitleBar: A custom title bar widget.',
          ),
        if (!PlatformRuining.isWeb) DisplayNavButton(child: TitleBarPreview()),
      ],
    );
  }
}
