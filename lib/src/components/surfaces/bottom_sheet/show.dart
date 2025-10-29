import 'package:fluent_ui/l10n/generated/fluent_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/adaptive.dart';

/// Shows an adaptive platform-specific bottom sheet and returns a future that resolves to a value.
///
/// Use this function to display a bottom sheet with platform-specific styling and behavior.
/// The appearance and behavior of the bottom sheet adapt to the current platform (macOS, Windows).
///
/// see also:
/// * [BottomSheet] A custom bottom sheets widget that adapts its appearance based on the platform.
Future<T?>? showAdpBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  return adaptiveValue<Future<T?>?>(
    windows: () => showBottomSheetWindows<T>(
      context: context,
      builder: builder,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
    ),
    macos: () => showMacosSheet<T>(
      context: context,
      builder: builder,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
    ),
  );
}

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
