import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/physics.dart';

import '../../core/common/construct/component.dart';

/// the transition involves scaling and fading effects.
///
/// See also:
///
/// * [AdaptiveHorizontalSlideTransition] for a horizontal slide transition.
/// * [AdaptiveEntranceTransition] for a entrance transition.
class AdaptivePageTransition extends CoreAdaptiveComponent {
  const AdaptivePageTransition({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key);

  /// The widget to be animated
  final Widget child;

  /// The animation to drive this transition
  final Animation<double> animation;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {

    TransitionRoute;
    return DrillInPageTransition(
      animation: CurvedAnimation(
        parent: animation,
        curve: FluentTheme.of(context).animationCurve,
      ),
      child: child,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    if (animation.status == AnimationStatus.reverse) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.linearToEaseOut,
        ),
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linearToEaseOut,
          ),
          child: child,
        ),
      );
    }

    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: const _SubtleBounceCurve(),
      ),
      child: FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInSine),
        child: child,
      ),
    );
  }
}

class _SubtleBounceCurve extends Curve {
  const _SubtleBounceCurve();

  @override
  double transform(double t) {
    final simulation = SpringSimulation(
      const SpringDescription(damping: 80, mass: 3.0, stiffness: 180),
      0.0,
      1.0,
      0.1,
    );
    return simulation.x(t) + t * (1 - simulation.x(1.0));
  }
}
