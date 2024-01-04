import 'package:fluent_ui/fluent_ui.dart';

import '../transition/transition.dart';

typedef PageRouteBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
);

enum AdaptiveTransition { entrance, horizontal , page}

class AdaptivePageRoute extends PageRoute {
  AdaptivePageRoute({
    super.settings,
    super.barrierDismissible,
    super.fullscreenDialog,
    super.allowSnapshotting,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    this.transition = AdaptiveTransition.page,
    required this.builder,
  })  : _barrierColor = barrierColor,
        _barrierLabel = barrierLabel,
        _maintainState = maintainState;

  final AdaptiveTransition transition;
  final PageRouteBuilder builder;

  @override
  Color? get barrierColor => _barrierColor;
  final Color? _barrierColor;

  @override
  String? get barrierLabel => _barrierLabel;
  final String? _barrierLabel;

  @override
  bool get maintainState => _maintainState;
  final bool _maintainState;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      builder(context, animation, secondaryAnimation);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (transition) {
      case AdaptiveTransition.entrance:
        return AdaptiveEntranceTransition(
          secondaryAnimation: secondaryAnimation,
          animation: animation,
          child: child,
        );
      case AdaptiveTransition.horizontal:
        return AdaptiveHorizontalSlideTransition(
          secondaryAnimation: secondaryAnimation,
          animation: animation,
          child: child,
        );
      case AdaptiveTransition.page:
        return AdaptivePageTransition(
          secondaryAnimation: secondaryAnimation,
          animation: animation,
          child: child,
        );
    }
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);
}


