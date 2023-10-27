import 'package:fluent_ui/fluent_ui.dart';

import '../../../buttons.dart';

class TextButtonWindows extends StatelessWidget {
  final TextButtonWindowsProperty? property;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;

  const TextButtonWindows({
    super.key,
    this.property,
    this.onPressed,
    this.onLongPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return HyperlinkButton(
      onLongPress: onLongPress,
      focusable: property?.focusable ?? true,
      onTapDown: property?.onTapDown,
      onTapUp: property?.onTapUp,
      style: property?.style,
      onPressed: onPressed,
      child: child,
    );
  }
}

class TextButtonWindowsProperty extends ButtonWindowsProperty {
  const TextButtonWindowsProperty({
    super.onTapDown,
    super.onTapUp,
    super.style,
    super.autofocus,
    super.focusNode,
    super.focusable,
  });
}
