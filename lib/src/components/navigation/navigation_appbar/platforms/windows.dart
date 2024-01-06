import 'package:adp_desktop/src/components/buttons/back_button.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../layout/appbar_action/appbar_action.dart';
import '../../../layout/appbar_action/extension.dart';

const double _kDefaultAppBarHeight = 44.0;

class NABWindows {
  const NABWindows({
    this.leading,
    this.title,
    this.actions,
    this.toolbarTextStyle,
    this.actionsIconTheme,
    this.foregroundColor,
    this.backgroundColor,
    this.toolbarHeight,
    this.automaticallyImplyLeading = false,
    this.toolbarOpacity = 1.0,
    this.leadingWidth,
    this.titleTextStyle,
    this.titleWidth,
    required this.centerTitle,
    required this.insets,
    required this.context,
  });

  final Widget? title;
  final Widget? leading;
  final EdgeInsets insets;
  final bool centerTitle;
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

  bool get canPop {
    return leading == null &&
        automaticallyImplyLeading &&
        ModalRoute.of(context)?.canPop == true;
  }

  NavigationAppBar call() {
    final theme = FluentTheme.of(context);

    return NavigationAppBar(
      title: _buildLeadingWithTitle(theme),
      leading: canPop ? const AdaptiveBackButton().windows(context) : null,
      automaticallyImplyLeading: false,
      backgroundColor:
          (backgroundColor ?? theme.navigationPaneTheme.overlayBackgroundColor)?.withOpacity(toolbarOpacity),
      actions: _buildActions(context, theme),
      height: toolbarHeight ?? (_kDefaultAppBarHeight),
    );
  }

  Widget? _buildActions(BuildContext context, FluentThemeData theme) {
    if (actions == null) return null;

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
              ...actions!.map(
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

  Widget _buildLeadingWithTitle(FluentThemeData theme) {
    return Row(
      children: [
        if (leading != null)
          DefaultTextStyle(
            style: toolbarTextStyle ?? theme.typography.caption!,
            child: SizedBox(width: leadingWidth, child: leading),
          ),
        if (leading != null) const SizedBox(width: 8.0),
        if (centerTitle) const Spacer(),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: DefaultTextStyle(
              style: titleTextStyle ??
                  theme.typography.bodyStrong!
                      .copyWith(fontWeight: FontWeight.bold),
              child: SizedBox(
                  width: titleWidth,
                  child: centerTitle == true ? Center(child: title) : title),
            ),
          ),
        if (centerTitle) const Spacer(),
      ],
    );
  }
}
