import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../core/common/construct/component.dart';

/// An adaptive transition that combines a horizontal slide animation with
/// smooth transitions, The page slides in from the right, exits
/// in reverse, and exhibits a parallax motion to the left when covered by
/// another page.
///
/// See also:
///
/// * [AdaptiveEntranceTransition] for a entrance transition.
class AdaptiveHorizontalSlideTransition extends CoreAdaptiveComponent {
  /// Creates an adaptive horizontal slide transition.
  ///
  ///  * `fromLeft` determines the direction of the slide, true for left-to-right,
  ///    false for right-to-left.
  ///  * `animation` is a linear route animation from 0.0 to 1.0 when this screen
  ///    is being pushed.
  ///  * `secondaryAnimation` is a linear route animation from 0.0 to 1.0 when
  ///    another screen is being pushed on top of this one.
  const AdaptiveHorizontalSlideTransition({
    Key? key,
    required this.child,
    required this.animation,
    required this.secondaryAnimation,
    this.fromLeft = true,
  }) : super(key: key);

  /// The widget to which the horizontal slide transition is applied.
  final Widget child;

  /// Determines the direction of the horizontal slide transition.
  /// True for left-to-right, false for right-to-left.
  final bool fromLeft;

  /// The primary animation for the horizontal slide transition.
  final Animation<double> animation;

  /// The secondary animation for the horizontal slide transition.
  final Animation<double> secondaryAnimation;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return HorizontalSlidePageTransition(
      animation: animation,
      fromLeft: fromLeft,
      child: child,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return CupertinoPageTransition(
      linearTransition: fromLeft,
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      child: child,
    );
  }
}
