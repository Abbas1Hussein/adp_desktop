import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../core/common/construct/component.dart';

class AdaptiveHorizontalSlideTransition extends CoreAdaptiveComponent {
  const AdaptiveHorizontalSlideTransition({
    Key? key,
    required this.child,
    required this.animation,
    required this.secondaryAnimation,
    this.fromLeft = true,
  }) : super(key: key);

  final Widget child;
  final bool fromLeft;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;

  @override
  Widget macos(BuildContext context) {
    return CupertinoPageTransition(
      linearTransition: fromLeft,
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      child: child,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return HorizontalSlidePageTransition(
      animation: animation,
      fromLeft: fromLeft,
      child: child,
    );
  }
}
