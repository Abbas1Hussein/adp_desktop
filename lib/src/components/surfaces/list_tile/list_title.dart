import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/cupertino.dart';

import '../../../core/common/construct/component.dart';
import 'macos_list_tile.dart';

class AdaptiveListTile extends CoreAdaptiveComponent {
  /// The main title content of the list tile.
  final Widget? title;

  /// A widget to display before the title.
  final Widget? leading;

  /// A widget to display below the title.
  final Widget? subtitle;

  /// A widget to display after the title and subtitle.
  final Widget? trailing;

  /// Determines if the tile is interactive.
  final bool enabled;

  /// A callback for when the tile is tapped.
  final GestureTapCallback? onTap;

  /// A callback for when the tile is long-pressed.
  final GestureLongPressCallback? onLongPress;

  /// The mouse cursor to use when hovering over the tile.
  final MouseCursor? mouseCursor;

  /// The color when the tile is hovered over.
  final Color? hoverColor;

  /// The background color of the tile.
  final Color? tileColor;

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
    this.enabled = true,
    this.tileColor,
    Key? key,
  }) : super(key: key);


  @override
  Widget macos(BuildContext context) {
    return HoverFocusMacosListTile(
      tileColor: tileColor,
      hoverColor: hoverColor ?? CupertinoColors.label.withOpacity(0.1),
      enabled: enabled,
      mouseCursor: mouseCursor,
      onLongPress: onLongPress,
      onTap: onTap,
      trailing: trailing,
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }

  @override
  Widget windows(BuildContext context) {
    final theme = fluent_ui.FluentTheme.of(context);
    final defaultTileColor =
        theme.accentColor.defaultBrushFor(theme.brightness);

    return GestureDetector(
      onLongPress: onLongPress,
      child: fluent_ui.ListTile(
        cursor: mouseCursor ?? MouseCursor.defer,
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onPressed: enabled ? onTap ?? () {} : null,
        tileColor: tileColor != null || hoverColor != null
            ? fluent_ui.ButtonState.resolveWith(
                (states) {
                  if (states.contains(fluent_ui.ButtonStates.hovering)) {
                    return hoverColor ?? defaultTileColor;
                  }
                  return tileColor ?? defaultTileColor;
                },
              )
            : null,
      ),
    );
  }
}
