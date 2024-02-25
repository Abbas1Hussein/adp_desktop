import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../core/common/construct/component.dart';

/// An entrance transition that combines a slide-up animation with a fade-in effect
/// for incoming content. This is particularly useful for page transitions where
/// the user is taken to the top of a navigational stack, such as switching tabs
/// or navigating between left-nav items.
///
/// See also:
///
/// * [AdaptiveHorizontalSlideTransition] for a horizontal slide transition.
class AdaptiveEntranceTransition extends CoreAdaptiveComponent {
  /// Creates an adp entrance transition.
  ///
  ///  * `animation` is a linear route animation from 0.0 to 1.0
  ///    when this screen is being pushed.
  ///  * `secondaryAnimation` is a linear route animation from 0.0 to 1.0
  ///    when another screen is being pushed on top of this one.
  const AdaptiveEntranceTransition({
    Key? key,
    required this.child,
    required this.animation,
    required this.secondaryAnimation,
  }) : super(key: key);

  /// The widget to apply the entrance transition to.
  final Widget child;

  /// The primary animation for the entrance transition.
  final Animation<double> animation;

  /// The secondary animation for the entrance transition.
  final Animation<double> secondaryAnimation;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return EntrancePageTransition(animation: animation, child: child);
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return CupertinoFullscreenDialogTransition(
      secondaryRouteAnimation: secondaryAnimation,
      primaryRouteAnimation: animation,
      linearTransition: true,
      child: child,
    );
  }
}
