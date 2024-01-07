import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import 'platforms/platforms.dart';

/// A custom bottom sheet widget that adapts its appearance based on the platform.
///
/// Use this widget to create bottom sheet with platform-specific
/// styling and behavior:
/// - On macOS, [MacosSheet] is utilized.
/// - On windows, custom bottom sheet used.
///
/// See also:
/// * [BottomSheetPresenter]: A utility class for presenting different types of adaptive sheets.
/// * [showAdpBottomSheet]: A function to display an adaptive platform-specific bottom sheet.
class AdaptiveBottomSheet extends CoreAdaptiveComponent {
  /// Creates an adaptive bottom sheet.
  ///
  /// The [child] parameter is required and represents the main content of the bottom sheet.
  ///
  /// Example:
  /// ```dart
  /// showAdpDialog(
  ///   context: context,
  ///   child: AdaptiveBottomSheet(
  ///     child: Column(
  ///       children: [
  ///         Text(DummyText.generateQuestion),
  ///         Text(DummyText.generateAnswer),
  ///       ],
  ///     ),
  ///   ),
  /// );
  /// ```
  const AdaptiveBottomSheet({
    super.key,
    this.insetPadding,
    this.backgroundColor,
    this.insetAnimationCurve,
    this.insetAnimationDuration,
    required this.child,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  final EdgeInsets? insetPadding;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  final Duration? insetAnimationDuration;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  final Curve? insetAnimationCurve;

  /// The background color of the bottom sheet.
  final Color? backgroundColor;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return BottomSheetWindows(
      insetPadding: insetPadding,
      backgroundColor: backgroundColor,
      insetAnimationCurve: insetAnimationCurve,
      insetAnimationDuration: insetAnimationDuration,
      child: child,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return BottomSheetMacos(
      insetPadding: insetPadding,
      backgroundColor: backgroundColor,
      insetAnimationCurve: insetAnimationCurve,
      insetAnimationDuration: insetAnimationDuration,
      child: child,
    );
  }
}
