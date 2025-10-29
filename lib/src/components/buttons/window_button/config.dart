import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

class AdaptiveWindowButtonsConfig {
  const AdaptiveWindowButtonsConfig({
    Key? key,
    this.closeTheme,
    this.maximizeTheme,
    this.minimizeTheme,
    this.unmaximizeTheme,
    required this.onClose,
    required this.onRestore,
    required this.onMinimize,
    required this.onMaximize,
    required this.onunMaximize,
    required this.isMaximized,
    required this.isMinimized,
    this.showCloseButton = true,
    this.showMinimizeButton = true,
    this.showMaximizeButton = true,
  });

  final bool showCloseButton;
  final bool showMinimizeButton;
  final bool showMaximizeButton;

  final VoidCallback onClose;
  final VoidCallback onRestore;
  final VoidCallback onMinimize;
  final VoidCallback onMaximize;
  final VoidCallback onunMaximize;
  final Future<bool> Function() isMaximized;
  final Future<bool> Function() isMinimized;

  final AdaptiveWindowButtonThemeData? closeTheme;
  final AdaptiveWindowButtonThemeData? minimizeTheme;
  final AdaptiveWindowButtonThemeData? maximizeTheme;
  final AdaptiveWindowButtonThemeData? unmaximizeTheme;

  factory AdaptiveWindowButtonsConfig.fallback() {
    return AdaptiveWindowButtonsConfig(
      onClose: () => windowManager.close(),
      onRestore: () => windowManager.restore(),
      onMinimize: () => windowManager.minimize(),
      onMaximize: () => windowManager.maximize(),
      onunMaximize: () => windowManager.unmaximize(),
      isMaximized: () => windowManager.isMaximized(),
      isMinimized: () => windowManager.isMinimized(),
    );
  }

  static AdaptiveWindowButtonsConfig of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<
                AdaptiveWindowButtonsController>()
            ?.config ??
        AdaptiveWindowButtonsConfig.fallback();
  }

  static AdaptiveWindowButtonsConfig? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AdaptiveWindowButtonsController>()
        ?.config;
  }

  AdaptiveWindowButtonsConfig copyWith({
    bool? showCloseButton,
    bool? showMinimizeButton,
    bool? showMaximizeButton,
    VoidCallback? onClose,
    VoidCallback? onRestore,
    VoidCallback? onMinimize,
    VoidCallback? onMaximize,
    VoidCallback? onunMaximize,
    Future<bool> Function()? isMaximized,
    Future<bool> Function()? isMinimized,
    AdaptiveWindowButtonThemeData? closeTheme,
    AdaptiveWindowButtonThemeData? minimizeTheme,
    AdaptiveWindowButtonThemeData? maximizeTheme,
    AdaptiveWindowButtonThemeData? unmaximizeTheme,
  }) {
    return AdaptiveWindowButtonsConfig(
      onClose: onClose ?? this.onClose,
      onRestore: onRestore ?? this.onRestore,
      onMinimize: onMinimize ?? this.onMinimize,
      onMaximize: onMaximize ?? this.onMaximize,
      onunMaximize: onunMaximize ?? this.onunMaximize,
      isMaximized: isMaximized ?? this.isMaximized,
      isMinimized: isMinimized ?? this.isMinimized,
      closeTheme: closeTheme ?? this.closeTheme,
      minimizeTheme: minimizeTheme ?? this.minimizeTheme,
      maximizeTheme: maximizeTheme ?? this.maximizeTheme,
      unmaximizeTheme: unmaximizeTheme ?? this.unmaximizeTheme,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      showMinimizeButton: showMinimizeButton ?? this.showMinimizeButton,
      showMaximizeButton: showMaximizeButton ?? this.showMaximizeButton,
    );
  }

  AdaptiveWindowButtonsConfig merge(
    AdaptiveWindowButtonsConfig? overrides,
  ) {
    return copyWith(
      showCloseButton: overrides?.showCloseButton,
      showMinimizeButton: overrides?.showMinimizeButton,
      showMaximizeButton: overrides?.showMaximizeButton,
      onClose: overrides?.onClose,
      onRestore: overrides?.onRestore,
      onMinimize: overrides?.onMinimize,
      onMaximize: overrides?.onMaximize,
      onunMaximize: overrides?.onunMaximize,
      isMaximized: overrides?.isMaximized,
      isMinimized: overrides?.isMinimized,
      closeTheme: overrides?.closeTheme,
      minimizeTheme: overrides?.minimizeTheme,
      maximizeTheme: overrides?.maximizeTheme,
      unmaximizeTheme: overrides?.unmaximizeTheme,
    );
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AdaptiveWindowButtonsConfig) return false;
    return onClose == other.onClose &&
        onMinimize == other.onMinimize &&
        onMaximize == other.onMaximize &&
        onRestore == other.onRestore &&
        isMaximized == other.isMaximized &&
        isMinimized == other.isMinimized &&
        minimizeTheme == other.minimizeTheme &&
        maximizeTheme == other.maximizeTheme &&
        closeTheme == other.closeTheme;
  }

  @override
  int get hashCode => Object.hash(onClose, onMinimize, onMaximize, onRestore,
      isMaximized, isMinimized, minimizeTheme, maximizeTheme, closeTheme);
}

class AdaptiveWindowButtonsController extends InheritedWidget {
  final AdaptiveWindowButtonsConfig config;

  const AdaptiveWindowButtonsController({
    Key? key,
    required this.config,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AdaptiveWindowButtonsController oldWidget) {
    return oldWidget.config != config;
  }
}

class AdaptiveWindowButtonThemeData {
  const AdaptiveWindowButtonThemeData({
    this.hoverColor,
    this.disabledColor,
    this.backgroundColor,
  });

  final Color? hoverColor;
  final Color? disabledColor;
  final Color? backgroundColor;
}
