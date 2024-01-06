import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/core.dart';
import '../../buttons/back_button.dart';
import '../appbar_action/appbar_action.dart';
import '../appbar_action/extension.dart';

/// The default height for the app bar.
const double kAppBarPageHeight = 48.0;

/// An adaptive app bar that adjusts its appearance based on the platform.
///
/// See also:
///
///  * [AdaptiveAppBar], a more generic app bar widget for consistent adaptive styling.
///  * [AdaptiveNavigationAppBar], a specialized app bar designed for navigation scenarios.
class AdaptiveAppBarPage extends CoreAdaptiveComponent {
  /// Creates an adaptive app bar.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// const AdaptiveAppBarPage(
  ///   title: Text('Adaptive App'),
  ///   leading: AdaptiveIcon(AdpIcons.home),
  ///   actions: [
  ///     AdaptiveAppBarAction(
  ///       icon: AdaptiveIcon(AdpIcons.search),
  ///       onPressed: () {
  ///         // Handle search action
  ///       },
  ///     ),
  ///     // ... other platform-specific actions
  ///   ],
  /// );
  /// ```
  ///
  /// Supported actions:
  ///
  /// - [AdaptiveAppBarDivider]
  /// - [AdaptiveAppBarButton]
  /// - [AdaptiveAppBarPulldownButton]
  /// - [AdaptiveAppBarCustomItem]
  ///
  /// See also:
  ///
  ///  *  [AdaptiveAppBarPage.platformActions]: A app bar widget with custom actions.
  const AdaptiveAppBarPage({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.dividerColor,
    this.borderRadius,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    this.height = kAppBarPageHeight,
  }) : platformActions = null;

  /// Use this constructor to define platform-specific actions for the app bar.
  ///
  /// On Windows, it accepts a [CommandBar] with primary and secondary items for various actions:
  ///
  /// - [CommandBarButton]
  /// - [CommandBarBuilderItem]
  /// - [CommandBarSeparator]
  ///
  /// On macOS, it accepts an array of toolbar items, including buttons and a pull-down menu:
  ///
  /// - [ToolBarPullDownButton]
  /// - [ToolBarIconButton]
  /// - [ToolBarDivider]
  /// - [ToolBarSpacer]
  /// - [ToolbarItem]
  ///
  /// Example Usage:
  ///
  /// ```dart
  /// AdaptiveAppBarPage.platformActions(
  ///   title: Text('My Adaptive App'),
  ///   actions: PropertiesLogic(
  ///     windows: () => CommandBar(
  ///       primaryItems: [
  ///         CommandBarButton(
  ///           // ... (windows-specific actions)
  ///         ),
  ///         CommandBarSeparator(),
  ///         CommandBarButton(
  ///           // ... (windows-specific actions)
  ///         ),
  ///       ],
  ///     ),
  ///     macos: () => [
  ///       ToolBarIconButton(
  ///         // ... (macOS-specific actions)
  ///       ),
  ///       const ToolBarDivider(),
  ///       ToolBarIconButton(
  ///         // ... (macOS-specific actions)
  ///       ),
  ///     ],
  ///   ),
  /// );
  /// ```
  const AdaptiveAppBarPage.platformActions({
    super.key,
    this.title,
    this.leading,
    this.dividerColor,
    this.borderRadius,
    this.backgroundColor,
    this.platformActions,
    this.automaticallyImplyLeading = true,
    this.height = kAppBarPageHeight,
  }) : actions = null;

  /// Specifies the height of this [AdaptiveAppBarPage].
  ///
  /// on Windows: Defaults to [kAppBarPageHeight] which is 48.0.
  /// on macOS: Defaults to [kAppBarPageHeight] + 8 which is 56.0.
  final double height;

  /// The [title] of the adaptive appBar page.
  ///
  /// Typically, a [Text] widget.
  final Widget? title;

  /// The widget displayed before the title.
  ///
  /// Usually an [Icon] widget.
  final Widget? leading;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The color of the divider line beneath the app bar.
  final Color? dividerColor;

  /// The border radius of the app bar.
  final BorderRadiusGeometry? borderRadius;

  /// Common actions for the app bar on both platforms.
  final List<AdaptiveAppBarActionEntry>? actions;

  /// Platform-specific actions for the app bar.
  final CoreProperties<CommandBar?, List<ToolbarItem>?>? platformActions;

  /// Controls whether the appbar should try to imply if the [leading] widget
  /// is null.
  ///
  /// If `true` and [leading] is null, the toolbar will automatically try to
  /// deduce what the leading widget should be. If `false` and [leading] is
  /// null, leading space is given to [title]. If the [leading] widget is not
  /// null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height, maxHeight: height + 8),
      child: super.build(context),
    );
  }

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height, maxHeight: height),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: dividerColor ?? theme.resources.controlStrokeColorDefault,
            ),
          ),
        ),
        position: DecorationPosition.foreground,
        child: Acrylic(
          tint: backgroundColor ??
              theme.resources.solidBackgroundFillColorSecondary,
          shape: borderRadius != null
              ? RoundedRectangleBorder(borderRadius: borderRadius!)
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                if (leading == null &&
                    automaticallyImplyLeading &&
                    (Navigator.canPop(context)))
                  Center(child: const AdaptiveBackButton().windows(context)),
                if (leading != null)
                  IconTheme.merge(
                    data: theme.iconTheme.copyWith(size: 18.0),
                    child: leading!,
                  ),
                if (leading != null) const SizedBox(width: 4.0),
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2.7),
                    child: DefaultTextStyle.merge(
                      style: theme.typography.title?.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Center(child: title),
                    ),
                  ),
                if (actions != null && actions!.isNotEmpty)
                  Expanded(
                    child: DynamicOverflow(
                      alignment: MainAxisAlignment.end,
                      overflowWidget: const SizedBox.shrink(),
                      children:
                          actions!.map((e) => e.toWindows(context)).toList(),
                    ),
                  ),
                if (platformActions?.windows != null)
                  Expanded(child: platformActions!.windows!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    final theme = MacosTheme.of(context);

    final defaultBackgroundColor = CupertinoDynamicColor.resolve(
      backgroundColor ?? theme.canvasColor,
      context,
    );

    final styledTitle = title != null
        ? DefaultTextStyle(
            style: theme.typography.title3.copyWith(fontWeight: MacosFontWeight.w590),
            child: title!,
          )
        : null;

    return ToolBar(
      leading: leading,
      height: height + 8,
      title: styledTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        borderRadius: borderRadius,
      ),
      dividerColor: dividerColor,
      actions: actions?.map((e) => e.toMacOS(context)).toList() ??
          platformActions?.macos,
    );
  }
}
