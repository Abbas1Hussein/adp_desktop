import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';
import '../button/base_button.dart';
import '../button/macos.dart';

/// A TextButton widget is just a text label displayed on a zero-elevation Material widget.
/// By default, it does’t have visible borders and reacts to touches by filling with a background color.
///
/// If the onPressed && onLongPress callbacks is null, then the button will be disabled and will not react to touch.
///
/// See also:
///
/// * [AdaptiveButtonType.base] A standard adaptive button.
/// * [AdaptiveButtonType.filled] A filled adaptive colored button.
/// * [AdaptiveButtonType.outlined] An outlined adaptive button with a border.
///
/// Use this widget to create text buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosButton] is utilized.
/// - On Windows, [HyperlinkButton] is used.
class AdaptiveTextButton extends AdaptiveBaseButton {
  /// A borderless button with mainly text-based content
  ///
  /// If the onPressed && onLongPress callbacks is null,
  /// then the button will be disabled and will not react to touch.
  const AdaptiveTextButton({
    super.key,
    super.builders,
    super.shape,
    super.onTapUp,
    super.onTapDown,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.onPressed,
    required super.child,
  })  : label = null,
        icon = null;

  /// Create a text button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 8 logical pixels
  /// at the ends, with an 8 pixel gap in between.
  const AdaptiveTextButton.icon({
    super.key,
    super.builders,
    super.shape,
    super.onTapUp,
    super.onTapDown,
    super.onLongPress,
    super.hoverColor,
    super.pressedColor,
    super.disabledColor,
    super.backgroundColor,
    super.mouseCursor,
    required super.onPressed,
    required Widget this.label,
    required Widget this.icon,
  }) : super(child: label);

  final Widget? label;
  final Widget? icon;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return MouseRegion(
      cursor: mouseCursor,
      child: HyperlinkButton(
        style: windowsDefaultStyle(),
        onTapUp: (_) => onTapUp?.call(),
        onTapDown: (_) => onTapDown?.call(),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child.margeWith(icon, 8.0),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final theme = MacosTheme.of(context);
    return MacosButton(
      shape: shape,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      onPressed: onPressed,
      mouseCursor: mouseCursor,
      onLongPress: onLongPress,
      hoverColor: hoverColor,
      pressedColor: pressedColor,
      disabledColor: disabledColor ?? Colors.transparent,
      backgroundColor: backgroundColor ?? Colors.transparent,
      child: DefaultTextStyle(
        style: theme.typography.body.copyWith(
          color: theme.primaryColor,
          letterSpacing: 0.5,
          fontWeight: MacosFontWeight.w590,
        ),
        child: child.margeWith(icon, 8.0),
      ),
    );
  }
}
