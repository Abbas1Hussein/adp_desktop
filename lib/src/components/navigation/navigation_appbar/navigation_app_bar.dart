import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../buttons/back_button.dart';
import '../../layout/appbar_action/appbar_action.dart';
import '../../layout/appbar_action/extension.dart';

/// Constants for default toolbar heights on different platforms
const kWindowsToolbarHeight = 44.0;

const kMacosToolbarHeight = 52.0;
const kMacosTitleWidth = 150.0;
const kMacosLeadingWidth = 20.0;

/// Insets for padding inside the navigation app bar
const _kContentInsets = EdgeInsets.symmetric(horizontal: 8, vertical: 4.0);

/// The bar displayed at the top of the app.
///
/// See also:
///
///   * [AdaptiveNavigationView], which uses this to render the app bar.
///
/// Use this component to create navigation appBar with platform-specific
/// styling and behavior:
/// - On macOS, [ToolBar] is utilized.
/// - On Windows, [NavigationAppBar] is used.
class AdaptiveNavigationAppBar extends CoreModel<NavigationAppBar, ToolBar> {
  const AdaptiveNavigationAppBar({
    this.title,
    this.actions,
    this.leading,
    this.backButton,
    this.leadingWidth,
    this.toolbarHeight,
    this.titleTextStyle,
    this.backgroundColor,
    this.titleWidth,
    this.centerTitle = false,
    this.toolbarOpacity = 1.0,
    this.contentInsets = _kContentInsets,
    this.automaticallyImplyLeading = true,
  });

  /// The title of the adp navigation appBar .
  ///
  /// Typically a [Text] widget that contains the app name.
  final Widget? title;

  /// Specifies the width of the [title] in nav app bar.
  final double? titleWidth;

  /// Whether the [title] should be centered.
  ///
  /// Defaults is false.
  final bool centerTitle;

  /// The insets around the content inside the navigation app bar.
  ///
  /// Default is [_kContentInsets], which is a constant specifying the default insets.
  final EdgeInsets contentInsets;

  /// The widget at the beginning of the app bar, before [title].
  ///
  /// Typically the [leading] widget is an [AdaptiveIcon] or an [AdaptiveIconButton].
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// view will imply an appropriate widget. If the parent [Navigator] can
  /// go back, the app bar will use an [backButton] that calls [Navigator.maybePop].
  ///
  /// See also:
  ///
  ///   * [automaticallyImplyLeading], that controls whether we should try to
  /// imply the leading widget, if [leading] is null
  final Widget? leading;

  /// Specifies the width of the leading of the [AdaptiveNavigationAppBar].
  final double? leadingWidth;

  /// Controls whether the [AdaptiveNavigationAppBar] should try to imply if the [leading] widget
  /// is null.
  ///
  /// If `true` and [leading] are null, the adp navigation appBar will automatically try to
  /// deduce what the leading widget should be. If `false` and [leading] is
  /// null, leading space is given to [title]. If the [leading] widget is not
  /// null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// The list of entry actions to display in the app bar.
  ///
  /// - [AdaptiveActionDivider]: Represents a visual divider or separator within the app bar.
  ///   It aids in organizing and visually separating groups of actions.
  ///
  /// - [AdaptiveActionButton]: Represents a standard action button that users can click
  ///   to perform a specific action. Examples include saving, sharing, or navigating to another screen.
  ///
  /// - [AdaptiveActionPulldownButton]: Represents a button that, when clicked or tapped,
  ///   reveals a dropdown menu with additional options. Useful for compactly representing
  ///   multiple related actions.
  ///
  /// - [AdaptiveActionCustomItem]: Represents a custom item within the app bar.
  /// for implementing custom behaviors or incorporating non-standard components.
  final List<AdaptiveActionEntry>? actions;

  /// The widget to be used as the back button in the app bar.
  ///
  /// If [backButton] is provided, it will be used as the custom back button widget.
  /// If [backButton] is null, the default [AdaptiveBackButton] will be used.
  final Widget? backButton;

