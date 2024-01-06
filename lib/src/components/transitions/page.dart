import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/physics.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';

class AdaptivePageTransition extends CoreAdaptiveComponent {
  const AdaptivePageTransition({
    Key? key,
    required this.child,
    required this.animation,
    required this.secondaryAnimation,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;

  @override
  Widget macos(BuildContext context) {
    MacosAlertDialog;

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

  @override
  Widget windows(BuildContext context) {
    return DrillInPageTransition(
      animation: CurvedAnimation(
        parent: animation,
        curve: FluentTheme.of(context).animationCurve,
      ),
      child: child,
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
