import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom filled button widget that adapts its appearance based on the platform.
///
/// Use this widget to create filled buttons with platform-specific
/// styling and behavior:
/// - On macOS, [CupertinoButton.filled] is utilized.
/// - On Windows, [FilledButton] is used.
///
/// ## Usage for Properties
///
/// Create an instance of the `Properties` class to customize the appearance
/// of the `AdaptiveFilledButton` widget on different platforms.
///
/// ```dart
/// Properties(
///   windows: FilledButtonWindowsProperty(),
///   macos: FilledButtonMacosProperty(),
/// );
/// ```
const kFilledButtonRadius = BorderRadius.all(
  Radius.circular(8.0),
);

const kFilledButtonPadding = EdgeInsets.all(8.0);

class AdaptiveFilledButton extends CoreAdaptiveComponent<FilledButtonWindowsProperty, FilledButtonMacosProperty> {
  const AdaptiveFilledButton({
    super.key,
    super.builders,
    super.properties,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
    this.backgroundColor,
    this.padding = kFilledButtonPadding,
    this.borderRadius = kFilledButtonRadius,
    required this.child,
  });

  /// The child widget to be displayed within the parent widget.
  final Widget child;

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The background color of the button. If null, the default platform-specific
  /// background color will be used.
  final Color? backgroundColor;

  /// The color to be used when the button is in a disabled state.
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// The border radius to apply to the button. This defines the roundness of the corners
  /// of the button's background.
  ///
  /// If null, [kFilledButtonRadius] will be used.
  final BorderRadius borderRadius;

  /// The padding to apply around the button's child content.
  ///
  /// If null, [kFilledButtonPadding] will be used.
  final EdgeInsetsGeometry padding;

  @override
  Widget macos(BuildContext context) {
    return FilledButtonMacos(
      padding: padding,
      property: properties?.macos,
      backgroundColor: backgroundColor,
      disabledColor: disabledColor,
      borderRadius: borderRadius,
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return FilledButtonWindows(
      padding: padding,
      property: properties?.windows,
      backgroundColor: backgroundColor,
      disabledColor: disabledColor,
      borderRadius: borderRadius,
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: child,
    );
  }
}
