import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';
import '../../icon/icon.dart';

const _kAdpIconConstraints = BoxConstraints(minHeight: 30, minWidth: 30);

/// It is one of the most widely used buttons in the flutter library typically contains an icon.
/// It is commonly used to trigger actions or events in response to user interaction, such as tapping or clicking.
/// If the onPressed callback is null, then the button will be disabled and will not react to touch.
///
/// Use this widget to create Icon buttons with platform-specific
/// styling and behavior:
/// - On macOS, [MacosIconButton] is utilized.
/// - On Windows, [IconButton] is used.
class AdaptiveIconButton extends CoreAdaptiveComponent {
  /// Creates an instance of [AdaptiveIconButton].
  ///
  /// The [icon] is required and it specifies the widget to be used as the icon,
  /// typically an [AdaptiveIcon] widget.
  const AdaptiveIconButton({
    super.key,
    super.builders,
    this.onPressed,
    this.hoverColor,
    this.borderRadius,
    this.disabledColor,
    this.backgroundColor,
    this.constraints = _kAdpIconConstraints,
    required this.icon,
  }) : label = null;

  /// Creates an instance of [AdaptiveIconButton.label].
  ///
  /// The [icon] is required and it specifies the widget to be used as the icon,
  /// typically an [AdaptiveIcon] widget.
  ///
  /// The [label] is required and it specifies the widget to used within the [icon],
  /// typically an [Text] widget.
  const AdaptiveIconButton.label({
    super.key,
    super.builders,
    this.onPressed,
    this.hoverColor,
    this.borderRadius,
    this.disabledColor,
    this.backgroundColor,
    this.constraints = _kAdpIconConstraints,
    required Widget this.label,
    required this.icon,
  });

  /// The widget to use as the icon, typically an [AdaptiveIcon] widget.
  final Widget icon;

  /// The widget to use within the icon, typically an [Text] widget.
  final Widget? label;

  /// The callback that is called when the button is tapped.
  ///
  /// If this is set to null, the button will be disabled and [disabledColor] will used.
  final VoidCallback? onPressed;

  /// The additional constraints to impose on the child.
  ///
  /// if null, default [_kAdpIconConstraints] will be used.
  final BoxConstraints constraints;

  /// The border radius to apply to the icon button. This defines the roundness of the corners
  /// of the button's background.
  ///
  /// if null, default radius is 4px.
  final BorderRadius? borderRadius;

  /// The background color of the icon button.
  ///
  /// If null, the default platform-specific background color will be used.
  final Color? backgroundColor;

  /// The color to be used when the icon button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  ///
  /// if null, [backgroundColor].withOpacity(0.8) will be used.
  final Color? hoverColor;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    final buildLabel = label != null
        ? DefaultTextStyle(
            style: theme.typography.body!.copyWith(
              fontWeight: FontWeight.w300,
            ),
            child: label!,
          )
        : null;

    return ConstrainedBox(
      constraints: constraints,
      child: IconButton(
        icon: Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconTheme.merge(
            data: IconTheme.of(context),
            child: icon.margeWith(buildLabel),
          ),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(4.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => WidgetStateExtension.forStates(
              states,
              none: backgroundColor,
              disabled: disabledColor,
              hovering: hoverColor ?? backgroundColor?.withValues(alpha: 0.8),
              pressed: hoverColor?.withValues(alpha: 0.6) ??
                  backgroundColor?.withValues(alpha: 0.6),
            ),
          ),
        ).merge(theme.buttonTheme.iconButtonStyle),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final buildLabel = label != null
        ? DefaultTextStyle(
            style: MacosTheme.of(context).typography.body.copyWith(
                  fontWeight: MacosFontWeight.w300,
                ),
            child: label!,
          )
        : null;

    return MacosIconButton(
      icon: icon.margeWith(buildLabel),
      onPressed: onPressed,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      disabledColor: disabledColor?.withValues(alpha: 0.6),
      hoverColor: hoverColor ??
          backgroundColor?.withValues(alpha: 0.8) ??
          MacosTheme.brightnessOf(context).resolve(
            const Color(0xffE5E5E5),
            const Color(0xff3C383C),
          ),
      boxConstraints: constraints,
    );
  }
}
