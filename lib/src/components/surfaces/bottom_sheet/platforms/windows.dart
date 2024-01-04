import 'package:fluent_ui/fluent_ui.dart';

const _kSheetBorderRadius = BorderRadius.all(Radius.circular(12.0));

class BottomSheetWindows extends StatelessWidget {
  const BottomSheetWindows({
    super.key,
    this.insetPadding,
    this.backgroundColor,
    this.insetAnimationCurve,
    this.insetAnimationDuration,
    required this.child,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  final EdgeInsets? insetPadding;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  final Duration? insetAnimationDuration;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  final Curve? insetAnimationCurve;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    assert(debugCheckHasFluentLocalizations(context));

    final theme = FluentTheme.of(context);

    final defaultInsetPadding = EdgeInsets.fromLTRB(
        8.0, MediaQuery.sizeOf(context).height * 0.5, 8.0, 8.0);

    final color =
        backgroundColor ?? theme.resources.solidBackgroundFillColorBase;

    final innerBorderColor = theme.resources.layerFillColorAlt;

    final effectivePadding = MediaQuery.of(context).viewInsets +
        (insetPadding ?? defaultInsetPadding);

    return AnimatedPadding(
      padding: effectivePadding,
      curve: insetAnimationCurve ?? Curves.decelerate,
      duration: insetAnimationDuration ?? const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: _kSheetBorderRadius,
          border: Border.all(width: 2, color: innerBorderColor),
        ),
        child: Padding(padding: const EdgeInsets.all(8.0), child: child),
      ),
    );
  }
}

/// Displays a [BottomSheetWindows] above the current application.
Future<T?> showBottomSheetWindows<T>({
  required BuildContext context,
  Color? barrierColor,
  String? barrierLabel,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
    _WindowsSheetRoute<T>(
      settings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      barrierLabel: barrierLabel ??
          FluentLocalizations.of(context).modalBarrierDismissLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
    ),
  );
}

class _WindowsSheetRoute<T> extends PopupRoute<T> {
  _WindowsSheetRoute({
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    super.settings,
  })  : _pageBuilder = pageBuilder,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _barrierColor = barrierColor;

  final RoutePageBuilder _pageBuilder;

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
  Duration get transitionDuration => const Duration(milliseconds: 250);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: _pageBuilder(context, animation, secondaryAnimation),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
