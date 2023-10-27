import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

class AppBarWindows extends StatelessWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? actionsIconTheme;
  final bool? centerTitle;
  final double toolbarOpacity;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final double? titleWidth;
  final double? toolbarHeight;

  const AppBarWindows({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.actionsIconTheme,
    this.centerTitle,
    this.toolbarHeight,
    this.automaticallyImplyLeading = false,
    this.toolbarOpacity = 1.0,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.titleWidth,
  });

  @override
  Widget build(BuildContext context) {
    final fluent = FluentTheme.of(context);
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FittedBox(child: leading),
      ),
      title: title,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? fluent.navigationPaneTheme.backgroundColor,
      foregroundColor: foregroundColor,
      actionsIconTheme: actionsIconTheme,
      centerTitle: centerTitle,
      toolbarOpacity: toolbarOpacity,
      leadingWidth: leadingWidth,
      elevation: 0.0,
      iconTheme: fluent.iconTheme,
      toolbarTextStyle: fluent.typography.bodyLarge?.merge(titleTextStyle),
      titleTextStyle: fluent.typography.bodyLarge?.merge(titleTextStyle),
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
    );
  }

  NavigationAppBar toNavigationAppBar(BuildContext context) {
    final fluentTheme = FluentTheme.of(context);
    final styledTitle = title != null ? DefaultTextStyle(
            style: titleTextStyle ?? fluentTheme.typography.body!,
            child: title!,
          ) : null;

    return NavigationAppBar(
      title: centerTitle == true ? Center(child: styledTitle) : styledTitle,
      leading: leading != null ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: FittedBox(child: leading),
            ) : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: (backgroundColor ?? fluentTheme.navigationPaneTheme.overlayBackgroundColor)?.withOpacity(toolbarOpacity),
      height: toolbarHeight ?? kToolbarHeight / 2,
      actions: actions != null ? Padding(
            padding: const EdgeInsets.all(3.0),
            child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [const Spacer(), ...actions!],
                ),
              ),
          ) : null,
    );
  }
}
