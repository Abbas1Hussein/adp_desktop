import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../layout/appbar_action/appbar_action.dart';
import 'platforms/platforms.dart';

/// space to inscribe inside the nav app bar. The [title], if any, is
/// placed inside this padding.
const _kPaddingInsets = EdgeInsets.symmetric(horizontal: 8, vertical: 4.0);

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
    this.toolbarTextStyle,
    this.foregroundColor,
    this.backgroundColor,
    this.actionsIconTheme,
    this.leadingWidth,
    this.toolbarHeight,
    this.titleTextStyle,
    this.titleWidth,
    this.centerTitle = true,
    this.toolbarOpacity = 1.0,
    this.padding = _kPaddingInsets,
    this.automaticallyImplyLeading = true,
  });

  /// The [title] of the adp navigation appBar .
  ///
  /// Typically a [Text] widget that contains the app name.
  final Widget? title;

  /// Specifies the width of the title of the [AdaptiveNavigationAppBar].
  final double? titleWidth;

  /// The widget at the beginning of the app bar, before [title].
  ///
  /// Typically the [leading] widget is an [AdaptiveIcon] or an [AdaptiveIconButton].
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// view will imply an appropriate widget. If the parent [Navigator] can
  /// go back, the app bar will use an [AdaptiveIconButton] that calls [Navigator.maybePop].
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

  /// The icon theme for actions in the app bar.
  final IconThemeData? actionsIconTheme;

  /// The list of actions to display in the app bar.
  ///
  /// - [AdaptiveAppBarDivider]
  /// - [AdaptiveAppBarButton]
  /// - [AdaptiveAppBarPulldownButton]
  /// - [AdaptiveAppBarCustomItem]
  final List<AdaptiveAppBarActionEntry>? actions;

  /// Whether the [title] should be centered.
  final bool centerTitle;

  /// The opacity of the app bar.
  final double toolbarOpacity;

  /// Specifies the height of this [AdaptiveNavigationAppBar].
  final double? toolbarHeight;

  /// The text style for the title.
  final TextStyle? titleTextStyle;

  /// The text style for the toolbar.
  final TextStyle? toolbarTextStyle;

  /// The foreground color of the app bar.
  final Color? foregroundColor;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// space to inscribe inside the nav app bar. The [title], if any, is
  /// placed inside this padding.
  final EdgeInsets padding;

  @override
  ToolBar toMacos(BuildContext context) {
    return NABMacos(
      title: title,
      padding: padding,
      leading: leading,
      actions: actions,
      titleWidth: titleWidth,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      toolbarHeight: toolbarHeight,
      toolbarOpacity: toolbarOpacity,
      titleTextStyle: titleTextStyle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      toolbarTextStyle: toolbarTextStyle,
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
    ).build(context) as ToolBar;
  }

  @override
  NavigationAppBar toWindows(BuildContext context) {
    return NABWindows(
      context: context,
      title: title,
      insets: padding,
      leading: leading,
      actions: actions,
      titleWidth: titleWidth,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      toolbarHeight: toolbarHeight,
      toolbarOpacity: toolbarOpacity,
      titleTextStyle: titleTextStyle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      toolbarTextStyle: toolbarTextStyle,
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
    ).call();
  }
}
