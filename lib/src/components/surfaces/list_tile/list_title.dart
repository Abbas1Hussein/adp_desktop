import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';
import '../../buttons/button/macos.dart';
import '../../navigation/tab_view/tab_view.dart';

const _kListTileContentPadding = kContentPadding;
const _kListTileConstraints = BoxConstraints(maxHeight: 48.0, minWidth: 48.0);

/// A widget that aims to approximate the [ListTile] widget found in Flutter's material library.
///
/// Use this widget to create list Tiles with platform-specific
/// styling and behavior:
/// - On macOS, [MacosListTile] is utilized.
/// - On Windows, [ListTile] is used.
class AdaptiveListTile extends CoreAdaptiveComponent {
  const AdaptiveListTile({
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
    Key? key,
  }) : super(key: key);

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
        maxHeight: _kListTileConstraints.maxHeight + 6,
      ),
      child: GestureDetector(
        onLongPress: enabled ? onLongPress : null,
        child: ListTile(
          shape: shape,
          title: title,
          leading: leading,
          subtitle: subtitle,
          trailing: trailing,
          contentPadding: contentPadding,
          cursor: mouseCursor ??
              (enabled
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.forbidden),
          onPressed: enabled ? (onTap ?? () {}) : null,
          tileColor: ButtonState.resolveWith(
            (states) {
              return ButtonState.forStates(
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
    final textStyle = DefaultTextStyle.of(context).style.copyWith(
          color: MacosDynamicColor.resolve(
            MacosTheme.brightnessOf(context).resolve(
              MacosColors.placeholderTextColor,
              CupertinoColors.secondaryLabel,
            ),
            context,
          ),
          fontWeight: MacosFontWeight.w400,
        );

    return ConstrainedBox(
      constraints: _kListTileConstraints,
      child: MacosButton(
        shape: shape,
        padding: contentPadding,
        mouseCursor: mouseCursor ?? SystemMouseCursors.click,
        onPressed: enabled ? (onTap ?? () {}) : null,
        onLongPress: enabled ? onLongPress : null,
        pressedColor: pressColor,
        disabledColor: disabledColor,
        backgroundColor:
            backgroundColor ?? (useBackgroundColor ? null : Colors.transparent),
        hoverColor: hoverColor ?? CupertinoColors.secondaryLabel,
        child: MacosListTile(
          leading: leading != null
              ? MacosIconTheme(
                  data: MacosIconTheme.of(context), child: leading!)
              : null,
          title: Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title != null) title!,
                if (trailing != null)
                  DefaultTextStyle(
                    style: textStyle,
                    child: FittedBox(child: trailing!),
                  )
              ],
            ),
          ),
          subtitle: subtitle,
        ),
      ),
    );
  }
}
