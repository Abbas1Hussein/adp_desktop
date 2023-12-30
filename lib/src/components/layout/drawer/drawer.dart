import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../additional/color.dart';

class AdaptiveDrawer extends StatelessWidget {
  /// Creates a ADP Design drawer.
  ///
  /// Typically used in the [AdaptiveScaffold.drawer] property.
  ///
  /// The [elevation] must be non-negative.
  const AdaptiveDrawer({
    super.key,
    this.child,
    this.shape,
    this.width = 300,
    this.elevation = 0,
    this.semanticLabel,
    this.backgroundColor,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.shadowColor = const Color(0xFF000000),
  }) : assert(elevation >= 0.0);

  final Color? backgroundColor;

  /// The z-coordinate at which to place this drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  ///
  /// Defaults to 0.
  final double elevation;

  /// The color used to paint a drop shadow under the drawer's which reflects the drawer's [elevation].
  ///
  ///
  /// See also:
  ///   * [elevation], which affects how the drop shadow is painted.
  final Color shadowColor;

  /// The target border radius of the rounded corners for a rectangle shape.
  final BorderRadius? borderRadius;

  /// The shape of the drawer.
  final BoxShape? shape;

  /// The width of the drawer.
  ///
  /// Default to 300px.
  final double width;

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The semantic label of the drawer used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  final String? semanticLabel;

  /// The [clipBehavior] argument specifies how to clip the drawer's [shape].
  ///
  /// If the drawer has a [shape], it defaults to [Clip.hardEdge]. Otherwise,
  /// defaults to [Clip.none].
  final Clip clipBehavior;

  static const kAdaptiveDrawerDuration = Duration(milliseconds: 300);

  static const kAdaptiveDrawerRadius = BorderRadius.only(
      topRight: Radius.circular(12.0), bottomRight: Radius.circular(12.0));

  @override
  Widget build(BuildContext context) {
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: semanticLabel,
      child: AnimatedPhysicalModel(
        elevation: elevation,
        shadowColor: shadowColor,
        shape: BoxShape.rectangle,
        clipBehavior: clipBehavior,
        curve: Curves.fastOutSlowIn,
        duration: kAdaptiveDrawerDuration,
        borderRadius: borderRadius ?? kAdaptiveDrawerRadius,
        color: handelBackgroundColor(backgroundColor, context),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: width),
          child: child,
        ),
      ),
    );
  }
}
