import 'package:fluent_ui/fluent_ui.dart';

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
    if (animation.status == AnimationStatus.reverse) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: child,
      );
    }

    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.ease),
      child: child,
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
