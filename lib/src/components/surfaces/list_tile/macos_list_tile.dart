import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

const kDefaultListTileShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

class CustomMacosListTile extends StatefulWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Color tileColor;
  final Color hoverColor;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final MouseCursor? mouseCursor;
  final bool enabled;

  const CustomMacosListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.tileColor,
    required this.hoverColor,
    this.onTap,
    this.onLongPress,
    this.mouseCursor,
    this.enabled = true,
  });

  @override
  _CustomMacosListTileState createState() =>
      _CustomMacosListTileState();
}

class _CustomMacosListTileState extends State<CustomMacosListTile> {
  late Color backgroundColor = widget.tileColor;

  late Color hoverColor = widget.hoverColor;

  late Color color = backgroundColor;

  static const constraints = BoxConstraints(maxHeight: 48.0, minWidth: 48.0);
  static const padding = EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0);
  static const margin = EdgeInsets.all(4.0);

  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context).style.copyWith(
          color: CupertinoDynamicColor.resolve(
            MacosTheme.brightnessOf(context) == Brightness.dark
                ? CupertinoColors.secondaryLabel
                : MacosColors.placeholderTextColor,
            context,
          ),
          fontWeight: FontWeight.w400,
        );

    return MouseRegion(
      onEnter: (_) {
        if (widget.enabled){
          setState(() => color = hoverColor);
        }
      },
      onExit: (_) {
        if (widget.enabled){
          setState(() => color = backgroundColor);
        }
      },
      child: Container(
        margin: margin,
        padding: padding,
        constraints: constraints,
        decoration: ShapeDecoration(shape: kDefaultListTileShape, color: color),
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
          mouseCursor: widget.mouseCursor ?? MouseCursor.defer,
          onLongPress: widget.enabled ? widget.onLongPress : null,
          onClick: widget.enabled ? (widget.onTap ?? () {}) : null,
        ),
      ),
    );
  }
}
