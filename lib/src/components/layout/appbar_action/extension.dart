import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'appbar_action.dart';


/// Extension on [AdaptiveAppBarActionEntry] to provide platform-specific rendering.
extension AppBarActionExtension on AdaptiveAppBarActionEntry {
  /// Casts the action entry to a specific type.
  T _asType<T>() => this as T;

  /// Converts the action entry to a Windows-specific widget.
  Widget toWindows(BuildContext context) {
    if (this is AdaptiveAppBarButton) {
      return _asType<AdaptiveAppBarButton>().toWindows(context);
    } else if (this is AdaptiveAppBarPulldownButton) {
      return _asType<AdaptiveAppBarPulldownButton>().toWindows(context);
    } else if (this is AdaptiveAppBarDivider) {
      return _asType<AdaptiveAppBarDivider>().toWindows(context);
    } else {
      return _asType<AdaptiveAppBarCustomItem>().child;
    }
  }

  /// Converts the action entry to a macOS-specific toolbar item.
  ToolbarItem toMacOS(BuildContext context, {
    Widget Function(Widget child)? customItem,
  }) {
    if (this is AdaptiveAppBarButton) {
      return _asType<AdaptiveAppBarButton>().toMacos(context);
    } else if (this is AdaptiveAppBarPulldownButton) {
      return _asType<AdaptiveAppBarPulldownButton>().toMacos(context);
    } else if (this is AdaptiveAppBarDivider) {
      return _asType<AdaptiveAppBarDivider>().toMacos(context);
    } else {
      final child = _asType<AdaptiveAppBarCustomItem>().child;
      return CustomToolbarItem(
        inOverflowedBuilder: (context) => customItem?.call(child) ?? child,
        inToolbarBuilder: (context) => customItem?.call(child) ?? child,
      );
    }
  }
}
