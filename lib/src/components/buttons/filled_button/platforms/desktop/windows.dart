import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

class FilledButtonWindows extends StatelessWidget {
  final FilledButtonWindowsProperty? property;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;

  const FilledButtonWindows({
    super.key,
    this.property,
    this.onPressed,
    this.onLongPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: property?.style,
      onTapUp: property?.onTapUp,
      onTapDown: property?.onTapDown,
      focusable: property?.focusable ?? true,
      autofocus: property?.autofocus ?? false,
      focusNode: property?.focusNode,
      child: child,
    );
  }
}

class FilledButtonWindowsProperty extends ButtonWindowsProperty {
  const FilledButtonWindowsProperty({
    super.onTapDown,
    super.onTapUp,
    super.style,
    super.autofocus,
    super.focusNode,
    super.focusable,
  });
}
