import 'package:fluent_ui/fluent_ui.dart' hide Card;
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveCard extends CoreAdaptiveComponent {
  const AdaptiveCard({
    this.color,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.margin,
    this.border,
    this.child,
    super.builders,
    super.key,
  });

  /// The card's background color.
  final Color? color;

  /// The color to paint the shadow below the card.
  final Color? shadowColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double? elevation;

  final BorderRadius? borderRadius;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  /// The empty space that surrounds the card.
  final EdgeInsetsGeometry? margin;

  /// The empty space that inside the card.
  final EdgeInsetsGeometry? padding;

  final BoxBorder? border;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    return _card(
      platformColor: theme.cardColor,
      platformBorder: Border.all(color: theme.resources.cardStrokeColorDefault),
      platformElevation: 2.0,
    );
  }

  @override
  Widget macos(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context) == Brightness.dark;

    return _card(
      platformColor: MacosColors.windowBackgroundColor,
      platformElevation: 8.0,
    );
  }

  Widget _card({
    double? platformElevation,
    BoxBorder? platformBorder,
    required Color platformColor,
  }) {
    return PhysicalModel(
      borderRadius: borderRadius,
      color: color ?? platformColor,
      clipBehavior: clipBehavior ?? Clip.none,
      elevation: platformElevation ?? elevation ?? 0.5,
      shadowColor: shadowColor ?? const Color(0xFF000000),
      child: Container(
        clipBehavior: clipBehavior ?? Clip.none,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color ?? platformColor,
          border: border ?? platformBorder,
        ),
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}
