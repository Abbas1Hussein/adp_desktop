import 'package:adp_desktop/adp_desktop.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'basic_buttons.dart';
import 'menus.dart';
import 'navigation_buttons.dart';
import 'selection_buttons.dart';
import 'window_control_buttons.dart';

class ButtonsTab extends StatelessWidget {
  const ButtonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CustomTitle(
            path: HighlightPaths.basicButtonsTab,
            title: 'Basic Buttons',
            message: 'AdaptiveButton: A basic button widget.'
                '\nAdaptiveButton.filled: A filled style colored button.'
                '\nAdaptiveButton.outlined: An outlined style button.'
                '\nAdaptiveTextButton: A text button.'
                '\nAdaptiveIconButton: An icon button.',
          ),
          BasicButtonsPreview(),
          CustomTitle(
            path: HighlightPaths.selectionButtonsTab,
            title: 'Selection Buttons',
            message:
                'AdaptiveCheckbox: A checkbox is a type of button that lets the user choose between two opposite states, actions, or values.'
                '\nAdaptiveSwitch: The switch represents a physical switch that allows users to turn things on or off, like a light switch.'
                '\nAdaptiveRadio: A radio select one option from a collection of two or more mutually exclusive.',
          ),
          SelectionButtons(),
          CustomTitle(
            path: HighlightPaths.menusButtonsTab,
            title: 'Menus Buttons',
            message:
                'AdaptivePulldownMenuButton: A button that opens a pulldown menu with multiple options.'
                '\nAdaptivePulldownMenuButton.singleChoice: A button that opens a pulldown menu with a single choice.'
                '\nAdaptivePopupMenuButton: A button that opens a popup menu with multiple options.',
          ),
          MenusButtonsPreview(),
          if (!PlatformRuining.isWeb)
            CustomTitle(
              path: HighlightPaths.windowControlButtonsTab,
              title: 'Window Control Buttons',
              message:
                  'AdaptiveWindowButtons: Buttons for controlling the window, such as minimizing, maximizing, and closing.'
                  '\nAdaptiveCloseWindowButton: A button for closing the window.'
                  '\nAdaptiveMaximizeWindowButton: A button for maximizing the window.'
                  '\nAdaptiveMinimizeWindowButton: A button for minimizing the window.',
            ),
          if (!PlatformRuining.isWeb) WindowControlButtonsPreview(),
          CustomTitle(
            path: HighlightPaths.navigationButtonsTab,
            title: 'Navigation Buttons',
            message: 'AdaptiveBackButton: A button for navigating back.'
                '\nAdaptiveCloseButton: A button for closing the current screen or window.',
          ),
          NavigationButtonsPreview(),
        ],
      ),
    );
  }
}
