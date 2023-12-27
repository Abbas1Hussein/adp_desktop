import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

import '../../../layout/appbar_action/appbar_action.dart';
import '../../../layout/appbar_action/extension.dart';

class NABWindows {
  const NABWindows({
    this.leading,
    this.title,
    this.actions,
    this.toolbarTextStyle,
    this.actionsIconTheme,
    this.foregroundColor,
    this.backgroundColor,
    this.centerTitle,
    this.toolbarHeight,
    this.automaticallyImplyLeading = false,
    this.toolbarOpacity = 1.0,
    this.leadingWidth,
    this.titleTextStyle,
    this.titleWidth,
    required this.insets,
    required this.context,
  });

  final Widget? title;
  final Widget? leading;
  final EdgeInsets insets;
  final bool? centerTitle;
  final double? titleWidth;
  final double toolbarOpacity;
  final double? leadingWidth;
  final BuildContext context;
  final double? toolbarHeight;
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final bool automaticallyImplyLeading;
  final List<AdaptiveAppBarActionEntry>? actions;

  final Color? foregroundColor;
  final TextStyle? toolbarTextStyle;
  final IconThemeData? actionsIconTheme;

  NavigationAppBar call() {
    final theme = FluentTheme.of(context);

    return NavigationAppBar(
      title: _buildLeadingWithTitle(theme),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor:
          (backgroundColor ?? theme.navigationPaneTheme.overlayBackgroundColor)
              ?.withOpacity(toolbarOpacity),
      actions: _buildActions(context, theme, actions),
      height: toolbarHeight ?? (kToolbarHeight - 11),
    );
  }

  Widget? _buildActions(
    BuildContext context,
    FluentThemeData theme,
    List<AdaptiveAppBarActionEntry>? actionEntry,
  ) {
    if (actionEntry == null) return null;

    return Padding(
      padding: insets,
      child: IconTheme(
        data: actionsIconTheme ??
            IconTheme.of(context).copyWith(
              color: foregroundColor ?? theme.typography.body?.color,
            ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              ...actionEntry.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: e.toWindows(context),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingWithTitle(FluentThemeData fluentTheme) {
    final leadingWidget = leading != null
        ? DefaultTextStyle(
            style: toolbarTextStyle ?? fluentTheme.typography.caption!,
            child: SizedBox(width: leadingWidth, child: leading),
          )
        : null;

    return Row(
      children: [
        if (leading != null) leadingWidget!,
        if (leading != null) const SizedBox(width: 8),
        if (centerTitle == true) const Spacer(),
        if (title != null)
          DefaultTextStyle(
            style: titleTextStyle ??
                fluentTheme.typography.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
            child: SizedBox(
                width: titleWidth,
                child: centerTitle == true ? Center(child: title) : title),
          ),
        if (centerTitle == true) const Spacer(),
      ],
    );
  }
}
