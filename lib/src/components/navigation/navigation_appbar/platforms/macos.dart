import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../appbar_action.dart';

/// Defines the height of a regular-sized [ToolBar]
const _kToolbarHeight = 52.0;

/// Defines the width of the leading widget in the [ToolBar]
const _kLeadingWidth = 20.0;

/// Defines the width of the [ToolBar]'s title.
const _kTitleWidth = 150.0;


class NABMacos extends StatelessWidget {
  const NABMacos({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
    this.foregroundColor,
    this.actionsIconTheme,
    this.toolbarHeight,
    this.toolbarOpacity = 1.0,
    this.leadingWidth = _kLeadingWidth,
    this.automaticallyImplyLeading = true,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.titleWidth,
    required this.insets,
  });

  final Widget? leading;
  final Widget? title;
  final EdgeInsets insets;
  final List<AdaptiveNABActionEntry>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool automaticallyImplyLeading;
  final IconThemeData? actionsIconTheme;
  final bool? centerTitle;
  final double toolbarOpacity;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final double? titleWidth;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    final typography = MacosTheme.of(context).typography;

    final styledTitle = title != null
        ? DefaultTextStyle(
            maxLines: 1,
            style: titleTextStyle ??
                CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            child: title!,
          )
        : null;
    final leadingWidget = leading != null
        ? DefaultTextStyle(
            style: toolbarTextStyle ?? MacosTheme.of(context).typography.body,
            child: IconTheme(
              data: actionsIconTheme ??
                  IconTheme.of(context).copyWith(
                    color: foregroundColor ??
                        MacosTheme.of(context).typography.body.color,
                  ),
              child: leading!,
            ),
          )
        : null;

    return ToolBar(
      padding: insets,
      title: styledTitle,
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: _buildAction(context, typography),
      height: toolbarHeight ?? _kToolbarHeight,
      decoration: BoxDecoration(
        color: (backgroundColor ?? MacosTheme.of(context).canvasColor)
            .withOpacity(toolbarOpacity),
      ),
      titleWidth: titleWidth ?? _kTitleWidth,
      centerTitle: centerTitle ?? false,
    );
  }

  List<ToolbarItem>? _buildAction(
    BuildContext context,
    MacosTypography typography,
  ) {
    return actions
        ?.map(
          (e) {
            if (e is AdaptiveNABIconButton) {
              return e.toMacos(context);
            }

            if (e is AdaptiveNABPulldownButton) {
              return e.toMacos(context);
            }

            if (e is AdaptiveNABDivider) {
              return e.toMacos(context);
            }

            if (e is AdaptiveNABCustomItem) {
              return _buildCustomActions(typography, e.child);
            }

            return const ToolBarSpacer();
          },
        )
        .whereType<ToolbarItem>()
        .toList();
  }

  CustomToolbarItem _buildCustomActions(
    MacosTypography typography,
    Widget child,
  ) {
    return CustomToolbarItem(
      inOverflowedBuilder: (context) {
        return _buildCustomToolbarItems(typography, context, child);
      },
      inToolbarBuilder: (context) {
        return _buildCustomToolbarItems(typography, context, child);
      },
    );
  }

  Widget _buildCustomToolbarItems(
    MacosTypography typography,
    BuildContext context,
    Widget child,
  ) {
    return DefaultTextStyle(
      style: typography.body,
      child: IconTheme(
        data: actionsIconTheme ??
            IconTheme.of(context).copyWith(
              color: foregroundColor ?? typography.body.color,
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: child,
        ),
      ),
    );
  }
}
