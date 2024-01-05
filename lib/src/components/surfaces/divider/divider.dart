import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveDivider extends CoreAdaptiveComponent {
  const AdaptiveDivider({
    super.key,
    this.color,
    this.size = 20.0,
    this.direction = Axis.horizontal,
  });

  /// The size of the divider.
  final double size;

  /// The backgroundColor of the divider.
  final Color? color;

  /// The current direction of the divider.
  ///
  /// Defaults is [Axis.horizontal].
  final Axis direction;

  @override
  Widget macos(BuildContext context) {
    return SizedBox(
      height: direction == Axis.horizontal ? 0.5 : size,
      width: direction == Axis.vertical ? 0.5 : size,
      child: ColoredBox(
        color: color ??
            MacosTheme.of(context).brightness.resolve(
                  MacosColors.disabledControlTextColor.highContrastColor,
                  MacosColors.disabledControlTextColor.darkColor,
                ),
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return Divider(
      size: size,
      direction: direction,
      style: color != null
          ? DividerThemeData(decoration: BoxDecoration(color: color))
          : null,
    );
  }
}
