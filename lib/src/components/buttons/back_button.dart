import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

/// A custom back button widget that adapts its appearance based on the platform.
///
/// Use this widget to create back buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosBackButton] is utilized.
/// - On Windows, customize [PaneItem] as [BackButton].
class AdaptiveBackButton extends CoreAdaptiveComponent {
  const AdaptiveBackButton({
    super.key,
    super.builders,
    this.color,
    this.afterBack,
    this.semanticLabel,
    this.mouseCursor,
    this.onPressed,
  });

  /// Callback function triggered when the back button is pressed.
  final VoidCallback? onPressed;

  /// Callback function to be executed after navigating back.
  final VoidCallback? afterBack;

  /// Defines the mouse cursor to be displayed when hovering over the back button.
  final MouseCursor? mouseCursor;

  /// Defines the color of the back button.
  final Color? color;

  /// A semantic label providing accessibility information for the back button.
  final String? semanticLabel;

  @override
  Widget windows(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Builder(
        builder: (context) {
          return ConstrainedBox(
            constraints:
                const BoxConstraints.tightFor(width: 45.0, height: 35.0),
            child: PaneItem(
              mouseCursor: mouseCursor,
              tileColor: color != null ? ButtonState.all(color) : null,
              icon: const Center(child: Icon(FluentIcons.back)),
              title: Text(semanticLabel ?? FluentLocalizations.of(context).backButtonTooltip),
              body: const SizedBox.shrink(),
            ).build(context, true, () => _onTap(context),
                displayMode: PaneDisplayMode.compact),
          );
        },
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MacosTooltip(
        message: MaterialLocalizations.of(context).backButtonTooltip,
        child: MacosBackButton(
          fillColor: color,
          semanticLabel: semanticLabel,
          hoverColor: color?.withOpacity(0.35),
          mouseCursor: mouseCursor ?? SystemMouseCursors.basic,
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
