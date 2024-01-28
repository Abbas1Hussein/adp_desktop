import 'package:adp_desktop/adp_desktop.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'bottom_sheet.dart';
import 'card.dart';
import 'dialog.dart';
import 'list_tile.dart';

class Surfaces extends StatelessWidget {
  const Surfaces({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomTitle(
            path: HighlightPaths.listTile,
            title: 'List Tile',
            message:
                'AdaptiveListTile: A widget for displaying a single fixed-height row that typically contains some text as well as a leading or trailing icon.',
          ),
          ListTitlePreview(),
          CustomTitle(
            path: HighlightPaths.card,
            title: 'Card',
            message:
                'AdaptiveCard: A widget that represents a material design card. It\'s a surface used to display content that is independent of the surrounding content.',
          ),
          CardPreview(),
          CustomTitle(
            path: HighlightPaths.dialog,
            title: 'Dialog',
            message:
                'AdaptiveDialog: A type of modal window that appears in front of app content to provide critical information or ask for a decision.',
          ),
          DialogPreview(),
          CustomTitle(
            path: HighlightPaths.bottomSheet,
            title: 'Bottom Sheet',
            message:
                'AdaptiveBottomSheet: An alternative to a menu or a dialog that appears at the bottom of the screen. It prevents the user from interacting with the rest of the app.',
          ),
          BottomSheetPreview(),
          CustomTitle(
            title: 'Divider',
            message:
                'AdaptiveDivider: A horizontal or vertical line used to separate content.',
          ),
          AdaptiveDivider(size: double.infinity),
          AdaptiveTooltip(
            message:
                'AdaptiveTooltip: A widget that shows a message on mouse hover or long press event.',
            child: CustomTitle(
              title: 'Tooltip',
              message:
                  'AdaptiveTooltip: A widget that shows a message on mouse hover or long press event.',
              useBackgroundColor: true,
            ),
          ),
        ],
      ),
    );
  }
}
