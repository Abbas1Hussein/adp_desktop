import 'package:fluent_ui/fluent_ui.dart';

import '../../additional/color.dart';

/// Drawers are typically used with the [Scaffold.drawer] property. The child of
/// the drawer is usually a [ListView] whose first child is a [DrawerHeader]
/// that displays status information about the current user. The remaining
/// drawer children are often constructed with [AdaptiveListTile]s, often concluding
/// with an [AboutListTile].
///
/// The [AdaptiveAppBar] automatically displays an appropriate [AdaptiveIconButton] to show the
/// [AdaptiveDrawer] when a [AdaptiveDrawer] is available in the [AdaptiveScaffold]. The [AdaptiveScaffold]
/// automatically handles the edge-swipe gesture to show the drawer.
///
/// An open drawer may be closed with a swipe to close gesture, pressing the
/// escape key, by tapping the scrim, or by calling pop route function such as
/// [Navigator.pop]. For example a drawer item might close the drawer when tapped:
///
/// ```dart
/// AdaptiveListTile(
///   leading: const AdaptiveIcon(AdpIcons.archive),
///   title: const Text('Change history'),
///   onTap: () {
///     // change app state...
///     Navigator.pop(context); // close the drawer
///   },
/// );
/// ```
///
/// See also:
///
///  * [Scaffold.drawer], where one specifies a [Drawer] so that it can be
///    shown.
///  * [Scaffold.of], to obtain the current [ScaffoldState], which manages the
///    display and animation of the drawer.
///  * [ScaffoldState.openDrawer], which displays its [Drawer], if any.
///  * <https://material.io/design/components/navigation-drawer.html>
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

  /// Sets the color that holds all of the [AdaptiveDrawer]'s
  /// contents.
  ///
  /// If this is null, then [handelBackgroundColor] is used.
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

  /// The shape of the drawer.
  final BoxShape? shape;

  /// The width of the drawer.
  ///
  /// Default to 300px.
  final double width;

  /// The widget below this widget in the tree.
  final Widget? child;

  /// The target border radius of the rounded corners for a rectangle shape.
  final BorderRadius? borderRadius;

  /// The semantic label of the drawer used by accessibility frameworks to
  /// announce screen transitions when the drawer is opened and closed.
  final String? semanticLabel;

  /// The [clipBehavior] argument specifies how to clip the drawer's [shape].
  ///
  /// If the drawer has a [shape], it defaults to [Clip.hardEdge]. Otherwise,
  /// defaults to [Clip.none].
  final Clip clipBehavior;

  static const _kDrawerDuration = Duration(milliseconds: 300);

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
        duration: _kDrawerDuration,
        borderRadius: borderRadius ?? BorderRadius.zero,
        color: handelBackgroundColor(backgroundColor, context),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: width),
          child: child,
        ),
      ),
    );
  }
}
