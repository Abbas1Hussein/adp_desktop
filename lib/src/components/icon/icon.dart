import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';

class AdaptiveIcon extends CoreAdaptiveComponent {
  /// Creates an adp icon.
  ///
  /// The [size] and [color] default to the value given by the current platform Theme.
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
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current platform theme size,
  /// if any defaults to 24.0.
  final double? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current [AdaptiveIconTheme] color, if any.
  final Color? color;

  /// The icon to display, used for different platforms.
  /// The available icons are described in [CupertinoIcons], [FluentIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final AdpIcons? adaptiveIcons;

  /// The Fluent UI icon data to be displayed on Windows [FluentIcons].
  ///
  /// used on [AdaptiveIcon.custom].
  final IconData? fluent;

  /// The Cupertino icon data to be displayed on macOS [CupertinoIcons].
  ///
  /// used on [AdaptiveIcon.custom].
  final IconData? cupertino;

  /// Semantic label for the icon.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

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

