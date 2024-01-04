import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../core/common/construct/component.dart';


class AdaptiveEntranceTransition extends CoreAdaptiveComponent {
  const AdaptiveEntranceTransition({
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
    return CupertinoFullscreenDialogTransition(
      secondaryRouteAnimation: secondaryAnimation,
      primaryRouteAnimation: animation,
      linearTransition: true,
      child: child,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return EntrancePageTransition(animation: animation, child: child);
  }
}
