import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';

export 'icons.dart';

/// A custom icon widget that adapts its appearance based on the platform.
class AdaptiveIcon extends CoreAdaptiveComponent {
  const AdaptiveIcon(
    this.adaptiveIcons, {
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    super.key,
    super.builders,
  })  : cupertinoIcon = null,
        fluentIcon = null;

  /// Creates a new adaptive icon with specific icons for each platform.
  ///
  /// - On Windows: [fluentIcon] is used.
  /// - On Macos: [cupertinoIcon] is used.
  const AdaptiveIcon.custom({
    required this.fluentIcon,
    required this.cupertinoIcon,
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

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

  /// icons used for different platforms.
  final AdpIcons? adaptiveIcons;

  /// The Fluent UI icon data to be displayed on Windows.
  ///
  /// used on [AdaptiveIcon.custom].
  final IconData? fluentIcon;

  /// The Cupertino icon data to be displayed on macOS.
  ///
  /// used on [AdaptiveIcon.custom].
  final IconData? cupertinoIcon;

  @override
  Widget macos(BuildContext context) {
    final icon = cupertinoIcon ?? adaptiveIcons?.cupertino;
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
    final icon = fluentIcon ?? adaptiveIcons?.fluent;
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
