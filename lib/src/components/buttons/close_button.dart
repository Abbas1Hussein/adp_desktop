import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/builders.dart';
import '../icon/icon.dart';
import '../icon/icons.dart';
import 'icon_button/icon_button.dart';

class AdaptiveCloseButton extends StatelessWidget {
  const AdaptiveCloseButton({
    super.key,
    this.color,
    this.hoverColor,
    this.afterBack,
    this.onPressed,
    this.mouseCursor = SystemMouseCursors.click,
  });

  /// Defines the color of the close button.
  final Color? color;

  /// The color of the button's background when the mouse hovers over it.
  final Color? hoverColor;

  /// Defines the mouse cursor to be displayed when hovering over the close button.
  final MouseCursor mouseCursor;

  /// Callback function to be executed after navigating close.
  final VoidCallback? afterBack;

  /// Callback function triggered when the close button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final closeLabel = MaterialLocalizations.of(context).closeButtonLabel;
    return MouseRegion(
      cursor: mouseCursor,
      child: Semantics(
        button: true,
        label: closeLabel,
        child: AdaptiveIconButton(
          color: color,
          hoverColor: hoverColor,
          builders: AdaptiveBuilder(
            windows: (platformChild, theme, property) {
              return Tooltip(message: closeLabel, child: platformChild);
            },
            macos: (platformChild, theme, property) {
              return MacosTooltip(message: closeLabel, child: platformChild);
            },
          ),
          icon: const AdaptiveIcon(AdpIcons.clear),
          onPressed: () => _onTap(context),
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    onPressed?.call();

    final canPop = await Navigator.maybePop(context);

    if (canPop) afterBack?.call();
  }
}
