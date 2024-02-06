import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import 'tooltip_theme.dart';

/// A tooltip is a popup that contains additional information about another
/// control or object. Tooltips display automatically when the user moves focus
/// to, presses and holds, or hovers the pointer over the associated control.
/// The tooltip disappears when the user moves focus from, stops pressing on, or
/// stops hovering the pointer over the associated control (unless the pointer
/// is moving towards the tooltip).
///
/// Use this widget to create tooltip's with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTooltip] is utilized.
/// - On Windows, [Tooltip] is used.
class AdaptiveTooltip extends CoreAdaptiveComponent {
  /// Creates a adp tooltip.
  ///
  /// Wrap any widget in a [AdaptiveTooltip] to show a message on mouse hover or
  /// long press event
  const AdaptiveTooltip({
    super.key,
    this.tooltipTheme,
    this.excludeFromSemantics = false,
    this.useMousePosition = true,
    this.child,
    required this.message,
  });

  /// The text to display in the tooltip.
  final String message;

  /// The widget the tooltip will be displayed, either above or below,
  /// when the mouse is hovering or whenever it gets long pressed.
  final Widget? child;

  /// The theme data for customizing the appearance of the [AdaptiveTooltip].
  final AdaptiveTooltipTheme? tooltipTheme;

  /// Whether the tooltip's [message] should be excluded from the
  /// semantics tree.
  ///
  /// Defaults to false. A tooltip will add a [Semantics] label that
  /// is set to [AdaptiveTooltip.message]. Set this property to true if the
  /// app is going to provide its own custom semantics label.
  final bool excludeFromSemantics;

  /// Whether the current mouse position should be used to render the
  /// tooltip on the screen. If no mouse is connected, this value is
  /// ignored.
  ///
  /// Defaults to true. A tooltip will show the tooltip on the current
  /// mouse position and the tooltip will be removed as soon as the
  /// pointer exit the [child].
  final bool useMousePosition;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return TooltipTheme(
      data:
          TooltipTheme.of(context).merge(tooltipTheme?.data.toWindows(context)),
      child: Tooltip(
        message: message,
        useMousePosition: useMousePosition,
        excludeFromSemantics: excludeFromSemantics,
        child: child,
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return MacosTooltipTheme(
      data: MacosTooltipTheme.of(context)
          .merge(tooltipTheme?.data.toMacos(context)),
      child: MacosTooltip(
        message: message,
        useMousePosition: useMousePosition,
        excludeFromSemantics: excludeFromSemantics,
        child: child,
      ),
    );
  }
}
