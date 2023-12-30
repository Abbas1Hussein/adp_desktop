import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/adaptive.dart';
import 'platforms/platforms.dart';

/// Shows an adaptive platform-specific bottom sheet and returns a future that resolves to a value.
///
/// Use this function to display a bottom sheet with platform-specific styling and behavior.
/// The appearance and behavior of the bottom sheet adapt to the current platform (macOS, Windows).
///
/// see also:
/// * [BottomSheetPresenter]: A utility class for presenting different types of adaptive bottom sheets.
/// * [BottomSheet]: A custom bottom sheets widget that adapts its appearance based on the platform.
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
