import '../../../../../core/extension/object.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../buttons/menu/pulldown/pulldown_item.dart';
import '../../appbar_action.dart';

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
      elevation: 0.0,
      actions: actions,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      iconTheme: fluent.iconTheme,
      toolbarOpacity: toolbarOpacity,
      foregroundColor: foregroundColor,
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor:
          backgroundColor ?? fluent.navigationPaneTheme.backgroundColor,
      toolbarTextStyle: fluent.typography.bodyLarge?.merge(titleTextStyle),
      titleTextStyle: fluent.typography.bodyLarge?.merge(titleTextStyle),
      toolbarHeight: toolbarHeight ?? kToolbarHeight / 2,
    );
  }

  NavigationAppBar toNavigationAppBar(BuildContext context) {
    final fluentTheme = FluentTheme.of(context);

    return NavigationAppBar(
      title: _buildLeadingWithTitle(fluentTheme),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: (backgroundColor ??
              fluentTheme.navigationPaneTheme.overlayBackgroundColor)
          ?.withOpacity(toolbarOpacity),
      actions: actions.isNotNull ? _buildActions(context) : null,
      height: toolbarHeight ?? (kToolbarHeight + 8) / 2,
    );
  }

  Widget _buildLeadingWithTitle(FluentThemeData fluentTheme) {
    return Row(
      children: [
        if (leading.isNotNull)
          DefaultTextStyle(
            style: fluentTheme.typography.caption!,
            child: SizedBox(width: leadingWidth, child: leading),
          ),
        if (leading.isNotNull) const SizedBox(width: 8),
        if (centerTitle == true) const Spacer(),
        if (title.isNotNull)
          DefaultTextStyle(
            style: titleTextStyle ?? fluentTheme.typography.bodyStrong!,
            child: SizedBox(
                width: titleWidth,
                child: centerTitle == true ? Center(child: title) : title),
          ),
        if (centerTitle == true) const Spacer(),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    final List<AdaptiveAppBarActionEntry> actionEntry = [
      AdaptiveAppBarIconButton(
        label: 'remove',
        icon: const Icon(FluentIcons.remove),
        onPressed: () {},
      ),
      AdaptiveAppBarIconButton(
        label: 'add',
        icon: const Icon(FluentIcons.add),
        onPressed: () {},
      ),
      AdaptiveAppBarPulldownButton(
        items: [
          const AdaptivePulldownMenuItem(
            child: Text('AdaptivePulldownMenuItem - 1'),
          ),
          const AdaptivePulldownMenuItem(
            child: Text('AdaptivePulldownMenuItem - 2'),
          ),
          const AdaptivePulldownMenuItem(
            child: Text('AdaptivePulldownMenuItem - 3'),
          ),
        ],
        label: 'selection',
        icon: FluentIcons.select_all,
      ),
      const AdaptiveAppBarCustomItem(child: Text('Abbas Hussein')),
    ];

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 25),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              ...actionEntry.map(
                (element) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Builder(
                      builder: (context) {
                        if (element is AdaptiveAppBarIconButton) {
                          return element.toIconButton();
                        }
                        if (element is AdaptiveAppBarPulldownButton) {
                          return element.toDropDownButton();
                        }

                        if (element is AdaptiveAppBarCustomItem) {
                          return element.child;
                        }

                        return Spacer();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
