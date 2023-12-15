import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/adaptive.dart';
import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// Shows an adaptive bottom sheet and returns a future that resolves to a value.
///
/// Use this function to display a platform-specific bottom sheet. The appearance
/// and behavior of the bottom sheet adapt to the current platform (macOS,
/// Windows, Android, or iOS).
Future<T?>? showAdpBottomSheet<T>({
  required BuildContext context,
  required CoreAdaptiveComponent child,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  return adaptiveValue<Future<T?>?>(
    windows: () => showBottomSheetWindows<T>(
      context: context,
      builder: (context) => child.windows(context),
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
    ),
    macos: () => showMacosSheet<T>(
      context: context,
      builder: (context) => child.macos(context),
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    ),
  );
}
