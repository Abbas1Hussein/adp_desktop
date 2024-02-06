import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../buttons/buttons.dart';
import 'platforms/platforms.dart';

/// A dialog is a user interface element that appears on top of the main content to prompt the user for information or to confirm an action.
/// It typically contains a title, optional content, and one or more action buttons for the user to interact with.
/// Dialogs are commonly used to display alerts, messages, warnings, or to request input from the user.
/// They provide a way to temporarily interrupt the user's workflow and require their attention before proceeding.
///
/// See also:
///
/// * [DialogPresenter], A utility class for presenting different types of [AdaptiveDialog].
/// * [showAdpDialog], A function to display an adaptive platform-specific dialog.
///
/// Use this widget to create dialog's  with platform-specific
/// styling and behavior:
/// - On macOS, [MacosAlertDialog] is utilized.
/// - On Windows, [ContentDialog] is used.
class AdaptiveDialog
    extends CoreAdaptiveComponent<DialogWindowsProperty, DialogMacosProperty> {
  /// Creates an adaptive dialog.
  ///
  /// The [primary] parameter is required and represents the main button of the bottom sheet.
  const AdaptiveDialog({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.content,
    this.secondary,
    required this.primary,
  });

  /// The title of the dialog,
  ///
  /// Typically an [Text] widget used.
  final Widget? title;

  /// The content of the dialog.
  final Widget? content;

  /// The primary button of the dialog.
  ///
  /// * [AdaptiveButton.builders] will be ignore.
  ///
  /// on macOS button appearance always remains constant.
  final AdaptiveButton primary;

  /// The secondary button of the dialog.
  ///
  /// * [AdaptiveButton.builders] will be ignore.
  ///
  /// on macOS button appearance always remains constant.
  final AdaptiveButton? secondary;

  @override
  Widget windows(BuildContext context, [DialogWindowsProperty? property]) {
    return DialogWindows(
      title: title,
      content: content,
      primary: primary.windows(context),
      secondary: secondary?.windows(context),
      property: property,
    );
  }

  @override
  Widget macos(BuildContext context, [DialogMacosProperty? property]) {
    return DialogMacos(
      title: title,
      message: content,
      primary: primary,
      secondary: secondary,
      property: property,
    );
  }
}
