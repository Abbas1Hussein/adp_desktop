import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';
import '../../buttons/button/macos.dart';
import '../../navigation/tab_view/tab_view.dart';

const _kListTileContentPadding = kContentPadding;
const _kListTileConstraints = BoxConstraints(minHeight: 48.0, minWidth: 48.0);

/// The list tiles are used to represent a single piece of information, typically within a list or grid layout.
/// They provide a compact and structured way to display data, often including an icon, title, and additional details.
///
/// ## The AdaptiveListTile layout isn't exactly what I want
///
/// If the way AdaptiveListTile pads and positions its elements isn't quite what
/// you're looking for, it's easy to create custom list items with a
/// combination of other widgets, such as [Row]s and [Column]s.
///
/// Use this widget to create list Tiles with platform-specific
/// styling and behavior:
/// - On macOS, [MacosListTile] is utilized.
/// - On Windows, [ListTile] is used.
class AdaptiveListTile extends CoreAdaptiveComponent {
  const AdaptiveListTile({
    super.key,
    super.builders,
    this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.enabled = true,
    this.mouseCursor,
    this.onLongPress,
    this.onTap,
    this.contentPadding = _kListTileContentPadding,
    this.shape = kDefaultListTileShape,
    this.hoverColor,
    this.pressColor,
    this.disabledColor,
    this.backgroundColor,
    this.useBackgroundColor = false,
  });

  /// Determines whether this list tile is interactive.
  final bool enabled;

  /// The primary content of the adp list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// A widget to display before the title.
  ///
  /// Typically an [AdaptiveIcon] or a [CircleAvatar] widget.
  final Widget? leading;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [AdaptiveIcon] widget.
  final Widget? trailing;

  /// Padding applied to the content of the list tile.
  ///
  /// Defaults to [_kListTileContentPadding].
  final EdgeInsetsGeometry contentPadding;

  /// The mouse cursor to be used when hovering over the tile.
  ///
  /// If `null`, the cursor will be `SystemMouseCursors.click` when enabled,
  /// otherwise, it will be `SystemMouseCursors.forbidden`.
  final MouseCursor? mouseCursor;

  /// A callback function invoked when the user taps on this list tile.
  ///
  /// If provided, this function will be triggered when the user taps on the list tile.
  /// If `null` or [enabled] == false,, the tile is non-tappable.
  final GestureTapCallback? onTap;

  /// A callback function invoked when the tile is long-pressed.
  ///
  /// If `null` or [enabled] == false, the tile does not respond to long-press gestures.
  final GestureLongPressCallback? onLongPress;

  /// The shape of the tile.
  ///
  /// [kDefaultListTileShape] is used by default.
  final ShapeBorder shape;

  /// The color of the tile when it is being hovered over.
  final Color? hoverColor;

  /// The color of the tile when it is pressed.
  final Color? pressColor;

  /// The color of the tile when it is disabled.
  final Color? disabledColor;

  /// The background color of the tile.
  final Color? backgroundColor;

  /// Determines whether to use the platform background color by default.
  ///
  /// If set to `true`, the platform background color will be applied; otherwise, it remains transparent.
  ///
  /// if [backgroundColor] not null, this will ignore.
  ///
  /// By default, it is set to `false`.
  final bool useBackgroundColor;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    return ConstrainedBox(
      constraints: _kListTileConstraints.copyWith(
        maxHeight: _kListTileConstraints.maxHeight + 10,
      ),
      child: GestureDetector(
        onLongPress: enabled ? onLongPress : null,
        child: ListTile(
          shape: shape,
          title: title != null
              ? DefaultTextStyle.merge(
                  style: theme.typography.body
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  child: title!,
                )
              : null,
          leading: leading,
          subtitle: subtitle,
          trailing: trailing,
          contentPadding: contentPadding,
          cursor: mouseCursor ??
              (enabled
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.forbidden),
          onPressed: enabled ? (onTap ?? () {}) : null,
          tileColor: WidgetStateProperty.resolveWith(
            (states) {
              return WidgetStateExtension.forStates(
                states,
                pressed: pressColor ??
                    theme.resources.cardBackgroundFillColorSecondary,
                hovering: hoverColor ??
                    theme.resources.controlAltFillColorQuarternary,
                disabled: disabledColor ??
                    theme.resources.cardBackgroundFillColorDefault,
                none: backgroundColor ??
                    (useBackgroundColor
                        ? theme.resources.cardBackgroundFillColorDefault
                        : Colors.transparent),
              );
            },
          ),
        ),
      ).applyDisabledEffect(!enabled, 0.3, false),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final typography = MacosTheme.of(context).typography;

    final tile = Row(
      children: [
        if (leading != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: leading,
          ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                DefaultTextStyle.merge(
                  style: typography.headline.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  child: title!,
                ),
              if (subtitle != null)
                DefaultTextStyle.merge(
                  style: typography.subheadline.copyWith(
                    color: MacosTheme.brightnessOf(context) == Brightness.dark
                        ? MacosColors.systemGrayColor
                        : const MacosColor(0xff88888C),
                  ),
                  child: subtitle!,
                ),
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );

    return ConstrainedBox(
      constraints: _kListTileConstraints,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: MacosButton(
          shape: shape,
          padding: contentPadding,
          pressedOpacity: onTap == null ? 1.0 : 0.6,
          mouseCursor: mouseCursor ?? SystemMouseCursors.click,
          onPressed: enabled ? (onTap ?? () {}) : null,
          onLongPress: enabled ? onLongPress : null,
          pressedColor: pressColor,
          disabledColor: disabledColor,
          backgroundColor: backgroundColor ??
              (useBackgroundColor ? null : Colors.transparent),
          hoverColor: hoverColor,
          child: tile,
        ),
      ),
    );
  }
}
