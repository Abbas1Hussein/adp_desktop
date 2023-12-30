import 'package:flutter/widgets.dart';

import '../../../core/common/construct/properties.dart';
import '../../components.dart';

enum BottomSheetPosition { top, bottom, center }

/// A utility class for presenting different types of bottom sheets.
abstract final class BottomSheetPresenter {
  const BottomSheetPresenter._();

  /// Displays a confirmation bottom sheet with specified title, content, and labels for confirmation and cancellation.
  ///
  /// Example:
  /// ```dart
  /// final result = await BottomSheetPresenter.showConfirmationSheet(
  ///   context,
  ///   title: 'Are you sure you want to proceed?',
  ///   content: MyConfirmationBottomSheetContent(),
  ///   confirmLabel: 'Yes',
  ///   cancelLabel: 'No',
  /// );
  ///
  /// if (result) {
  ///   // User confirmed
  /// } else {
  ///   // User canceled
  /// }
  /// ```
  static Future<bool> showConfirmationSheet(
    BuildContext context, {
    required String title,
    required Widget content,
    required String confirmLabel,
    String cancelLabel = 'Cancel',
  }) async {
    final effectivePadding =
        MediaQuery.of(context).viewInsets + const EdgeInsets.all(6.0);

    return await showAdpBottomSheet(
      context: context,
      barrierDismissible: false,
      builder: (context) => AdaptiveBottomSheet(
        insetPadding: effectivePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleSheet(
              title,
              context,
              () => Navigator.pop(context, false),
            ),
            Expanded(child: content),
            Row(
              children: [
                Expanded(
                  child: AdaptiveFlatButton(
                    properties: Properties.macos(
                      const FlatButtonMacosProperty(secondary: true),
                    ),
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(cancelLabel),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: AdaptiveFlatButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(confirmLabel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Displays an information bottom sheet with specified title and message.
  ///
  /// Example:
  /// ```dart
  /// await BottomSheetPresenter.showInformationSheet(
  ///   context,
  ///   title: 'Information',
  ///   message: 'This is an example of an information sheet.',
  /// );
  /// ```
  static Future<T?> showInformationSheet<T>(
    BuildContext context, {
    required String title,
    required String message,
    BottomSheetPosition position = BottomSheetPosition.bottom,
  }) async {
    final effectivePadding = MediaQuery.of(context).viewInsets +
        position._calculateDefaultInsetPadding(context);

    return await showAdpBottomSheet(
      context: context,
      builder: (context) => AdaptiveBottomSheet(
        insetPadding: effectivePadding,
        child: _buildBottomSheetContent(title, message, context),
      ),
    );
  }

  /// Displays a custom bottom sheet with specified content.
  ///
  /// Example:
  /// ```dart
  /// await BottomSheetPresenter.showCustomSheet(
  ///   context,
  ///   barrierDismissible: true,
  ///   child: MyCustomBottomSheetContent(),
  /// );
  /// ```
  static Future<T?> showCustomSheet<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    required AdaptiveBottomSheet child,
  }) async {
    return await showAdpBottomSheet<T?>(
      context: context,
      builder: (context) => child,
      barrierDismissible: barrierDismissible,
    );
  }

  static Widget _buildBottomSheetContent(
    String title,
    String message,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleSheet(title, context),
        Flexible(
          child: Text(
            message,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
  }

  static Widget _buildTitleSheet(
    String title,
    BuildContext context, [
    VoidCallback? onClose,
  ]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        AdaptiveIconButton(
          icon: const AdaptiveIcon(AdpIcons.clear),
          onPressed: onClose ?? () => Navigator.pop(context),
        ),
      ],
    );
  }
}

extension _BottomSheetPresenterEX on BottomSheetPosition {
  BottomSheetPosition get _position => this;

  /// Calculates default inset padding based on the bottom sheet position.
  EdgeInsets _calculateDefaultInsetPadding(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (_position == BottomSheetPosition.center) {
      return EdgeInsets.symmetric(horizontal: 20.0, vertical: height * 0.4);
    }

    final top =
        _position == BottomSheetPosition.top ? height * 0.05 : height * 0.8;
    final bottom =
        _position == BottomSheetPosition.bottom ? 8.0 : height * 0.75;

    return EdgeInsets.only(top: top, left: 12.0, right: 12.0, bottom: bottom);
  }
}
