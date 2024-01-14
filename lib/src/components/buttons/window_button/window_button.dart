import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import 'config.dart';
import 'platforms/platforms.dart';

/// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
/// A component that displays window buttons (close, minimize, maximize) in a platform-adaptive way.
///
/// It renders appropriate button styles for Windows and macOS, ensuring a native look and feel.
/// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
class AdaptiveWindowButtons extends CoreAdaptiveComponent {
  const AdaptiveWindowButtons({
    super.key,
    super.builders,
    this.onClose,
    this.onRestore,
    this.onMinimize,
    this.onMaximize,
    this.onunMaximize,
    this.closeTheme,
    this.maximizeTheme,
    this.unmaximizeTheme,
    this.minimizeTheme,
    this.showCloseButton,
    this.showMinimizeButton,
    this.showMaximizeButton,
  });

  final bool? showCloseButton;
  final bool? showMinimizeButton;
  final bool? showMaximizeButton;

  final VoidCallback? onClose;
  final VoidCallback? onRestore;
  final VoidCallback? onMinimize;
  final VoidCallback? onMaximize;
  final VoidCallback? onunMaximize;

  final AdaptiveWindowButtonThemeData? closeTheme;
  final AdaptiveWindowButtonThemeData? minimizeTheme;
  final AdaptiveWindowButtonThemeData? maximizeTheme;
  final AdaptiveWindowButtonThemeData? unmaximizeTheme;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return WindowButtonsWindows(
      // callbacks
      onClose: onClose,
      onRestore: onRestore,
      onMinimize: onMinimize,
      onMaximize: onMaximize,
      onunMaximize: onunMaximize,
      // themes
      closeTheme: closeTheme,
      minimizeTheme: minimizeTheme,
      maximizeTheme: maximizeTheme,
      unmaximizeTheme: unmaximizeTheme,
      // showing
      showCloseButton: showCloseButton,
      showMaximizeButton: showMaximizeButton,
      showMinimizeButton: showMinimizeButton,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return WindowButtonsMacos(
      // callbacks
      onClose: onClose,
      onRestore: onRestore,
      onMinimize: onMinimize,
      onMaximize: onMaximize,
      onunMaximize: onunMaximize,
      // themes
      closeTheme: closeTheme,
      minimizeTheme: minimizeTheme,
      maximizeTheme: maximizeTheme,
      unmaximizeTheme: unmaximizeTheme,
      // showing
      showCloseButton: showCloseButton,
      showMaximizeButton: showMaximizeButton,
      showMinimizeButton: showMinimizeButton,
    );
  }
}

class AdaptiveCloseWindowButton extends CoreAdaptiveComponent {
  const AdaptiveCloseWindowButton({
    super.key,
    super.builders,
    this.show,
    this.theme,
    this.onClose,
  });

  final bool? show;
  final VoidCallback? onClose;
  final AdaptiveWindowButtonThemeData? theme;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return WindowCloseButtonsWindows(
        show: show, theme: theme, onClose: onClose);
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return WindowCloseButtonsMacos(show: show, theme: theme, onClose: onClose);
  }
}

class AdaptiveMinimizeWindowButton extends CoreAdaptiveComponent {
  const AdaptiveMinimizeWindowButton({
    super.key,
    super.builders,
    this.show,
    this.theme,
    this.onRestore,
    this.onMinimize,
  });

  final bool? show;
  final VoidCallback? onMinimize;
  final VoidCallback? onRestore;
  final AdaptiveWindowButtonThemeData? theme;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return WindowMinimizeButtonsWindows(
      show: show,
      theme: theme,
      onRestore: onRestore,
      onMinimize: onMinimize,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return WindowMinimizeButtonsMacos(
      show: show,
      theme: theme,
      onRestore: onRestore,
      onMinimize: onMinimize,
    );
  }
}

class AdaptiveMaximizeWindowButton extends CoreAdaptiveComponent {
  const AdaptiveMaximizeWindowButton({
    super.key,
    super.builders,
    this.show,
    this.theme,
    this.onMaximize,
    this.onunMaximize,
    this.unmaximizeTheme,
  });

  final bool? show;
  final VoidCallback? onMaximize;
  final VoidCallback? onunMaximize;
  final AdaptiveWindowButtonThemeData? theme;
  final AdaptiveWindowButtonThemeData? unmaximizeTheme;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return WindowMaximizeButtonsWindows(
      show: show,
      theme: theme,
      onMaximize: onMaximize,
      onunMaximize: onunMaximize,
      unmaximizeTheme: unmaximizeTheme,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return WindowMaximizeButtonsMacos(
      show: show,
      theme: theme,
      onMaximize: onMaximize,
      onunMaximize: onunMaximize,
      unmaximizeTheme: unmaximizeTheme,
    );
  }
}
