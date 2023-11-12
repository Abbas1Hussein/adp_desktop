import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';

export 'icons.dart';

/// An adaptive icon that displays different icons on different platforms.
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

  /// The size of the icon in logical pixels.
  final double? size;

  /// The color of the icon.
  final Color? color;

  /// Semantic label for the icon.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

  /// The adaptive icons to use.
  final AdaptiveIcons? adaptiveIcons;

  /// Creates a new adaptive icon with specific icons for each platform.
  const AdaptiveIcon.specific({
    required this.fluentIcon,
    required this.cupertinoIcon,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    super.key,
    super.builders,
  }) : adaptiveIcons = null;

  /// The icon to display on Windows.
  final IconData? fluentIcon;

  /// The icon to display on iOS and macOS.
  final IconData? cupertinoIcon;

  @override
  Widget macos(BuildContext context) {
    return MacosIcon(
      cupertinoIcon ?? adaptiveIcons?.cupertino,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return Icon(
      fluentIcon ?? adaptiveIcons?.fluent,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
