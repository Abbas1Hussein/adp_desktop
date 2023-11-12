import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../icon/icon.dart';
import 'platforms/platforms.dart';

/// A custom icon button widget that adapts its appearance based on the platform.
///
/// Use this widget to create flat buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosIconButton] is utilized.
/// - On Windows, [IconButton] is used.
///
/// ## Usage for Properties
///
/// Create an instance of the `Properties` class to customize the appearance
/// of the `AdaptiveIconButton` widget on different platforms.
///
/// ```dart
/// Properties(
///   windows: IconButtonWindowsProperty(
///     focusable: false,
///     autofocus: true,
///   ),
///   macos: IconButtonMacosProperty(
///     shape: BoxShape.rectangle,
///     pressedOpacity: 0.6,
///   ),
/// );
/// ```
class AdaptiveIconButton extends CoreAdaptiveComponent<IconButtonWindowsProperty, IconButtonMacosProperty> {
  const AdaptiveIconButton({
    super.key,
    super.builders,
    super.properties,
    this.color,
    this.padding,
    this.constraints,
    this.borderRadius,
    this.disabledColor,
    this.hoverColor,
    this.onPressed,
    required this.icon,
  });

  /// The color of the AdaptiveIconButton.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  ///
  /// if null, [color].withOpacity(0.8) will be used.
  final Color? hoverColor;

  /// Callback triggered when the user tapped.
  final VoidCallback? onPressed;

  /// The widget to use as the icon.
  ///
  /// Typically an [AdaptiveIcon] widget.
  final Widget icon;

  /// The border radius to apply to the button. This defines the roundness of the corners
  /// of the button's background.
  final BorderRadius? borderRadius;

  /// The padding to apply around the button's child content.
  final EdgeInsetsGeometry? padding;

  /// The additional constraints to impose on the child.
  ///
  ///the default constraints for the respective platform will be used.
  final BoxConstraints? constraints;

  @override
  Widget macos(BuildContext context) {
    return IconButtonMacos(
      icon: icon,
      color: color,
      padding: padding,
      onPressed: onPressed,
      hoverColor: hoverColor,
      constraints: constraints,
      borderRadius: borderRadius,
      disabledColor: disabledColor,
      property: properties?.macos,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return IconButtonWindows(
      icon: icon,
      color: color,
      padding: padding,
      onPressed: onPressed,
      hoverColor: hoverColor,
      constraints: constraints,
      borderRadius: borderRadius,
      disabledColor: disabledColor,
      property: properties?.windows,
    );
  }
}
