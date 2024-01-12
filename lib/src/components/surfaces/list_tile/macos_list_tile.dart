// import 'package:adp_desktop/src/components/buttons/button/macos.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:macos_ui/macos_ui.dart';
//
// const kDefaultListTileShape = RoundedRectangleBorder(
//   borderRadius: BorderRadius.all(Radius.circular(4.0)),
// );
//
// class CustomMacosListTile extends StatefulWidget {
//   final Widget? leading;
//   final Widget? title;
//   final Widget? subtitle;
//   final Widget? trailing;
//   final Color tileColor;
//   final Color hoverColor;
//   final GestureTapCallback? onTap;
//   final GestureLongPressCallback? onLongPress;
//   final MouseCursor? mouseCursor;
//   final bool enabled;
//
//   const CustomMacosListTile({
//     super.key,
//     this.leading,
//     this.title,
//     this.subtitle,
//     this.trailing,
//     required this.tileColor,
//     required this.hoverColor,
//     this.onTap,
//     this.onLongPress,
//     this.mouseCursor,
//     this.enabled = true,
//   });
//
//   @override
//   _CustomMacosListTileState createState() => _CustomMacosListTileState();
// }
//
// class _CustomMacosListTileState extends State<CustomMacosListTile> {
//   late Color backgroundColor = widget.tileColor;
//   late Color hoverColor = widget.hoverColor;
//   late Color color = backgroundColor;
//
//   static const constraints = BoxConstraints(maxHeight: 48.0, minWidth: 48.0);
//   static const padding = EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0);
//   static const margin = EdgeInsets.all(4.0);
//
//   @override
//   Widget build(BuildContext context) {
//     final textStyle = DefaultTextStyle.of(context).style.copyWith(
//           color: MacosDynamicColor.resolve(
//             MacosTheme.brightnessOf(context).resolve(
//               MacosColors.placeholderTextColor,
//               CupertinoColors.secondaryLabel,
//             ),
//             context,
//           ),
//           fontWeight: MacosFontWeight.w400,
//         );
//
//     return ConstrainedBox(
//       constraints: constraints,
//       child: MacosButton(
//         hoverColor: hoverColor,
//         backgroundColor: color,
//         onPressed: widget.onTap,
//         onLongPress: widget.onLongPress,
//         child: MacosListTile(
//           leading: widget.leading != null
//               ? DefaultTextStyle(style: textStyle, child: widget.leading!)
//               : null,
//           title: Flexible(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 if (widget.title != null) widget.title!,
//                 if (widget.trailing != null)
//                   DefaultTextStyle(
//                     style: textStyle,
//                     child: FittedBox(child: widget.trailing!),
//                   )
//               ],
//             ),
//           ),
//           subtitle: widget.subtitle,
//           mouseCursor: widget.mouseCursor ?? MouseCursor.defer,
//         ),
//       ),
//     );
//   }
// }
