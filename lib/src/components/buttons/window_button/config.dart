import 'dart:async';

import 'package:flutter/widgets.dart';

class AdaptiveWindowButtonConfig {
  final bool showCloseButton;
  final bool showMinimizeButton;
  final bool showMaximizeButton;

  final VoidCallback onClose;
  final VoidCallback onRestore;
  final VoidCallback onMinimize;
  final VoidCallback onMaximize;
  final FutureOr<bool> Function() isMaximized;

  const AdaptiveWindowButtonConfig({
    Key? key,
    required this.onClose,
    required this.onRestore,
    required this.onMinimize,
    required this.onMaximize,
    required this.isMaximized,
    this.showCloseButton = true,
    this.showMinimizeButton = true,
    this.showMaximizeButton = true,
  });

  static AdaptiveWindowButtonConfig? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            AdaptiveWindowButtonConfigInherited>()
        ?.config;
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AdaptiveWindowButtonConfig) return false;
    return onClose == other.onClose &&
        onMinimize == other.onMinimize &&
        onMaximize == other.onMaximize &&
        onMaximize == other.onRestore &&
        isMaximized == other.isMaximized;
  }

  @override
  int get hashCode =>
      Object.hash(onClose, onMinimize, onMaximize, onRestore, isMaximized);
}

class AdaptiveWindowButtonConfigInherited extends InheritedWidget {
  final AdaptiveWindowButtonConfig config;

  const AdaptiveWindowButtonConfigInherited({
    Key? key,
    required this.config,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AdaptiveWindowButtonConfigInherited oldWidget) {
    return oldWidget.config != config;
  }
}
