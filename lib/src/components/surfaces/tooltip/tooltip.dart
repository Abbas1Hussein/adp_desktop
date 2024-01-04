import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/model.dart';

class AdaptiveTooltip extends CoreAdaptiveComponent {
  /// Creates a adp tooltip.
  ///
  /// Wrap any widget in a [AdaptiveTooltip] to show a message on mouse hover or
  /// long press event
  const AdaptiveTooltip({
    super.key,
    this.theme,
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
  final AdaptiveTooltipTheme? theme;

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
  Widget macos(BuildContext context) {
    return MacosTooltipTheme(
      data: MacosTooltipTheme.of(context).merge(theme?.toMacos(context)),
      child: MacosTooltip(
        message: message,
        useMousePosition: useMousePosition,
        excludeFromSemantics: excludeFromSemantics,
        child: child,
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return TooltipTheme(
      data: TooltipTheme.of(context).merge(theme?.toWindows(context)),
      child: Tooltip(
        message: message,
        useMousePosition: useMousePosition,
        excludeFromSemantics: excludeFromSemantics,
        child: child,
      ),
    );
  }
}

class AdaptiveTooltipTheme
    extends CoreModel<TooltipThemeData, MacosTooltipThemeData> {
  const AdaptiveTooltipTheme({
    this.height,
    this.margin,
    this.padding,
    this.decoration,
    this.preferBelow,
    this.waitDuration,
    this.showDuration,
    this.verticalOffset,
    this.textStyle,
  });

  /// The height of the tooltip's [child].
  ///
  /// If the [child] is null, then this is the tooltip's intrinsic height.
  final double? height;

  /// The vertical gap between the widget and the displayed tooltip.
  ///
  /// When [preferBelow] is set to true and tooltips have sufficient space
  /// to display themselves, this property defines how much vertical space
  /// tooltips will position themselves under their corresponding widgets.
  /// Otherwise, tooltips will position themselves above their corresponding
  /// widgets with the given offset.
  final double? verticalOffset;

  /// The amount of space by which to inset the tooltip's [child].
  ///
  /// Defaults to 10.0 logical pixels in each direction.
  final EdgeInsetsGeometry? padding;

  /// The empty space that surrounds the tooltip.
  ///
  /// Defines the tooltip's outer [Container.margin]. By default, a long
  /// tooltip will span the width of its window. If long enough, a tooltip
  /// might also span the window's height. This property allows one to define
  /// how much space the tooltip must be inset from the edges of their display
  /// window.
  final EdgeInsetsGeometry? margin;

  /// Whether the tooltip defaults to being displayed below the widget.
  ///
  /// Defaults to true. If there is insufficient space to display the tooltip
  /// in the preferred direction, the tooltip will be displayed in the opposite
  /// direction.
  final bool? preferBelow;

  /// Specifies the tooltip's shape and background color.
  ///
  /// The tooltip shape defaults to a rounded rectangle with a border radius of 4.0.
  /// Tooltips will also default to an opacity of 90% and with the color [Colors.grey]
  /// if [FluentThemeData.brightness] is [Brightness.dark], and [Colors.white] if it is
  /// [Brightness.light].
  final Decoration? decoration;

  /// The length of time that a pointer must hover over a tooltip's widget before
  /// the tooltip will be shown.
  ///
  /// Once the pointer leaves the widget, the tooltip will immediately disappear.
  ///
  /// Defaults to 1 second.
  final Duration? waitDuration;

  /// The length of time that the tooltip will be shown after a long press is released.
  ///
  /// Defaults to 1.5 seconds.
  final Duration? showDuration;

  /// The style to use for the message of the tooltip.
  ///
  /// If null, [Typography.caption] is used
  final TextStyle? textStyle;

  @override
  MacosTooltipThemeData toMacos(BuildContext context) {
    return MacosTooltipThemeData(
      height: height,
      margin: margin,
      padding: padding,
      textStyle: textStyle,
      decoration: decoration,
      preferBelow: preferBelow,
      showDuration: showDuration,
      waitDuration: waitDuration,
      verticalOffset: verticalOffset,
    );
  }

  @override
  TooltipThemeData toWindows(BuildContext context) {
    return TooltipThemeData(
      height: height,
      margin: margin,
      padding: padding,
      textStyle: textStyle,
      decoration: decoration,
      preferBelow: preferBelow,
      showDuration: showDuration,
      waitDuration: waitDuration,
      verticalOffset: verticalOffset,
    );
  }
}
