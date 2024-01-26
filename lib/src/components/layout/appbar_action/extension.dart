import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'appbar_action.dart';

const _customItemConstraints = BoxConstraints(maxWidth: 300.0);

/// Extension on [AdaptiveActionEntry] to provide platform-specific rendering.
extension AppBarActionExtension on AdaptiveActionEntry {
  /// Casts the action entry to a specific type.
  T _asType<T>() => this as T;

  /// Converts the action entry to a Windows-specific widget.
  Widget toWindows(BuildContext context, {double? maxCustomItemHeight}) {
    if (this is AdaptiveActionButton) {
      return _asType<AdaptiveActionButton>().toWindows(context);
    } else if (this is AdaptiveActionPulldownButton) {
      return _asType<AdaptiveActionPulldownButton>().toWindows(context);
    } else if (this is AdaptiveActionDivider) {
      return _asType<AdaptiveActionDivider>().toWindows(context);
    } else {
      return ConstrainedBox(
        constraints: _customItemConstraints.copyWith(
          maxWidth: maxCustomItemHeight,
        ),
        child: _asType<AdaptiveActionCustomItem>().child,
      );
    }
  }

  /// Converts the action entry to a macOS-specific toolbar item.
  ToolbarItem toMacOS(
    BuildContext context, {
    Widget Function(Widget child)? customItem,
    double? maxCustomItemHeight,
  }) {
    if (this is AdaptiveActionButton) {
      return _asType<AdaptiveActionButton>().toMacos(context);
    } else if (this is AdaptiveActionPulldownButton) {
      return _asType<AdaptiveActionPulldownButton>().toMacos(context);
    } else if (this is AdaptiveActionDivider) {
      return _asType<AdaptiveActionDivider>().toMacos(context);
    } else {
      final child = _asType<AdaptiveActionCustomItem>().child;
      return CustomToolbarItem(
        inOverflowedBuilder: (context) => customItem?.call(child) ?? child,
        inToolbarBuilder: (context) {
          return ConstrainedBox(
            constraints:
                _customItemConstraints.copyWith(maxHeight: maxCustomItemHeight),
            child: (customItem?.call(child) ?? child),
          );
        },
      );
    }
  }
}
