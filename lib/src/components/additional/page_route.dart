import 'package:fluent_ui/fluent_ui.dart';

import '../../core/common/adaptive.dart';

class AdaptivePageRoute extends PageRoute {
  AdaptivePageRoute({
    required this.builder,
    super.settings,
    super.barrierDismissible,
    super.fullscreenDialog,
    super.allowSnapshotting,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
  })  : _barrierColor = barrierColor,
        _barrierLabel = barrierLabel,
        _maintainState = maintainState {
    adaptiveValue(
      macos: () => _macosPageRoute = MacosPageRoute(builder: builder),
      windows: () => _windowsPageRoute = FluentPageRoute(builder: builder),
    );
  }

  final WidgetBuilder builder;

  MacosPageRoute get macosPageRoute => _macosPageRoute;
  late MacosPageRoute _macosPageRoute;

  FluentPageRoute get windowsPageRoute => _windowsPageRoute;
  late FluentPageRoute _windowsPageRoute;

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
  Duration get transitionDuration {
    return adaptiveValue(
      macos: () => _macosPageRoute.transitionDuration,
      windows: () => _windowsPageRoute.transitionDuration,
    );
  }

  @override
  Duration get reverseTransitionDuration {
    return adaptiveValue(
      macos: () => _macosPageRoute.reverseTransitionDuration,
      windows: () => _windowsPageRoute.reverseTransitionDuration,
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {


    return adaptiveValue(
      macos: () =>
          _macosPageRoute.buildPage(context, animation, secondaryAnimation),
      windows: () =>
          _windowsPageRoute.buildPage(context, animation, secondaryAnimation),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return adaptiveValue(
      macos: () => _macosPageRoute.buildTransitions(
          context, animation, secondaryAnimation, child),
      windows: () => _windowsPageRoute.buildTransitions(
          context, animation, secondaryAnimation, child),
    );
  }
}

class MacosPageRoute extends PageRoute {
  MacosPageRoute({
    required WidgetBuilder builder,
    bool barrierDismissible = false,
    Color? barrierColor = const Color(0x80000000),
    String? barrierLabel,
    super.settings,
  })  : _builder = builder,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _barrierColor = barrierColor;

  final WidgetBuilder _builder;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String? get barrierLabel => _barrierLabel;
  final String? _barrierLabel;

  @override
  Color? get barrierColor => _barrierColor;
  final Color? _barrierColor;

  @override
  Curve get barrierCurve => Curves.linear;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 450);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 120);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: _builder(context),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
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
  bool get maintainState => false;
}
