import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import 'appbar_action.dart';
import 'platforms/platforms.dart';

/// space to inscribe inside the nav app bar. The [title], if any, is
/// placed inside this padding.
const _kPaddingInsets = EdgeInsets.symmetric(horizontal: 8, vertical: 4.0);

/// A custom navigation appBar that adapts its appearance based on the platform.
///
/// Use this component within [AdaptiveNavigationView] to create navigation appBar with platform-specific
/// styling and behavior:
/// - On macOS, [ToolBar] is utilized.
/// - On Windows, [NavigationAppBar] is used.
class AdaptiveNavigationAppBar extends CoreModel<NavigationAppBar, ToolBar> {
  const AdaptiveNavigationAppBar({
    this.leading,
    this.title,
    this.actions,
    this.toolbarTextStyle,
    this.foregroundColor,
    this.backgroundColor,
    this.actionsIconTheme,
    this.leadingWidth,
    this.toolbarHeight,
    this.titleTextStyle,
    this.titleWidth,
    this.centerTitle = false,
    this.toolbarOpacity = 1.0,
    this.insets = _kPaddingInsets,
    this.automaticallyImplyLeading = false,
  });

  /// The title widget to display in the app bar.
  final Widget? title;

  /// The leading widget to display in the app bar.
  final Widget? leading;

  /// Whether to automatically imply leading widget.
  final bool automaticallyImplyLeading;

  /// The list of actions to display in the app bar.
  ///
  /// Use this property to provide a list of [AdaptiveNABActionEntry] elements
  /// that define the actions to be displayed in the adaptive navigation app bar.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// AdaptiveNavigationAppBar(
  ///   actions: [
  ///     AdaptiveNABDivider(),
  ///     AdaptiveNABIconButton(
  ///       label: 'Action 1',
  ///       icon: Icons.add,
  ///       onPressed: () {
  ///         // Handle Action 1
  ///       },
  ///     ),
  ///     AdaptiveNABPulldownButton(
  ///       label: 'More Actions',
  ///       icon: Icons.more_vert,
  ///       items: [
  ///         AdaptivePulldownMenuItem(
  ///           child: Text('Option 1'),
  ///           onTap: () {
  ///             // Handle Option 1
  ///           },
  ///         ),
  ///         // Add more pulldown menu items or dividers as needed
  ///       ],
  ///     ),
  ///     AdaptiveNABCustomItem(
  ///       child: MyCustomActionWidget(),
  ///     ),
  ///   ],
  /// )
  /// ```
  /// - [AdaptiveNABDivider]:  a divider in the adaptive NAB.
  /// - [AdaptiveNABIconButton]:  an icon button in the adaptive NAB.
  /// - [AdaptiveNABPulldownButton]:  a pulldown button in the adaptive NAB.
  /// - [AdaptiveNABCustomItem]:  a custom item in the adaptive NAB.
  final List<AdaptiveNABActionEntry>? actions;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The icon theme for actions in the app bar.
  final IconThemeData? actionsIconTheme;

  /// Whether to center the title in the app bar.
  final bool? centerTitle;

  /// The opacity of the app bar.
  final double toolbarOpacity;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// The text style for the title.
  final TextStyle? titleTextStyle;

  /// The width of the title.
  final double? titleWidth;

  /// The height of the toolbar.
  final double? toolbarHeight;

  /// The foreground color of the app bar.
  final Color? foregroundColor;

  /// The text style for the toolbar.
  final TextStyle? toolbarTextStyle;

  /// space to inscribe inside the nav app bar. The [title], if any, is
  /// placed inside this padding.
  final EdgeInsets insets;

  @override
  ToolBar toMacos(BuildContext context) {
    return NABMacos(
      title: title,
      insets: insets,
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
      insets: insets,
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
