import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/property.dart';
import '../button/base_button.dart';
import '../button/macos.dart';

/// A borderless button with mainly text-based content
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
  });

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return MouseRegion(
      cursor: mouseCursor,
      child: HyperlinkButton(
        style: windowsDefaultStyle(),
        onTapUp: onTapUp,
        onTapDown: onTapDown,
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child,
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
        child: child,
      ),
    );
  }
}
