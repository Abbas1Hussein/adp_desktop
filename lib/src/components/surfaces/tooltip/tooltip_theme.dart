import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/adaptive.dart';
import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/model.dart';

class AdaptiveTooltipTheme extends CoreAdaptiveComponent {
  const AdaptiveTooltipTheme({
    super.key,
    required this.data,
    required this.child,
  });

  /// The child widget that the tooltip theme will be applied to [AdaptiveTooltip].
  final Widget child;

  /// The data that defines the appearance and behavior of the tooltip.
  final AdaptiveTooltipThemeData data;

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AdaptiveTooltipThemeData theme = AdaptiveTooltipTheme.of(context);
  /// ```
  static AdaptiveTooltipThemeData of(BuildContext context) {
    return adaptiveValue<AdaptiveTooltipThemeData>(
      macos: () => AdaptiveTooltipThemeData._fromMacos(
        MacosTooltipTheme.of(context),
      ),
      windows: () => AdaptiveTooltipThemeData._fromWindows(
        TooltipTheme.of(context),
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return MacosTooltipTheme(data: data.toMacos(context), child: child);
  }

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return TooltipTheme(data: data.toWindows(context), child: child);
  }
}

class AdaptiveTooltipThemeData
    extends CoreModel<TooltipThemeData, MacosTooltipThemeData> {
  const AdaptiveTooltipThemeData({
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
      showDuration: showDuration ?? const Duration(milliseconds: 1500),
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

  static AdaptiveTooltipThemeData _fromMacos(MacosTooltipThemeData data) {
    return AdaptiveTooltipThemeData(
      height: data.height,
      margin: data.margin,
      padding: data.padding,
      textStyle: data.textStyle,
      decoration: data.decoration,
      preferBelow: data.preferBelow,
      showDuration: data.showDuration ?? const Duration(milliseconds: 1500),
      waitDuration: data.waitDuration,
      verticalOffset: data.verticalOffset,
    );
  }

  static AdaptiveTooltipThemeData _fromWindows(TooltipThemeData data) {
    return AdaptiveTooltipThemeData(
      height: data.height,
      margin: data.margin,
      padding: data.padding,
      textStyle: data.textStyle,
      decoration: data.decoration,
      preferBelow: data.preferBelow,
      showDuration: data.showDuration,
      waitDuration: data.waitDuration,
      verticalOffset: data.verticalOffset,
    );
  }

  AdaptiveTooltipThemeData merge(AdaptiveTooltipThemeData? other) {
    if (other == null) return this;
    return AdaptiveTooltipThemeData(
      height: other.height ?? height,
      verticalOffset: other.verticalOffset ?? verticalOffset,
      padding: other.padding ?? padding,
      margin: other.margin ?? margin,
      preferBelow: other.preferBelow ?? preferBelow,
      decoration: other.decoration ?? decoration,
      waitDuration: other.waitDuration ?? waitDuration,
      showDuration: other.showDuration ?? showDuration,
      textStyle: other.textStyle ?? textStyle,
    );
  }

  AdaptiveTooltipThemeData copyWith({
    double? height,
    double? verticalOffset,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    bool? preferBelow,
    Decoration? decoration,
    Duration? waitDuration,
    Duration? showDuration,
    TextStyle? textStyle,
  }) {
    return AdaptiveTooltipThemeData(
      height: height ?? this.height,
      verticalOffset: verticalOffset ?? this.verticalOffset,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      preferBelow: preferBelow ?? this.preferBelow,
      decoration: decoration ?? this.decoration,
      waitDuration: waitDuration ?? this.waitDuration,
      showDuration: showDuration ?? this.showDuration,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
