import 'package:fluent_ui/fluent_ui.dart' hide Card;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveCard extends CoreAdaptiveComponent {
  const AdaptiveCard({
    this.color,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.padding,
    this.margin,
    this.child,
    this.surfaceTintColor,
    this.shape,
    super.builders,
    super.key,
  });

  /// The background color of the card.
  final Color? color;

  /// The color of the shadow cast by the card.
  final Color? shadowColor;

  /// The clipping behavior applied to the card.
  final Clip? clipBehavior;

  /// The margin around the card.
  final EdgeInsetsGeometry? margin;

  /// The padding within the card.
  final EdgeInsetsGeometry? padding;

  /// The shape of the card.
  final ShapeBorder? shape;

  /// The elevation (z-coordinate) of the card, controlling the shadow intensity.
  final double? elevation;

  /// The tint color applied to the card's surface.
  final Color? surfaceTintColor;

  /// The child widget contained within the card.
  final Widget? child;

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    return _card(
      platformColor: theme.cardColor,
      platformBorder: Border.all(color: theme.resources.cardStrokeColorDefault),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return _card(
      platformColor: MacosColors.windowBackgroundColor,
      platformBorder: Border.all(color: MacosColors.controlAccentColor),
    );
  }

  Widget _card({
    BoxBorder? platformBorder,
    required Color platformColor,
  }) {
    return Card(
      margin: margin,
      elevation: elevation,
      clipBehavior: clipBehavior,
      surfaceTintColor: surfaceTintColor,
      shape: shape ?? platformBorder,
      color: color ?? platformColor,
      shadowColor: shadowColor,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
