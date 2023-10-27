import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

const kDefaultListTileShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

class HoverFocusMacosListTile extends StatefulWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Color? tileColor;
  final Color? hoverColor;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final MouseCursor? mouseCursor;
  final bool enabled;

  const HoverFocusMacosListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.tileColor,
    this.hoverColor,
    this.onTap,
    this.onLongPress,
    this.mouseCursor,
    this.enabled = true,
  });

  @override
  _HoverFocusMacosListTileState createState() =>
      _HoverFocusMacosListTileState();
}

class _HoverFocusMacosListTileState extends State<HoverFocusMacosListTile> {
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context).style.merge(TextStyle(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
        ));

    return MouseRegion(
      onEnter: (_) {
        if (widget.hoverColor != null) {
          setState(() {
            backgroundColor = widget.hoverColor;
          });
        }
      },
      onExit: (_) {
        setState(() {
          backgroundColor = widget.tileColor;
        });
      },
      child: Container(
        decoration: ShapeDecoration(
          shape: kDefaultListTileShape,
          color: backgroundColor,
        ),
        constraints: const BoxConstraints(maxHeight: 48.0, minWidth: 48.0),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        margin: const EdgeInsets.all(4.0),
        child: MacosListTile(
          title: Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.title != null) widget.title!,
                if (widget.trailing != null)
                  DefaultTextStyle(
                    style: textStyle,
                    child: FittedBox(child: widget.trailing!),
                  )
              ],
            ),
          ),
          leading: widget.leading != null
              ? DefaultTextStyle(style: textStyle, child: widget.leading!)
              : null,
          subtitle: widget.subtitle,
          onClick: widget.enabled ? widget.onTap ?? () {} : null,
          onLongPress: widget.onLongPress,
          mouseCursor: widget.mouseCursor ?? MouseCursor.defer,
        ),
      ),
    );
  }
}
