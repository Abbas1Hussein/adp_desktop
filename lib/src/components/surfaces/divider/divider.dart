import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveDivider extends CoreAdaptiveComponent {
  const AdaptiveDivider({
    super.key,
    this.color,
    this.size = 20.0,
    this.thickness = 1,
    this.direction = Axis.horizontal,
  });

  /// The size of the divider.
  final double size;

  /// The backgroundColor of the divider.
  final Color? color;

  /// The thickness of the divider.
  final double thickness;

  /// The current direction of the divider.
  ///
  /// Defaults is [Axis.horizontal].
  final Axis direction;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return Divider(
      size: size,
      direction: direction,
      style: DividerThemeData(
        thickness: thickness,
        horizontalMargin: EdgeInsets.zero,
        verticalMargin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: color ??
              FluentTheme.of(context).resources.dividerStrokeColorDefault,
        ),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return SizedBox(
      height: direction == Axis.horizontal ? thickness : size,
      width: direction == Axis.vertical ? thickness : size,
      child: ColoredBox(
        color: color ??
            MacosTheme.of(context).brightness.resolve(
                  MacosColors.disabledControlTextColor.highContrastColor,
                  MacosColors.disabledControlTextColor.darkColor,
                ),
      ),
    );
  }
}
