import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as system;
import 'package:window_manager/window_manager.dart';

import '../config.dart';

class WindowButtonsWindows extends StatelessWidget {
  const WindowButtonsWindows({
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
    const space = SizedBox(width: 4.0);

    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      children: [
        WindowCloseButtonsWindows(
          onClose: onClose,
          theme: closeTheme,
          show: showCloseButton,
        ),
        space,
        WindowMaximizeButtonsWindows(
          theme: maximizeTheme,
          onMaximize: onMaximize,
          show: showMaximizeButton,
          onunMaximize: onunMaximize,
          unmaximizeTheme: unmaximizeTheme,
        ),
        space,
        WindowMinimizeButtonsWindows(
          theme: minimizeTheme,
          onRestore: onRestore,
          onMinimize: onMinimize,
          show: showMinimizeButton,
        ),
      ],
    );
  }
}

class WindowCloseButtonsWindows extends StatelessWidget {
  const WindowCloseButtonsWindows({
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

    return _buildWindowWindowsButton(
      onPressed: onClose ?? config.onClose,
      icon: FluentIcons.chrome_close,
      show: show ?? config.showCloseButton,
      hoverColor:
          theme?.hoverColor ?? config.closeTheme?.hoverColor ?? Colors.red,
      disabledColor: theme?.disabledColor ?? config.closeTheme?.disabledColor,
      backgroundColor:
          theme?.backgroundColor ?? config.closeTheme?.backgroundColor,
    );
  }
}

class WindowMinimizeButtonsWindows extends StatelessWidget {
  const WindowMinimizeButtonsWindows({
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

    return _buildWindowWindowsButton(
      icon: FluentIcons.chrome_minimize,
      onPressed: () async {
        final isMinimized = await config.isMinimized();
        if (isMinimized) {
          onRestore ?? config.onRestore();
        } else {
          onMinimize ?? config.onMinimize();
        }
      },
      show: show ?? config.showMinimizeButton,
      hoverColor: theme?.hoverColor ?? config.minimizeTheme?.hoverColor,
      disabledColor:
          theme?.disabledColor ?? config.minimizeTheme?.disabledColor,
      backgroundColor:
          theme?.backgroundColor ?? config.minimizeTheme?.backgroundColor,
    );
  }
}

class WindowMaximizeButtonsWindows extends StatefulWidget {
  const WindowMaximizeButtonsWindows({
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
  State<WindowMaximizeButtonsWindows> createState() =>
      _WindowMaximizeButtonsWindowsState();
}

class _WindowMaximizeButtonsWindowsState
    extends State<WindowMaximizeButtonsWindows> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = AdaptiveWindowButtonsConfig.of(context);

    return FutureBuilder<bool>(
      future: config.isMaximized(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == true) {
          return _buildWindowWindowsButton(
            onPressed: widget.onunMaximize ?? config.onunMaximize,
            icon: FluentIcons.chrome_restore,
            show: widget.show ?? config.showMaximizeButton,
            hoverColor: widget.unmaximizeTheme?.hoverColor ??
                config.unmaximizeTheme?.hoverColor,
            disabledColor: widget.unmaximizeTheme?.disabledColor ??
                config.unmaximizeTheme?.disabledColor,
            backgroundColor: widget.unmaximizeTheme?.backgroundColor ??
                config.unmaximizeTheme?.backgroundColor,
          );
        }
        return _buildWindowWindowsButton(
          onPressed: widget.onMaximize ?? config.onMaximize,
          icon: system.FluentIcons.maximize_48_filled,
          iconSize: 13.0,
          show: widget.show ?? config.showMaximizeButton,
          hoverColor:
              widget.theme?.hoverColor ?? config.maximizeTheme?.hoverColor,
          disabledColor: widget.theme?.disabledColor ??
              config.maximizeTheme?.disabledColor,
          backgroundColor: widget.theme?.backgroundColor ??
              config.maximizeTheme?.backgroundColor,
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

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }
}

Widget _buildWindowWindowsButton({
  bool show = true,
  double? iconSize,
  Color? hoverColor,
  Color? disabledColor,
  Color? backgroundColor,
  required IconData icon,
  required VoidCallback? onPressed,
}) {


  final style = ButtonStyle(
    shape: WidgetStateProperty.all(LinearBorder.none),
    backgroundColor: WidgetStateProperty.resolveWith(
      (states) => WidgetStateExtension.forStates(
        states,
        hovering: hoverColor,
        none: backgroundColor,
        disabled: disabledColor,
        pressed: hoverColor?.withOpacity(0.5),
      ),
    ),
  );
  if (show) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 46,
        minHeight: kWindowCaptionHeight,
      ),
      child: IconButton(
        style: style,
        onPressed: onPressed,
        icon: Icon(icon, size: iconSize ?? 10.0),
      ),
    );
  }

  return const SizedBox.shrink();
}
