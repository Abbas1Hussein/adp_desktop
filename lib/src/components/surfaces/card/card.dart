import 'package:fluent_ui/fluent_ui.dart' hide Card;
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

const BorderRadius _kCardBorderRadius = BorderRadius.all(Radius.circular(12.0));

class AdaptiveCard extends CoreAdaptiveComponent {
  const AdaptiveCard({
    super.builders,
    super.key,
    this.shape,
    this.color,
    this.child,
    this.margin,
    this.alignment,
    this.foregroundShape,
    this.clipBehavior = Clip.none,
    this.padding = const EdgeInsets.all(8),
  });

  /// The card's background color.
  final Color? color;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The shape of the adp card.
  final ShapeDecoration? shape;

  /// The foreground shape of the adp card.
  final ShapeDecoration? foregroundShape;

  /// Align the [child] within the card.
  ///
  /// If non-null, the card will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Ignored if [child] is null.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry? alignment;

  /// The empty space that surrounds the card.
  ///
  /// Defines the card's outer [Container.margin].
  ///
  /// If that's null, the default margin is 4.0
  /// logical pixels on all sides: `EdgeInsets.all(4.0)`.
  final EdgeInsetsGeometry? margin;

  /// The empty space that inside the card.
  ///
  /// Defines the card's inner [Container.padding].
  ///
  /// If that's null, the default padding is 8.0
  /// logical pixels on all sides: `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry padding;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// If that's null then the behavior will be [Clip.none].
  final Clip clipBehavior;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    return _card(
      platformColor: theme.cardColor,
      platformShape: RoundedRectangleBorder(
        borderRadius: _kCardBorderRadius,
        side: BorderSide(color: theme.resources.cardStrokeColorDefault),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final theme = MacosTheme.of(context);

    return _card(
      platformColor: theme.brightness.resolve(
        CupertinoColors.white,
        CupertinoColors.quaternarySystemFill,
      ),
      platformShape: RoundedRectangleBorder(
        borderRadius: _kCardBorderRadius,
        side: BorderSide(
          color: theme.dividerColor,
          width: 0.5,
          style: theme.brightness == Brightness.dark
              ? BorderStyle.none
              : BorderStyle.solid,
        ),
      ),
    );
  }

  Widget _card({
    required Color platformColor,
    required ShapeBorder platformShape,
  }) {
    return Container(
      margin: margin,
      padding: padding,
      alignment: alignment,
      clipBehavior: clipBehavior,
      decoration: shape ??
          ShapeDecoration(shape: platformShape, color: color ?? platformColor),
      foregroundDecoration: foregroundShape,
      child: child,
    );
  }
}
