import 'package:fluent_ui/fluent_ui.dart';

import '../transitions/transitions.dart';

/// A function type for building a page route widget.
typedef PageRouteBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
);

/// An enumeration representing different adaptive transition types.
enum AdaptiveTransition { entrance, horizontal, page }

/// A modal route that replaces the entire screen with a platform-adaptive
/// transition.
///
///
/// By default, when a modal route is replaced by another, the previous route
/// remains in memory. To free all the resources when this is not necessary, set
/// [maintainState] to false.
///
/// If `barrierDismissible` is true, then pressing the escape key on the keyboard
/// will cause the current route to be popped with null as the value.
///
/// The type `T` specifies the return type of the route which can be supplied as
/// the route is popped from the stack via [Navigator.pop] by providing the
/// optional `result` argument.
class AdaptivePageRoute<T> extends PageRoute<T> {
  AdaptivePageRoute({
    super.settings,
    super.barrierDismissible,
    super.allowSnapshotting,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = false,
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
        return AdaptivePageTransition(animation: animation, child: child);
    }
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);
}
