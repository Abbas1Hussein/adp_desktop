import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';

class AdaptiveScrollbar extends CoreAdaptiveComponent {
  const AdaptiveScrollbar({
    super.key,
    super.builders,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.thicknessWhileHovering,
    this.radius,
    this.thumbColor,
    this.notificationPredicate,
    this.scrollbarOrientation,
    required this.child,
  });

  /// {@macro flutter.widgets.Scrollbar.child}
  final Widget child;

  /// The color of the scrollbar when the user is
  /// hovering or pressing it.
  final Color? thumbColor;

  /// {@macro flutter.widgets.Scrollbar.controller}
  final ScrollController? controller;

  /// {@macro flutter.widgets.Scrollbar.thumbVisibility}
  final bool? thumbVisibility;

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  final double? thickness;

  /// The thickness of the scrollbar in the cross axis of the scrollable while
  /// the mouse cursor is hovering over the scrollbar.
  final double? thicknessWhileHovering;

  /// The [Radius] of the scrollbar thumb's rounded rectangle corners.
  final Radius? radius;

  /// {@macro flutter.widgets.Scrollbar.notificationPredicate}
  final ScrollNotificationPredicate? notificationPredicate;

  /// {@macro flutter.widgets.Scrollbar.scrollbarOrientation}
  final ScrollbarOrientation? scrollbarOrientation;

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return MacosScrollbarTheme(
      data: MacosScrollbarTheme.of(context).merge(
        MacosScrollbarThemeData(thumbColor: thumbColor),
      ),
      child: MacosScrollbar(
        controller: controller,
        radius: radius,
        thickness: thickness,
        notificationPredicate: notificationPredicate,
        scrollbarOrientation: scrollbarOrientation,
        thicknessWhileHovering: thicknessWhileHovering,
        thumbVisibility: thumbVisibility,
        child: child,
      ),
    );
  }

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return Scrollbar(
      style: ScrollbarThemeData(
        radius: radius,
        thickness: thickness,
        hoveringThickness: thicknessWhileHovering,
        scrollbarColor: thumbColor,
        backgroundColor: thumbColor?.withValues(alpha: 0.3),
      ),
      controller: controller,
      notificationPredicate:
          notificationPredicate ?? defaultScrollNotificationPredicate,
      scrollbarOrientation: scrollbarOrientation,
      thumbVisibility: thumbVisibility,
      child: child,
    );
  }
}
