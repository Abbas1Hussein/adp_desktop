import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../buttons/flat_button/flat_button.dart';
import 'platforms/platforms.dart';

/// A custom dialog widget that adapts its appearance based on the platform.
///
/// Use this widget to create list Tiles with platform-specific
/// styling and behavior:
/// - On macOS, [MacosAlertDialog] is utilized.
/// - On Windows, [ContentDialog] is used.
///
/// See also:
/// * [DialogPresenter]: A utility class for presenting different types of adaptive dialogs.
/// * [showAdpDialog]: A function to display an adaptive platform-specific dialog.
class AdaptiveDialog
    extends CoreAdaptiveComponent<DialogWindowsProperty, DialogMacosProperty> {
  /// Example of usage [AdaptiveDialog].
  /// ```dart
  /// showAdpDialog(
  ///   context: context,
  ///   child: AdaptiveDialog(
  ///     title: const Text('Adaptive Dialog'),
  ///     content: const Text('Are you sure you want to proceed?'),
  ///     primary: AdaptiveFlatButton(
  ///       child: const Text('Yes'),
  ///       onPressed: () {
  ///         // Handle 'Yes' button press
  ///         Navigator.pop(context);
  ///       },
  ///     ),
  ///     secondary: AdaptiveFlatButton(
  ///       child: const Text('No'),
  ///       onPressed: () {
  ///         // Handle 'No' button press
  ///         Navigator.pop(context);
  ///       },
  ///     ),
  ///   ),
  /// );
  /// ```
  const AdaptiveDialog({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.content,
    this.secondary,
    required this.primary,
  });

  /// The title of the dialog.
  final Widget? title;

  /// The content of the dialog.
  final Widget? content;

  /// The primary button of the dialog.
  final AdaptiveFlatButton primary;

  /// The secondary button of the dialog.
  final AdaptiveFlatButton? secondary;

  @override
  Widget macos(BuildContext context) {
    return DialogMacos(
      title: title,
      message: content,
      primary: primary,
      secondary: secondary,
      property: properties?.macos,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return DialogWindows(
      title: title,
      content: content,
      primary: primary.windows(context),
      secondary: secondary?.windows(context),
      property: properties?.windows,
    );
  }
}
