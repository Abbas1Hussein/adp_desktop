import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/core.dart';

const _contentPadding = EdgeInsets.all(4.0);

/// A custom scaffold page that adapts its appearance based on the platform.
///
/// Use this widget to create a scaffold page with platform-specific
/// styling and behavior:
/// - On macOS, [MacosScaffold] is utilized.
/// - On Windows, [ScaffoldPage] is used.
class AdaptiveScaffoldPage extends CoreAdaptiveComponent {
  /// Creates an adaptive scaffold page.
  ///
  /// Example usage:
  /// ```dart
  /// const AdaptiveScaffoldPage(
  ///   actions: _commonActions,
  ///   title: Text('My Adaptive App'),
  ///   leading: AdaptiveIcon(AdpIcons.home),
  ///   contentPadding: EdgeInsets.all(8.0),
  ///   content: Center(child: AdaptiveDatePicker()),
  /// );
  /// ```
  ///
  /// See also:
  ///
  ///  * [AdaptiveScaffold], a more generic scaffold widget for consistent adaptive styling.
  const AdaptiveScaffoldPage({
    super.key,
    super.builders,
    this.title,
    this.leading,
    this.content,
    this.actions,
    this.barColor,
    this.borderRadius,
    this.dividerColor,
    this.backgroundColor,
    this.contentPadding = _contentPadding,
  });

  /// The title of the  app bar.
  final Widget? title;

  /// The widget displayed before the title.
  ///
  /// Usually an [Icon] widget.
  final Widget? leading;

  /// The main content of the adaptive scaffold page.
  final Widget? content;

  /// The border radius of the app bar.
  final BorderRadiusGeometry? borderRadius;

  /// Padding around the content of the adaptive scaffold page.
  final EdgeInsets contentPadding;

  /// The background color of the adaptive scaffold page.
  final Color? backgroundColor;

  /// The color of the divider line beneath the app bar.
  final Color? dividerColor;

  /// The background color of the app bar.
  final Color? barColor;

  /// Use the [actions] property to define platform-specific actions for the app bar.
  /// On Windows, it accepts a [CommandBar] with primary and secondary items for various actions.
  /// On macOS, it accepts an array of toolbar items, including buttons and a pull-down menu.
  ///
  /// Example Usage:
  ///
  /// ```dart
  /// actions: PropertiesLogic(
  ///   windows: () => CommandBar(
  ///     mainAxisAlignment: MainAxisAlignment.end,
  ///     primaryItems: [
  ///       CommandBarButton(
  ///         icon: const Icon(FluentIcons.add),
  ///         label: const Text('Add'),
  ///         onPressed: () {
  ///           // Add button action for Windows
  ///         },
  ///       ),
  ///       const CommandBarSeparator(),
  ///       CommandBarButton(
  ///         icon: const Icon(FluentIcons.delete),
  ///         label: const Text('Delete'),
  ///         onPressed: () {
  ///           // Delete button action for Windows
  ///         },
  ///       ),
  ///     ],
  ///   ),
  ///   macos: () => [
  ///     ToolBarIconButton(
  ///       label: 'Add',
  ///       showLabel: true,
  ///       onPressed: () {
  ///         // Add button action for macOS
  ///       },
  ///       icon: const MacosIcon(CupertinoIcons.add),
  ///     ),
  ///     const ToolBarDivider(),
  ///     ToolBarIconButton(
  ///       label: 'Delete',
  ///       showLabel: true,
  ///       onPressed: () {
  ///         // Delete button action for macOS
  ///       },
  ///       icon: const MacosIcon(CupertinoIcons.delete),
  ///     ),
  ///   ],
  /// ),
  /// ```
  final CoreProperties<CommandBar?, List<ToolbarItem>?>? actions;

  /// Whether this adp scaffold page has a non-null.
  bool get hasAppBar => title != null || leading != null;

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Mica(
      backgroundColor:
          backgroundColor ?? theme.resources.solidBackgroundFillColorBase,
      child: ScaffoldPage(
        padding: EdgeInsets.zero,
        header: hasAppBar || actions?.windows != null
            ? DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: dividerColor ??
                          theme.resources.controlStrokeColorDefault,
                    ),
                  ),
                ),
                position: DecorationPosition.foreground,
                child: Acrylic(
                  tint: barColor ??
                      theme.resources.solidBackgroundFillColorSecondary,
                  shape: borderRadius != null
                      ? RoundedRectangleBorder(borderRadius: borderRadius!)
                      : null,
                  blurAmount: backgroundColor != null ? 0.0 : null,
                  tintAlpha: backgroundColor != null ? 0.0 : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        if (leading != null)
                          IconTheme.merge(
                              data: theme.iconTheme, child: leading!),
                        if (leading != null) const SizedBox(width: 4.0),
                        if (title != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 2.7),
                            child: DefaultTextStyle.merge(
                              style: theme.typography.bodyStrong,
                              child: title!,
                            ),
                          ),
                        if (actions?.windows != null)
                          Expanded(child: actions!.windows!),
                      ],
                    ),
                  ),
                ),
              )
            : null,
        content: content != null
            ? Padding(
                padding: contentPadding,
                child: CustomSingleChildLayout(
                  delegate: DesktopTextSelectionToolbarLayoutDelegate(
                    anchor: Offset.zero,
                  ),
                  child: content,
                ),
              )
            : const SizedBox.expand(),
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    final isDark = MacosTheme.brightnessOf(context) == Brightness.dark;

    const lightBackgroundColor = CupertinoColors.white;
    const darkBackgroundColor = CupertinoColors.darkBackgroundGray;

    final defaultBackgroundColor = backgroundColor ??
        (isDark ? darkBackgroundColor : lightBackgroundColor);

    return MacosScaffold(
      backgroundColor: defaultBackgroundColor,
      toolBar: hasAppBar || actions?.macos != null
          ? ToolBar(
              title: title,
              leading: leading,
              decoration: BoxDecoration(
                color: barColor ?? defaultBackgroundColor,
                borderRadius: borderRadius,
              ),
              dividerColor: dividerColor,
              actions: actions?.macos,
            )
          : null,
      children: [
        ContentArea(
          minWidth: double.infinity,
          builder: (context, scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(color: defaultBackgroundColor),
              child: Padding(
                padding: contentPadding,
                child: DefaultTextStyle(
                  style: MacosTheme.of(context).typography.body,
                  child: content != null
                      ? CustomSingleChildLayout(
                          delegate: DesktopTextSelectionToolbarLayoutDelegate(
                            anchor: Offset.zero,
                          ),
                          child: content,
                        )
                      : const SizedBox.expand(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
