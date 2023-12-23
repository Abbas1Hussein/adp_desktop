import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';

class AdaptiveIcon extends CoreAdaptiveComponent {
  const AdaptiveIcon(
    this.adaptiveIcons, {
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    super.key,
    super.builders,
  })  : cupertino = null,
        fluent = null;

  /// Creates a new adaptive icon with specific icons for each platform.
  ///
  /// - On Windows: [fluent] icon is used.
  /// - On Macos: [cupertino]  icon is used.
  const AdaptiveIcon.custom({
    required this.fluent,
    required this.cupertino,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    super.key,
    super.builders,
  }) : adaptiveIcons = null;

  /// The size of the icon in logical pixels.
  final double? size;

  /// The color of the icon.
  final Color? color;

  /// Semantic label for the icon.
  final String? semanticLabel;

  /// icons used for different platforms.
  final AdpIcons? adaptiveIcons;

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

  /// The Fluent UI icon data to be displayed on Windows.
  ///
  /// used on [AdaptiveIcon.custom].
  final IconData? fluent;

  /// The Cupertino icon data to be displayed on macOS.
  ///
  /// used on [AdaptiveIcon.custom].
  final IconData? cupertino;

  @override
  Widget macos(BuildContext context) {
    final icon = cupertino ?? adaptiveIcons?.cupertino;
    return MacosIcon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }

  @override
  Widget windows(BuildContext context) {
    final icon = fluent ?? adaptiveIcons?.fluent;
    return Icon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
