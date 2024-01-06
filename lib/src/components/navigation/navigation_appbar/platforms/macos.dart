import 'package:adp_desktop/src/components/buttons/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../layout/appbar_action/appbar_action.dart';
import '../../../layout/appbar_action/extension.dart';

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
    required this.padding,
    required this.centerTitle,
  });

  final Widget? leading;
  final Widget? title;
  final EdgeInsets padding;
  final List<AdaptiveAppBarActionEntry>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool automaticallyImplyLeading;
  final IconThemeData? actionsIconTheme;
  final bool centerTitle;
  final double toolbarOpacity;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final double? titleWidth;
  final double? toolbarHeight;

  bool canPop(BuildContext context) {
    return leading == null &&
        automaticallyImplyLeading &&
        ModalRoute.of(context)?.canPop == true;
  }

  @override
  Widget build(BuildContext context) {
    final typography = MacosTheme.of(context).typography;

    final styledTitle = title != null
        ? DefaultTextStyle(
            maxLines: 1,
            style: titleTextStyle ??
                typography.title3.copyWith(fontWeight: MacosFontWeight.w510),
            child: title!,
          )
        : null;
    final leadingWidget = leading != null
        ? DefaultTextStyle(
            style: toolbarTextStyle ?? typography.body,
            child: MacosIconTheme(
              data: MacosIconTheme.of(context).copyWith(
                color: foregroundColor,
              ),
              child: IconTheme(
                data: actionsIconTheme ??
                    IconTheme.of(context).copyWith(color: foregroundColor),
                child: leading!,
              ),
            ),
          )
        : null;

    return ToolBar(
      padding: padding,
      title: styledTitle,
      leading: canPop(context)
          ? const AdaptiveBackButton().macos(context)
          : leadingWidget,
      automaticallyImplyLeading: false,
      actions: _buildAction(context, typography),
      height: toolbarHeight ?? _kToolbarHeight,
      decoration: BoxDecoration(
        color: (backgroundColor ?? MacosTheme.of(context).canvasColor)
            .withOpacity(toolbarOpacity),
      ),
      titleWidth: titleWidth ?? _kTitleWidth,
      centerTitle: centerTitle,
    );
  }

  List<ToolbarItem>? _buildAction(
      BuildContext context, MacosTypography typography) {
    final toolbarItems = actions?.map(
      (e) => e.toMacOS(
        context,
        customItem: (child) {
          return DefaultTextStyle(
            style: typography.body,
            child: MacosIconTheme(
              data: MacosIconTheme.of(context).copyWith(color: foregroundColor),
              child: IconTheme(
                data: actionsIconTheme ??
                    IconTheme.of(context).copyWith(color: foregroundColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
    return toolbarItems?.toList();
  }
}
