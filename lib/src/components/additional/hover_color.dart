import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class HoverColor extends StatefulWidget {
  const HoverColor({
    super.key,
    this.color,
    this.hoverColor,
    this.borderRadius,
    this.backgroundBlendMode,
    required this.child,
  });

  final Color? hoverColor;
  final Color? color;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final BlendMode? backgroundBlendMode;


  @override
  State<HoverColor> createState() => _HoverColorState();
}

class _HoverColorState extends State<HoverColor> {
  bool hover = false;

  void onHover(PointerHoverEvent _) {
    setState(() => hover = true);
  }

  void onExit(PointerExitEvent _) {
    setState(() => hover = false);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: onHover,
      onExit: onExit,
      child: Container(
        decoration: BoxDecoration(
          color: hover ? widget.hoverColor : widget.color,
          backgroundBlendMode: widget.backgroundBlendMode,
          borderRadius: widget.borderRadius,
        ),
        child: widget.child,
      ),
    );
  }
}