  /// The background color of the navigation app bar.
  ///
  /// If [backgroundColor] is specified, it sets the color of the app bar.
  /// If [backgroundColor] is null, the app bar uses the default background color based on the platform theme.
  final Color? backgroundColor;

  /// How opaque the toolbar part of the nav app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  final double toolbarOpacity;

  /// Defines the height of the toolbar component of an [AppBar].
  ///
  /// By default, the value of [toolbarHeight] is,
  /// on macOS: [kMacosToolbarHeight],
  /// on Windows: [kWindowsToolbarHeight].
  final double? toolbarHeight;

  /// The default text style for the nav AppBar's [title] widget.
  ///
  /// See also:
  ///
  ///  * [DefaultTextStyle], which overrides the default text style for all of the
  ///    widgets in a subtree.
  final TextStyle? titleTextStyle;

  /// Determines if the current navigation stack can be popped.
  ///
  /// This method checks whether a leading widget is not explicitly set ([leading] is null),
  /// [automaticallyImplyLeading] is set to true, and the current navigation route can be popped.
  ///
  /// Returns `true` if the conditions are met, indicating that the app can navigate back.
  bool canPop(BuildContext context) {
    return leading == null &&
        automaticallyImplyLeading &&
        ModalRoute.of(context)?.canPop == true;
  }

  /// Builds the back button widget for the app bar.
  ///
  /// If [backButton] is provided, it is used as the back button. Otherwise,
  /// the default [AdaptiveBackButton] is used.
  Widget get _buildBackButton => backButton ?? const AdaptiveBackButton();

  @override
  ToolBar toMacos(BuildContext context) {
    final typography = MacosTheme.of(context).typography;

    final styledTitle = title != null
        ? DefaultTextStyle(
            maxLines: 1,
            style: titleTextStyle ??
                typography.title3.copyWith(fontWeight: MacosFontWeight.w510),
            child: title!,
          )
        : null;

    final styledLeading = leading != null
        ? DefaultTextStyle(
            style: typography.body,
            child: SizedBox(
              width: leadingWidth ?? kMacosLeadingWidth,
              child: leading!,
            ),
          )
        : null;

    final buildActions = actions
        ?.map(
          (e) => e.toMacOS(
            context,
            customItem: (child) {
              return DefaultTextStyle(
                style: typography.body,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: child,
                ),
              );
            },
          ),
        )
        .toList();

    return ToolBar(
      padding: contentInsets,
      title: styledTitle,
      actions: buildActions,
      decoration: BoxDecoration(
        color: (backgroundColor ?? MacosTheme.of(context).canvasColor)
            .withOpacity(toolbarOpacity),
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      titleWidth: titleWidth ?? kMacosTitleWidth,
      height: toolbarHeight ?? kMacosToolbarHeight,
      leading: canPop(context) ? _buildBackButton : styledLeading,
    );
  }

  @override
  NavigationAppBar toWindows(BuildContext context) {
    final theme = FluentTheme.of(context);

    final buildActions = actions != null
        ? Padding(
            padding: contentInsets,
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
          )
        : null;

    return NavigationAppBar(
      backgroundColor:
          (backgroundColor ?? theme.navigationPaneTheme.overlayBackgroundColor)
              ?.withOpacity(toolbarOpacity),
      actions: buildActions,
      automaticallyImplyLeading: false,
      title: _buildLeadingWithTitle(theme),
      leading: canPop(context) ? _buildBackButton : null,
      height: toolbarHeight ?? (kWindowsToolbarHeight),
    );
  }

  Widget _buildLeadingWithTitle(FluentThemeData theme) {
    return Row(
      children: [
        if (leading != null)
          DefaultTextStyle(
            style: theme.typography.caption!,
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
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15.0),
              child: SizedBox(
                width: titleWidth,
                child: centerTitle == true ? Center(child: title) : title,
              ),
            ),
          ),
        if (centerTitle) const Spacer(),
      ],
    );
  }
}
