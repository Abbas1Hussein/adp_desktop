import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

import '../../button/macos.dart';
import '../config.dart';

class WindowButtonsMacos extends StatelessWidget {
  const WindowButtonsMacos({
    super.key,
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
  Widget build(BuildContext context) {
    const space = SizedBox(width: 8.0);

    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      children: [
        WindowCloseButtonsMacos(
          onClose: onClose,
          theme: closeTheme,
          show: showCloseButton,
        ),
        space,
        WindowMinimizeButtonsMacos(
          theme: minimizeTheme,
          onRestore: onRestore,
          onMinimize: onMinimize,
          show: showMinimizeButton,
        ),
        space,
        WindowMaximizeButtonsMacos(
          theme: maximizeTheme,
          onMaximize: onMaximize,
          show: showMaximizeButton,
          onunMaximize: onunMaximize,
          unmaximizeTheme: unmaximizeTheme,
        ),
      ],
    );
  }
}

class WindowCloseButtonsMacos extends StatelessWidget {
  const WindowCloseButtonsMacos({
    super.key,
    this.show,
    this.theme,
    this.onClose,
  });

  final bool? show;
  final VoidCallback? onClose;
  final AdaptiveWindowButtonThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final config = AdaptiveWindowButtonsConfig.of(context);

    return _buildWindowMacosButton(
      show: show ?? config.showCloseButton,
      onPressed: onClose ?? config.onClose,
      hoverColor: theme?.hoverColor ??
          config.closeTheme?.hoverColor ??
          MacosColors.systemRedColor.withOpacity(0.5),
      backgroundColor: theme?.backgroundColor ??
          config.closeTheme?.backgroundColor ??
          MacosColors.systemRedColor,
    );
  }
}

class WindowMinimizeButtonsMacos extends StatelessWidget {
  const WindowMinimizeButtonsMacos({
    super.key,
    this.show,
    this.theme,
    this.onRestore,
    this.onMinimize,
  });

  final bool? show;
  final VoidCallback? onRestore;
  final VoidCallback? onMinimize;
  final AdaptiveWindowButtonThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final config = AdaptiveWindowButtonsConfig.of(context);

    return _buildWindowMacosButton(
      show: show ?? config.showMinimizeButton,
      onPressed: () async {
        final isMinimized = await config.isMinimized();
        if (isMinimized) {
          onRestore ?? config.onRestore();
        } else {
          onMinimize ?? config.onMinimize();
        }
      },
      hoverColor: theme?.hoverColor ??
          config.minimizeTheme?.hoverColor ??
          MacosColors.systemYellowColor.withOpacity(0.5),
      backgroundColor: theme?.backgroundColor ??
          config.minimizeTheme?.backgroundColor ??
          MacosColors.systemYellowColor,
    );
  }
}

class WindowMaximizeButtonsMacos extends StatefulWidget {
  const WindowMaximizeButtonsMacos({
    super.key,
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
  State<WindowMaximizeButtonsMacos> createState() =>
      _WindowMaximizeButtonsMacosState();
}

class _WindowMaximizeButtonsMacosState extends State<WindowMaximizeButtonsMacos>
    with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = AdaptiveWindowButtonsConfig.of(context);

    return FutureBuilder<bool>(
      future: config.isMaximized(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == true) {
          return _buildWindowMacosButton(
            onPressed: widget.onunMaximize ?? config.onunMaximize,
            show: widget.show ?? config.showMaximizeButton,
            hoverColor: widget.unmaximizeTheme?.hoverColor ??
                config.maximizeTheme?.hoverColor ??
                MacosColors.systemGreenColor.withOpacity(0.5),
            backgroundColor: widget.unmaximizeTheme?.backgroundColor ??
                config.maximizeTheme?.backgroundColor ??
                MacosColors.systemGreenColor,
          );
        }
        return _buildWindowMacosButton(
          onPressed: widget.onMaximize ?? config.onMaximize,
          show: widget.show ?? config.showMaximizeButton,
          hoverColor: widget.theme?.hoverColor ??
              MacosColors.systemGreenColor.withOpacity(0.5),
          backgroundColor: widget.theme?.backgroundColor ??
              config.maximizeTheme?.backgroundColor ??
              MacosColors.systemGreenColor,
        );
      },
    );
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }
}

Widget _buildWindowMacosButton({
  bool show = true,
  Color? disabledColor,
  required Color hoverColor,
  required Color backgroundColor,
  required VoidCallback? onPressed,
}) {
  if (show) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 15.0, height: 15.0),
      child: MacosButton(
        onPressed: onPressed,
        hoverColor: hoverColor,
        pressedColor: hoverColor,
        disabledColor: disabledColor,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
  return const SizedBox.shrink();
}
