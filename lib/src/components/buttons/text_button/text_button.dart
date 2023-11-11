import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom text button widget that adapts its appearance based on the platform.
///
/// Use this widget to create text buttons with platform-specific
/// styling and behavior. It supports macOS and Windows.
/// - On macOS, [CustomCupertinoTextButton] is utilized.
/// - On Windows, [HyperlinkButton] is used.
///
/// ## Usage for Properties
///
/// Create an instance of the `Properties` class to customize the appearance
/// of the `AdaptiveTextButton` widget on different platforms.
///
/// ```dart
/// Properties(
///   windows: TextButtonWindowsProperty(
///     autofocus: true,
///     focusable: false,
///   ),
///   macos: TextButtonMacosProperty(
///     isDestructiveAction: false,
///     isDefaultAction: true,
///   ),
/// );
/// ```
class AdaptiveTextButton extends CoreAdaptiveComponent<TextButtonWindowsProperty, TextButtonMacosProperty> {
  const AdaptiveTextButton({
    super.key,
    super.builders,
    super.properties,
    this.onLongPress,
    this.onPressed,
    this.color,
    this.disabledColor,
    required this.child,
  });

  /// The child widget displayed within the button.
  ///
  /// typically used [Text].
  final Widget child;

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The color of the TextButton.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  @override
  Widget windows(BuildContext context) {
    return TextButtonWindows(
      property: properties?.windows,
      color: color,
      disabledColor: disabledColor,
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return TextButtonMacos(
      property: properties?.macos,
      color: color,
      disabledColor: disabledColor,
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: child,
    );
  }
}
