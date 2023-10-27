import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

final class AdaptiveBackButton extends CoreAdaptiveComponent {
  final Color? color;
  final VoidCallback? onTap;
  final MouseCursor? mouseCursor;

  const AdaptiveBackButton({
    super.key,
    super.builders,
    this.color,
    this.onTap,
    this.mouseCursor,
  });

  @mustCallSuper
  @override
  Widget windows(BuildContext context) {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: 60.0,
          height: 35.0,
          child: PaneItem(
            mouseCursor: mouseCursor,
            tileColor: color != null ? ButtonState.all(color) : null,
            icon: const Center(child: Icon(FluentIcons.back)),
            title: Text(FluentLocalizations.of(context).backButtonTooltip),
            body: const SizedBox.shrink(),
          ).build(context, true, () => onBackTap(context),
              displayMode: PaneDisplayMode.compact),
        );
      },
    );
  }

  @mustCallSuper
  @override
  Widget macos(BuildContext context) {
    return MacosBackButton(
      fillColor: color,
      mouseCursor: mouseCursor,
      onPressed: () => onBackTap(context),
    );
  }

  void onBackTap(BuildContext context) {
    onTap?.call();
    Navigator.maybePop(context);
  }
}
