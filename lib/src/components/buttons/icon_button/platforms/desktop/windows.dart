import 'package:fluent_ui/fluent_ui.dart';

import '../../../properties/windows.dart';

class IconButtonWindows extends StatelessWidget {
  final IconButtonWindowsProperty? property;

  /// The widget to use as the icon.
  ///
  /// Typically an [Icon] widget.
  final Widget icon;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback, [onLongPress], [onTapDown], and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  const IconButtonWindows({
    super.key,
    this.property,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      style: property?.style,
      focusable: property?.focusable ?? true,
      iconButtonMode: property?.iconButtonMode,
    );
  }
}

class IconButtonWindowsProperty extends ButtonWindowsProperty {
  /// How this icon button will behave.
  ///
  /// If null, this may be affected by a [SmallIconButton] in the tree, if any.
  /// If null and without a [SmallIconButton], defaults to large.
  final IconButtonMode? iconButtonMode;

  const IconButtonWindowsProperty({
    super.style,
    super.focusable,
    this.iconButtonMode,
  });
}
