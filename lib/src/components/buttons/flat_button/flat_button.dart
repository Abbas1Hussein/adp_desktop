import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom flat button widget that adapts its appearance based on the platform.
///
/// Use this widget to create flat buttons with platform-specific
/// styling and behavior:
/// - On macOS, [PushButton] is utilized.
/// - On Windows, [Button] is used.
///
/// ## Usage for Properties
///
/// Create an instance of the `Properties` class to customize the appearance
/// of the `AdaptiveFlatButton` widget on different platforms.
///
/// ```dart
/// Properties(
///   windows: FlatButtonWindowsProperty(
///     focusable: false,
///     autofocus: true,
///   ),
///   macos: FlatButtonMacosProperty(
///     controlSize: ControlSize.mini,
///     secondary: true,
///   ),
/// );
/// ```
class AdaptiveFlatButton extends CoreAdaptiveComponent<
    FlatButtonWindowsProperty, FlatButtonMacosProperty> {
  const AdaptiveFlatButton({
    super.key,
    super.builders,
    super.properties,
    this.color,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
    required this.child,
  });

  /// The color of the AdaptiveFlatButton.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// Callback triggered when the user tapped.
  final VoidCallback? onPressed;

  /// Callback triggered when the user performs a long press.
  final VoidCallback? onLongPress;

  /// The child widget displayed within the AdaptiveFlatButton.
  ///
  /// Typicality an [Text] widget.
  final Widget child;

  @override
  Widget windows(BuildContext context, [FlatButtonWindowsProperty? property]) {
    return FlatButtonWindows(
      color: color,
      property: property,
      onPressed: onPressed,
      onLongPress: onLongPress,
      disabledColor: disabledColor,
      child: child,
    );
  }

  @override
  Widget macos(BuildContext context, [FlatButtonMacosProperty? property]) {
    return FlatButtonMacos(
      color: color,
      property: property,
      onPressed: onPressed,
      onLongPress: onLongPress,
      disabledColor: disabledColor,
      child: child,
    );
  }
}
