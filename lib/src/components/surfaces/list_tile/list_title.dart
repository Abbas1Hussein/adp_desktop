import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import 'macos_list_tile.dart';

/// A custom list Tile widget that adapts its appearance based on the platform.
///
/// Use this widget to create list Tiles with platform-specific
/// styling and behavior:
/// - On macOS, [MacosListTile] is utilized.
/// - On Windows, [ListTile] is used.
class AdaptiveListTile extends CoreAdaptiveComponent {
  const AdaptiveListTile({
    super.builders,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.mouseCursor,
    this.hoverColor,
    this.useBackgroundColor = true,
    this.enabled = true,
    this.tileColor,
    Key? key,
  }) : super(key: key);

  /// Determines if the tile is interactive.
  final bool enabled;

  /// The main title content of the list tile.
  final Widget? title;

  /// A widget to display before the title.
  final Widget? leading;

  /// A widget to display below the title.
  final Widget? subtitle;

  /// A widget to display after the title and subtitle.
  final Widget? trailing;

  /// A callback for when the tile is long-pressed.
  final GestureLongPressCallback? onLongPress;

  /// A callback for when the tile is tapped.
  final GestureTapCallback? onTap;

  /// The mouse cursor to use when hovering over the tile.
  final MouseCursor? mouseCursor;

  /// The color when the tile is hovered over.
  final Color? hoverColor;

  /// The background color of the tile.
  final Color? tileColor;

  /// Determines whether to use the background color for the tile.
  /// If set to true, the background color will be applied; otherwise, it remains transparent.
  ///
  /// By default, it is set to true.
  final bool useBackgroundColor;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    final defaultTileColor =
        theme.accentColor.defaultBrushFor(theme.brightness);

    return GestureDetector(
      onLongPress: enabled ? onLongPress : null,
      child: ListTile(
        title: title,
        leading: leading,
        subtitle: subtitle,
        trailing: trailing,
        cursor: mouseCursor ?? MouseCursor.defer,
        onPressed: enabled ? (onTap ?? () {}) : null,
        tileColor: tileColor != null || hoverColor != null
            ? ButtonState.resolveWith(
                (states) {
                  if (states.contains(ButtonStates.hovering)) {
                    return hoverColor ?? defaultTileColor;
                  }
                  return tileColor ?? defaultTileColor;
                },
              )
            : useBackgroundColor
                ? ButtonState.resolveWith(
                    (states) => ButtonThemeData.buttonColor(context, states),
                  )
                : null,
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return CustomMacosListTile(
      title: title,
      enabled: enabled,
      leading: leading,
      subtitle: subtitle,
      trailing: trailing,
      mouseCursor: mouseCursor,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      tileColor: tileColor ??
          (useBackgroundColor
              ? CupertinoColors.quaternarySystemFill
              : Colors.transparent),
      hoverColor: hoverColor ??
          tileColor?.withOpacity(0.85) ??
          CupertinoColors.quaternarySystemFill.withOpacity(0.10),
    );
  }
}
