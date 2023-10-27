import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/adaptive.dart';
import '../surfaces.dart';

/// Shows an adaptive platform-specific dialog and returns a future that resolves to a value.
///
/// Use this function to display a dialog with platform-specific styling and behavior.
/// The appearance and behavior of the dialog adapt to the current platform (macOS,
/// Windows, Android, or iOS).
Future<T?>? showAdpDialog<T>({
  required BuildContext context,
  required AdaptiveDialog child,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  return adaptiveValue<Future<T?>>(
    macos: () => showMacosAlertDialog<T>(
      context: context,
      builder: (context) => child,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    ),
    windows: () => showDialog<T>(
      context: context,
      builder: (context) => child,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
    ),
  );
}
