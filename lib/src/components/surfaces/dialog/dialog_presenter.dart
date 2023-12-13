import 'package:flutter/widgets.dart';

import '../../../core/common/construct/properties.dart';
import '../../buttons/flat_button/flat_button.dart';
import '../../buttons/flat_button/platforms/platforms.dart';
import '../surfaces.dart';

/// A utility class for presenting different types of adaptive dialogs.
abstract final class DialogPresenter {
  const DialogPresenter._();

  /// Example of usage [showConfirmationDialog].
  ///
  /// ```dart
  /// final result = await DialogPresenter.showConfirmationDialog(
  ///   context,
  ///   title: 'Are you sure you want to proceed?',
  ///   message: 'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...',
  ///   confirmLabel: 'Yes',
  ///   cancelLabel: "No",
  /// );
  ///
  /// if (result != null && result) {
  ///   // User confirmed
  /// } else {
  ///   // User canceled
  /// }
  /// ```
  static Future<bool?> showConfirmationDialog<T>(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    String cancelLabel = 'Cancel',
  }) async {
    return await showAdpDialog<bool?>(
      context: context,
      child: AdaptiveDialog(
        title: Text(title),
        content: Text(message),
        primary: AdaptiveFlatButton(
          child: Text(confirmLabel),
          onPressed: () => Navigator.pop(context, true),
        ),
        secondary: AdaptiveFlatButton(
          properties: OnlyProperty.macos(
            FlatButtonMacosProperty(
              secondary: true,
              semanticLabel: cancelLabel,
            ),
          ),
          onPressed: () => Navigator.pop(context, false),
          child: Text(cancelLabel),
        ),
      ),
    );
  }

  /// Example of usage [showInformationDialog].
  ///
  /// ```dart
  /// await DialogPresenter.showInformationDialog(
  ///   context,
  ///   title: 'Information Dialog',
  ///   message: 'This is an example of an information dialog.',
  /// );
  /// ```
  static Future<void> showInformationDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'OK',
  }) async {
    await showAdpDialog<void>(
      context: context,
      child: AdaptiveDialog(
        title: Text(title),
        content: Text(message),
        primary: AdaptiveFlatButton(
          child: Text(confirmLabel),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  /// Example of usage [showCustomDialog].
  ///
  /// ```dart
  /// await DialogPresenter.showCustomDialog(
  ///   context,
  ///   dialog: AdaptiveDialog(
  ///     title: Text('Custom Dialog'),
  ///     content: Text('This is an example of a custom dialog.'),
  ///     properties: Properties(
  ///       macos: DialogMacosProperty(
  ///         appIcon: MacosIcon(CupertinoIcons.app, size: 34.0),
  ///         dialogMode: MacosDialogMode.cupertino,
  ///       ),
  ///       windows: DialogWindowsProperty(
  ///         constraints: BoxConstraints(maxWidth: 500.0),
  ///       ),
  ///     ),
  ///     primary: AdaptiveFlatButton(
  ///       child: Text('Do Something'),
  ///       onPressed: () => Navigator.pop(context),
  ///     ),
  ///   ),
  /// );
  /// ```
  ///
  /// Parameters:
  /// - [dialog]: An instance of [AdaptiveDialog] representing the platform dialog.
  /// - [barrierDismissible]: Whether the dialog can be dismissed by tapping the barrier. (Default is true)
  static Future<T?> showCustomDialog<T>(
    BuildContext context, {
    required AdaptiveDialog child,
    bool barrierDismissible = true,
  }) async {
    return await showAdpDialog<T?>(
      child: child,
      context: context,
      barrierDismissible: barrierDismissible,
    );
  }
}
