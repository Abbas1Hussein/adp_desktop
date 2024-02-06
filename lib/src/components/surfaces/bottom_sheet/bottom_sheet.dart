import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../navigation/navigation.dart';

/// The default inset padding for the bottom sheet.
const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 140.0, vertical: 48.0);

/// The default border radius for the bottom sheet.
const _kSheetBorderRadius = BorderRadius.all(Radius.circular(12.0));

/// A modal dialog that’s attached to a particular window and prevents further
/// interaction with the window until the sheet is dismissed,
/// can be displayed on both Windows and macOS.
///
/// See also:
///
/// * [showAdpBottomSheet] A function to display an adaptive platform-specific bottom sheet.
class AdaptiveBottomSheet extends CoreAdaptiveComponent {
  /// Creates an adaptive bottom sheet.
  ///
  /// The [child] parameter is required and represents the main content of the bottom sheet.
  const AdaptiveBottomSheet({
    super.key,
    this.backgroundColor,
    this.contentPadding = kContentPadding,
    this.insetPadding = _defaultInsetPadding,
    this.insetAnimationCurve = Curves.decelerate,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    required this.child,
  });

  /// The main content of the bottom sheet.
  final Widget child;

  /// The background color of the bottom sheet.
  final Color? backgroundColor;

  /// The padding around the main content of the bottom sheet.
  final EdgeInsets contentPadding;

  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the sheet. This defines the minimum space between the screen's edges
  /// and the sheet.
  final EdgeInsets insetPadding;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the sheet is placed in.
  final Curve insetAnimationCurve;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the sheet is placed in.
  final Duration insetAnimationDuration;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final theme = FluentTheme.of(context);

    final color =
        backgroundColor ?? theme.resources.solidBackgroundFillColorBase;

    final innerBorderColor = theme.resources.layerFillColorAlt;

    final effectivePadding = MediaQuery.of(context).viewInsets + insetPadding;

    return AnimatedPadding(
      padding: effectivePadding,
      curve: insetAnimationCurve,
      duration: insetAnimationDuration,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: _kSheetBorderRadius,
          border: Border.all(width: 2, color: innerBorderColor),
        ),
        child: content,
      ),
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final effectivePadding = MediaQuery.of(context).viewInsets + insetPadding;

    return MacosSheet(
      insetPadding: effectivePadding,
      backgroundColor: backgroundColor,
      insetAnimationCurve: insetAnimationCurve,
      insetAnimationDuration: insetAnimationDuration,
      child: content,
    );
  }

  Widget get content => Padding(padding: contentPadding, child: child);
}
