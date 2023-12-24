import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

import '../appbar_action.dart';

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
  final List<AdaptiveNABActionEntry>? actions;

  final Color? foregroundColor;
  final TextStyle? toolbarTextStyle;
  final IconThemeData? actionsIconTheme;

  NavigationAppBar call() {
    final fluentTheme = FluentTheme.of(context);

    return NavigationAppBar(
      title: _buildLeadingWithTitle(fluentTheme),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: (backgroundColor ??
              fluentTheme.navigationPaneTheme.overlayBackgroundColor)
          ?.withOpacity(toolbarOpacity),
      actions: _buildActions(context, actions),
      height: toolbarHeight ?? (kToolbarHeight - 11),
    );
  }

  Widget? _buildActions(
    BuildContext context,
    List<AdaptiveNABActionEntry>? actionEntry,
  ) {
    if (actionEntry == null) return null;

    return Padding(
      padding: insets,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            ...actionEntry.map(
              (element) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Builder(
                    builder: (context) {
                      if (element is AdaptiveNABIconButton) {
                        return element.toWindows(context);
                      } else if (element is AdaptiveNABPulldownButton) {
                        return element.toWindows(context);
                      } else if (element is AdaptiveNABDivider) {
                        return element.toWindows(context);
                      } else {
                        return (element as AdaptiveNABCustomItem).child;
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingWithTitle(FluentThemeData fluentTheme) {
    final leadingWidget = leading != null
        ? DefaultTextStyle(
            style: toolbarTextStyle ?? fluentTheme.typography.caption!,
            child: IconTheme(
              data: actionsIconTheme ??
                  IconTheme.of(context).copyWith(
                    color:
                        foregroundColor ?? fluentTheme.typography.body?.color,
                  ),
              child: SizedBox(width: leadingWidth, child: leading),
            ),
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
