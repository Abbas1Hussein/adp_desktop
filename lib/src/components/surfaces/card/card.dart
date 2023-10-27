import 'package:fluent_ui/fluent_ui.dart' hide Card;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveCard extends CoreAdaptiveComponent {
  /// The card's background color.
  final Color? color;

  /// The color to paint the shadow below the card.
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation.
  final Color? surfaceTintColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double? elevation;

  /// The shape of the card's.
  final ShapeBorder? shape;

  /// Whether to paint the [shape] border in front of the [child].
  final bool borderOnForeground;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  /// The empty space that surrounds the card.
  final EdgeInsetsGeometry? margin;

  /// The empty space that inside the card.
  final EdgeInsetsGeometry? padding;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  final bool semanticContainer;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  const AdaptiveCard({
    this.color,
    this.surfaceTintColor,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.shape,
    this.margin,
    this.padding,
    this.child,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    super.builders,
    super.key,
  });

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);
    return _card(
      platformColor: theme.cardColor,
      platformShape: Border.all(color: theme.resources.cardStrokeColorDefault),
      platformSurfaceTintColor: theme.cardColor.withOpacity(0.5),
    );
  }

  @override
  Widget macos(BuildContext context) {
    final isDark = MacosTheme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return _card(
        platformColor: MacosColors.windowBackgroundColor,
        platformSurfaceTintColor:
            MacosColors.windowBackgroundColor.withOpacity(0.5),
      );
    } else {
      return _card(
        platformColor: CupertinoColors.systemBackground,
        platformSurfaceTintColor:
            CupertinoColors.systemBackground.withOpacity(0.5),
        platformElevation: 1.8,
      );
    }
  }

  Widget _card({
    Color? platformColor,
    Color? platformSurfaceTintColor,
    double? platformElevation,
    ShapeBorder? platformShape,
  }) {
    return Card(
      color: color ?? platformColor,
      elevation: elevation ?? platformElevation ?? 0.5,
      surfaceTintColor: surfaceTintColor ?? platformSurfaceTintColor,
      shape: shape ?? platformShape,
      margin: margin,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      borderOnForeground: borderOnForeground,
      child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
    );
  }
}
