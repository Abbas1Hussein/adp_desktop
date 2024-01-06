import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide IconButton;
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../buttons/back_button.dart';
import '../../buttons/close_button.dart';
import '../../icon/icons.dart';

class AdaptiveAppBar extends CoreAdaptiveComponent
    implements PreferredSizeWidget {
  AdaptiveAppBar({
    this.shape,
    this.title,
    this.bottom,
    this.leading,
    this.actions,
    this.elevation,
    this.flexibleSpace,
    this.surfaceTintColor,
    this.shadowColor,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.iconDrawerTheme,
    this.iconEndDrawerTheme,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.centerTitle = true,
    this.primary = true,
    this.toolbarHeight,
    this.leadingWidth,
    this.clipBehavior,
    this.backButton,
    this.closeButton,
    this.toolbarTextStyle,
    this.scrolledUnderElevation,
    this.excludeHeaderSemantics = false,
    this.automaticallyImplyLeading = true,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    super.key,
  })  : assert(elevation == null || elevation >= 0.0),
        preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  @override
  final Size preferredSize;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// Becomes the leading component of the [NavigationToolbar] built
  /// by this widget. The [leading] widget's width and height are constrained to
  /// be no bigger than [leadingWidth] and [toolbarHeight] respectively.
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// [AdaptiveAppBar] will imply an appropriate widget. For example, if the [AdaptiveAppBar] is
  /// in a [Scaffold] that also has a [Drawer], the [Scaffold] will fill this
  /// widget with an [IconButton] that opens the drawer (using [Icons.menu]). If
  /// there's no [Drawer] and the parent [Navigator] can go back, the [AdaptiveAppBar]
  /// will use a [BackButton] that calls [Navigator.maybePop].
  ///
  ///
  /// The following code shows how the drawer button could be manually specified
  /// instead of relying on [automaticallyImplyLeading]:
  ///
  /// ```dart
  /// AdaptiveAppBar(
  ///   leading: Builder(
  ///     builder: (BuildContext context) {
  ///       return AdaptiveIconButton(
  ///         icon: const AdaptiveIcon(AdpIcons.more),
  ///         onPressed: () { Scaffold.of(context).openDrawer(); },
  ///       );
  ///     },
  ///   ),
  /// )
  /// ```
  ///
  /// The [Builder] is used in this example to ensure that the `context` refers
  /// to that part of the subtree. That way this code snippet can be used even
  /// inside the very code that is creating the [Scaffold] (in which case,
  /// without the [Builder], the `context` wouldn't be able to see the
  /// [Scaffold], since it would refer to an ancestor of that widget).
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// The primary widget displayed in the adp app bar.
  ///
  /// Becomes the middle component of the [NavigationToolbar] built by this widget.
  ///
  /// Typically a [Text] widget that contains a description of the current
  /// contents of the app.
  ///
  /// The [title]'s width is constrained to fit within the remaining space
  /// between the toolbar's [leading] and [actions] widgets. Its height is
  /// _not_ constrained. The [title] is vertically centered and clipped to fit
  /// within the toolbar, whose height is [toolbarHeight]. Typically this
  /// isn't noticeable because a simple [Text] [title] will fit within the
  /// toolbar by default. On the other hand, it is noticeable when a
  /// widget with an intrinsic height that is greater than [toolbarHeight]
  /// is used as the [title]. For example, when the height of an Image used
  /// as the [title] exceeds [toolbarHeight], it will be centered and
  /// clipped (top and bottom), which may be undesirable. In cases like this
  /// the height of the [title] widget can be constrained. For example:
  ///
  /// ```dart
  /// AdpApp(
  ///   home: AdaptiveScaffold(
  ///     appBar: AdaptiveAppBar(
  ///       title: SizedBox(
  ///         height: _myToolbarHeight,
  ///         child: Image.asset(_logoAsset),
  ///       ),
  ///       toolbarHeight: _myToolbarHeight,
  ///     ),
  ///   ),
  /// )
  /// ```
  final Widget? title;

  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// The [actions] become the trailing component of the [NavigationToolbar] built
  /// by this widget. The height of each action is constrained to be no bigger
  /// than the [toolbarHeight].
  ///
  /// To avoid having the last action covered by the debug banner, you may want
  /// to set the [MaterialApp.debugShowCheckedModeBanner] to false.
  final List<Widget>? actions;

  /// This widget is stacked behind the toolbar and the tab bar. Its height will
  /// be the same as the app bar's overall height.
  ///
  ///
  /// Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
  final Widget? flexibleSpace;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget? bottom;

  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// This property controls the size of the shadow below the app bar if
  /// [shadowColor] is not null.
  ///
  /// If [surfaceTintColor] is not null then it will apply a surface tint overlay
  /// to the background color.
  ///
  /// The value must be non-negative.
  final double? elevation;

  /// The elevation that will be used if this app bar has something
  /// scrolled underneath it.
  ///
  ///
  /// The value must be non-negative.
  final double? scrolledUnderElevation;

  /// A check that specifies which child's [ScrollNotification]s should be
  /// listened to.
  ///
  /// By default, checks whether `notification.depth == 0`. Set it to something
  /// else for more complicated layouts.
  final ScrollNotificationPredicate notificationPredicate;

  /// The color of the shadow below the app bar.
  ///
  /// See also:
  ///
  ///  * [elevation], which defines the size of the shadow below the app bar.
  ///  * [shape], which defines the shape of the app bar and its shadow.
  final Color? shadowColor;

  /// The color of the surface tint overlay applied to the app bar's
  /// background color to indicate elevation.
  final Color? surfaceTintColor;

  /// The shape of the app bar's .
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  ///
  /// See also:
  ///
  ///  * [elevation], which defines the size of the shadow below the app bar.
  ///  * [shadowColor], which is the color of the shadow below the app bar.
  final ShapeBorder? shape;

  /// The fill color to use for an app bar's.
  ///
  /// See also:
  ///
  ///  * [foregroundColor], which specifies the color for icons and text within
  ///    the app bar.
  final Color? backgroundColor;

  /// The default color for [Text] and [Icon]s within the app bar.
  ///
  /// See also:
  ///
  ///  * [backgroundColor], which specifies the app bar's background color.
  final Color? foregroundColor;

  /// The color, opacity, and size to use for all toolbar icons.
  ///
  /// The [AppBarIconTheme.icon] will be ignore.
  ///
  /// See also:
  ///
  ///  * [iconDrawerTheme], which specifies theme for drawer icon.
  ///  * [iconEndDrawerTheme], which specifies theme for end drawer icon.
  final AppBarIconTheme? iconTheme;

  /// The color, opacity, size and adp Icon data, to use for the drawer icon that appear in the app
  ///
  /// See also:
  ///
  ///  * [iconEndDrawerTheme], which specifies theme for end drawer icon.
  final AppBarIconTheme? iconDrawerTheme;

  /// The color, opacity, size and adp Icon data, to use for the end drawer icon that appear in the app
  ///
  /// See also:
  ///
  ///  * [iconDrawerTheme], which specifies theme for drawer icon.
  final AppBarIconTheme? iconEndDrawerTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// If true, the app bar's toolbar elements and [bottom] widget will be
  /// padded on top by the height of the system status bar. The layout
  /// of the [flexibleSpace] is not affected by the [primary] property.
  final bool primary;

  /// Whether the title should be centered.
  ///
  /// Defaults to true.
  final bool centerTitle;

  /// Whether the title should be wrapped with header [Semantics].
  ///
  /// Defaults to false.
  final bool excludeHeaderSemantics;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  final double? titleSpacing;

  /// How opaque the toolbar part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  final double toolbarOpacity;

  /// How opaque the bottom part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  final double bottomOpacity;

  /// Defines the height of the toolbar component of an [AdaptiveAppBar].
  ///
  /// By default, the value of [toolbarHeight] is [kToolbarHeight].
  final double? toolbarHeight;

  /// Defines the width of [leading] widget.
  ///
  /// By default, the value of [leadingWidth] is 56.0.
  final double? leadingWidth;

  /// The default text style for the Adp AppBar's [leading], and
  /// [actions] widgets, but not its [title].
  ///
  /// See also:
  ///
  ///  * [DefaultTextStyle], which overrides the default text style for all of the
  ///    widgets in a subtree.
  final TextStyle? toolbarTextStyle;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip? clipBehavior;

  /// Widget representing a custom back button for the app bar.
  ///
  /// If provided, this widget will be used as the back button in the app bar
  /// when the `canPop`.
  ///
  /// Defaults to [AdaptiveBackButton].
  final Widget? backButton;

  /// Widget representing a custom close button for the app bar.
  ///
  /// If provided, this widget will be used as the close button in the app bar
  /// when the `canPop` condition is met. The close button typically appears
  /// when the screen is presented modally with `fullscreenDialog` set to true
  /// in the `PageRoute`.
  ///
  /// Defaults to [AdaptiveCloseButton].
  final Widget? closeButton;

  /// Checks whether the app bar should have a drawer based on the `automaticallyImplyLeading`
  /// flag and the presence of a drawer in the current `AdaptiveScaffold` context.
  ///
  /// If `automaticallyImplyLeading` is true and there is a drawer in the `AdaptiveScaffold`,
  /// it returns true; otherwise, it returns false.
  ///
  /// This function is typically used to determine whether a leading widget,
  /// such as a drawer icon, should be displayed in the app bar.
  bool hasDrawer(BuildContext context) =>
      automaticallyImplyLeading && Scaffold.of(context).hasDrawer;

  /// Checks whether the app bar should have an end drawer based on the presence
  /// of an end drawer in the current `AdaptiveScaffold` context.
  ///
  /// If there is an end drawer in the `AdaptiveScaffold`, it returns true; otherwise, it returns false.
  ///
  /// This function is typically used to determine whether an end drawer icon
  /// should be displayed in the app bar.
  bool hasEndDrawer(BuildContext context) => Scaffold.of(context).hasEndDrawer;

  /// Determines whether the app bar should include a back button.
  ///
  /// The back button is displayed if there is no custom leading widget,
  /// `automaticallyImplyLeading` is true, and there is the possibility to pop
  /// the current route from the navigation stack.
  bool useBackButton(BuildContext context) {
    return leading == null &&
        automaticallyImplyLeading &&
        Navigator.canPop(context);
  }

  /// Builds the back button widget if applicable.
  ///
  /// If the `canPop` condition is met, the back button is displayed;
  /// otherwise, it returns null.
  Widget _buildBackButton(BuildContext context) {
    return Center(child: backButton ?? const AdaptiveBackButton());
  }

  /// Builds the close button widget if applicable.
  ///
  /// If the `canPop` and fullscreenDialog condition is met, the close button is displayed;
  /// otherwise, it defaults to [AdaptiveCloseButton].
  Widget _buildCloseButton(BuildContext context) {
    return Center(child: closeButton ?? const AdaptiveCloseButton());
  }

  @override
  Widget macos(BuildContext context) {
    final theme = MacosTheme.of(context);

    final defaultBackgroundColor = MacosDynamicColor.resolve(
        backgroundColor ?? theme.canvasColor, context);

    final defaultIconTheme = IconThemeData(
      size: iconTheme?.size ?? (theme.iconTheme.size),
      color: iconTheme?.color ?? theme.iconTheme.color,
    );

    final titleStyled = title != null
        ? DefaultTextStyle(
            style: toolbarTextStyle?.copyWith(color: foregroundColor) ??
                theme.typography.title2.copyWith(
                  fontWeight: MacosFontWeight.w590,
                  color: foregroundColor,
                ),
            child: title!,
          )
        : null;

    final handelDrawer = hasDrawer(context)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: MacosIconButton(
              boxConstraints: const BoxConstraints.tightFor(),
              icon: MacosIcon(
                size: iconDrawerTheme?.size ?? defaultIconTheme.size,
                color: foregroundColor ??
                    iconDrawerTheme?.color ??
                    defaultIconTheme.color,
                iconDrawerTheme?.icon?.cupertino ?? CupertinoIcons.bars,
              ),
              onPressed: Scaffold.of(context).openDrawer,
            ),
          )
        : null;

    final handelEndDrawer = hasEndDrawer(context)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MacosIconButton(
              boxConstraints: const BoxConstraints.tightFor(),
              icon: MacosIcon(
                size: iconEndDrawerTheme?.size ?? defaultIconTheme.size,
                color: foregroundColor ??
                    iconEndDrawerTheme?.color ??
                    defaultIconTheme.color,
                iconEndDrawerTheme?.icon?.cupertino ?? CupertinoIcons.bars,
              ),
              onPressed: Scaffold.of(context).openEndDrawer,
            ),
          )
        : null;

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? handelLeading = leading;
    if (leading == null && automaticallyImplyLeading) {
      if (hasDrawer(context)) {
        handelLeading = handelDrawer;
      } else if (parentRoute?.impliesAppBarDismissal ?? false) {
        handelLeading = useCloseButton
            ? _buildCloseButton(context)
            : _buildBackButton(context);
      }
    }
    if (leading != null) {
      handelLeading = DefaultTextStyle(
        style: toolbarTextStyle?.copyWith(color: foregroundColor) ??
            theme.typography.body,
        child: leading!,
      );
    }

    return AppBar(
      key: key,
      bottom: bottom,
      primary: primary,
      elevation: elevation,
      shadowColor: shadowColor,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      clipBehavior: clipBehavior,
      leadingWidth: leadingWidth,
      flexibleSpace: flexibleSpace,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      toolbarOpacity: toolbarOpacity,
      titleTextStyle: toolbarTextStyle,
      foregroundColor: foregroundColor,
      surfaceTintColor: surfaceTintColor,
      toolbarTextStyle: toolbarTextStyle,
      backgroundColor: defaultBackgroundColor,
      notificationPredicate: notificationPredicate,
      excludeHeaderSemantics: excludeHeaderSemantics,
      scrolledUnderElevation: scrolledUnderElevation,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: titleStyled,
      leading: handelLeading,
      iconTheme: defaultIconTheme,
      actionsIconTheme: defaultIconTheme,
      shape: shape ?? Border(bottom: BorderSide(color: theme.dividerColor)),
      actions: actions ?? [if (hasEndDrawer(context)) handelEndDrawer!],
    );
  }

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    final defaultIconTheme = IconThemeData(
      size: iconTheme?.size ?? theme.iconTheme.size,
      color: iconTheme?.color ?? theme.iconTheme.color,
    );

    final titleStyled = title != null
        ? DefaultTextStyle(
            style: toolbarTextStyle?.copyWith(color: foregroundColor) ??
                theme.typography.subtitle!.copyWith(color: foregroundColor),
            child: title!,
          )
        : null;

    final handelDrawer = hasDrawer(context)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                size: iconDrawerTheme?.size ?? defaultIconTheme.size,
                color: foregroundColor ??
                    iconDrawerTheme?.color ??
                    defaultIconTheme.color,
                iconDrawerTheme?.icon?.fluent ?? Icons.menu,
              ),
              onPressed: Scaffold.of(context).openDrawer,
            ),
          )
        : null;

    final handelEndDrawer = hasEndDrawer(context)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(
                size: iconEndDrawerTheme?.size ?? defaultIconTheme.size,
                color: foregroundColor ??
                    iconEndDrawerTheme?.color ??
                    defaultIconTheme.color,
                iconEndDrawerTheme?.icon?.fluent ?? Icons.menu,
              ),
              onPressed: Scaffold.of(context).openEndDrawer,
            ),
          )
        : null;

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? handelLeading = leading;
    if (leading == null && automaticallyImplyLeading) {
      if (hasDrawer(context)) {
        handelLeading = handelDrawer;
      } else if (parentRoute?.impliesAppBarDismissal ?? false) {
        handelLeading = useCloseButton
            ? _buildCloseButton(context)
            : _buildBackButton(context);
      }
    }

    if (leading != null) {
      handelLeading = DefaultTextStyle(
        style: toolbarTextStyle?.copyWith(color: foregroundColor) ??
            theme.typography.body!,
        child: leading!,
      );
    }

    return AppBar(
      key: key,
      shape: shape ??
          Border(
            bottom: BorderSide(
              color: theme.resources.dividerStrokeColorDefault,
            ),
          ),
      primary: primary,
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      clipBehavior: clipBehavior,
      flexibleSpace: flexibleSpace,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarOpacity: toolbarOpacity,
      titleTextStyle: toolbarTextStyle,
      foregroundColor: foregroundColor,
      surfaceTintColor: surfaceTintColor,
      backgroundColor: backgroundColor,
      toolbarTextStyle: toolbarTextStyle,
      notificationPredicate: notificationPredicate,
      excludeHeaderSemantics: excludeHeaderSemantics,
      scrolledUnderElevation: scrolledUnderElevation,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: titleStyled,
      leading: handelLeading,
      iconTheme: defaultIconTheme,
      actionsIconTheme: defaultIconTheme,
      actions: actions ?? [if (hasEndDrawer(context)) handelEndDrawer!],
    );
  }
}

/// The size is calculated based on the specified [toolbarHeight] and the preferred height
/// of the [bottom] widget. If these values are not provided, default values are used.
class _PreferredAppBarSize extends Size {
  const _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
        );

  /// The preferred height of the toolbar component of the app bar.
  final double? toolbarHeight;

  /// The preferred height of the bottom widget of the app bar.
  final double? bottomHeight;
}

/// Defines the theme for app bar icons, including specifications for color, size, and the icon itself:
///
///   * [iconTheme]: Specifies the theme for all icons in the app bar.
///   * [iconDrawerTheme]: Specifies the theme for the drawer icon.
///   * [iconEndDrawerTheme]: Specifies the theme for the end drawer icon.
class AppBarIconTheme {
  const AppBarIconTheme({this.icon, this.color, this.size});

  /// The color of the app bar icon.
  final Color? color;

  /// The size of the app bar icon.
  final double? size;

  /// The icon to be displayed in the app bar.
  final AdpIcons? icon;
}
