import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';

/// Defines the height of a regular-sized [ToolBar]
const _kToolbarHeight = 52.0;

/// Defines the width of the leading widget in the [ToolBar]
const _kLeadingWidth = 20.0;

/// Defines the width of the [ToolBar]'s title.
const _kTitleWidth = 150.0;

/// space to inscribe inside the toolbar. The [title], if any, is
/// placed inside this padding.
const _kPaddingInsets = EdgeInsets.symmetric(horizontal: 8, vertical: 4.0);

class AppBarMacos extends StatelessWidget {
  final AppBarMacosProperty? property;

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
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

  const AppBarMacos({
    super.key,
    this.property,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
    this.foregroundColor,
    this.actionsIconTheme,
    this.toolbarHeight,
    this.automaticallyImplyLeading = true,
    this.toolbarOpacity = 1.0,
    this.leadingWidth = _kLeadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.titleWidth,
  });

  @override
  Widget build(BuildContext context) {
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
      title: styledTitle,
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      alignment: property?.alignment ?? Alignment.center,
      padding: property?.padding ?? _kPaddingInsets,
      dividerColor: property?.dividerColor,
      enableBlur: property?.enableBlur ?? false,
      allowWallpaperTintingOverrides:
          property?.allowWallpaperTintingOverrides ?? true,
      actions: property?.actions ?? _buildActions(),
      height: toolbarHeight ?? _kToolbarHeight,
      decoration: BoxDecoration(
        color: (backgroundColor ?? MacosTheme.of(context).canvasColor)
            .withOpacity(toolbarOpacity),
      ),
      titleWidth: titleWidth ?? _kTitleWidth,
      centerTitle: centerTitle ?? false,
    );
  }

  List<CustomToolbarItem>? _buildActions() {
    return actions?.map(
      (child) {
        return CustomToolbarItem(
          inToolbarBuilder: (context) {
            final typography = MacosTheme.of(context).typography;
            return DefaultTextStyle(
              style: typography.body,
              child: IconTheme(
                data: actionsIconTheme ??
                    IconTheme.of(context).copyWith(
                      color: foregroundColor ?? typography.body.color,
                    ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: child,
                ),
              ),
            );
          },
        );
      },
    ).toList();
  }
}

class AppBarMacosProperty extends CoreMacosProperty {
  /// Aligns the [title] within the [ToolBar].
  ///
  /// Defaults to [Alignment.center].
  ///
  /// The [ToolBar] will expand to fill its parent and position its
  /// child within itself according to the given value.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final Alignment? alignment;

  /// A list of [ToolbarItem] widgets to display in a row after the [title]
  /// widget, as the toolbar actions.
  ///
  /// Toolbar items include [ToolBarIconButton], [ToolBarPulldownButton],
  /// [ToolBarSpacer], and [CustomToolbarItem] widgets.
  ///
  /// If the toolbar actions exceed the available toolbar width (e.g. when the
  /// window is resized), the overflowed actions are displayed via a
  /// [ToolbarOverflowMenu], that can be opened from the [ToolbarOverflowButton]
  /// at the right edge of the toolbar.
  ///
  /// When used, this [actions] will ignore the actions within AdaptiveAppbar.
  final List<ToolbarItem>? actions;

  /// Empty space to inscribe inside the toolbar. The [title], if any, is
  /// placed inside this padding.
  ///
  /// Defaults to [_kPaddingInsets].
  final EdgeInsets? padding;

  /// The color of the divider below the toolbar.
  ///
  /// Defaults to `MacosTheme.of(context).dividerColor`.
  ///
  /// Set this to `MacosColors.transparent` to remove.
  final Color? dividerColor;

  /// Whether this [ToolBar] is allowed to perform wallpaper tinting overrides.
  ///
  /// This property is supposed to be set to true when this [ToolBar] is
  /// currently visible on the screen (that is, not e.g. hidden by an
  /// [IndexedStack]).
  ///
  /// This parameter only needs to be supplied when [enableBlur] is true.
  ///
  /// By default, macos_ui applies wallpaper tinting to the application's
  /// window to match macOS' native appearance:
  ///
  /// <img src="https://user-images.githubusercontent.com/86920182/220182724-d78319d7-5c41-4e8c-b785-a73a6ea24927.jpg" width=640/>
  ///
  /// However, this effect is realized by inserting `NSVisualEffectView`s behind
  /// Flutter's canvas and turning the background of areas that are meant to be
  /// affected by wallpaper tinting transparent. Since Flutter's
  /// [`ImageFilter.blur`](https://api.flutter.dev/flutter/dart-ui/ImageFilter/ImageFilter.blur.html)
  /// does not support transparency, wallpaper tinting is disabled automatically
  /// when this widget's [enableBlur] and [allowWallpaperTintingOverrides] is
  /// true.
  ///
  /// This is meant to be a temporary solution until
  /// [#16296](https://github.com/flutter/flutter/issues/16296) is resolved in
  /// the Flutter project.
  final bool? allowWallpaperTintingOverrides;

  /// Whether this [ToolBar] should have a blur backdrop filter applied to it.
  final bool? enableBlur;

  const AppBarMacosProperty({
    this.actions,
    this.padding,
    this.alignment,
    this.dividerColor,
    this.enableBlur,
    this.allowWallpaperTintingOverrides,
  });
}
