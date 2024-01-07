import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A custom date picker widget that adapts its appearance based on the platform.
///
/// Use this widget to create date picker with platform-specific
/// styling and behavior:
/// - On macOS, [MacosDatePicker] is utilized.
/// - On Windows, [DatePicker] is used.
class AdaptiveDatePicker extends CoreAdaptiveComponent<
    DatePickerWindowsProperty, DatePickerMacosProperty> {
  /// Creates an instance of [AdaptiveDatePicker].
  ///
  /// The [AdaptiveDatePicker] invokes the callback with the new selected value and
  /// automatically manages state updates until the parent widget rebuilds the
  /// date picker with the updated value.
  ///
  /// You do not need to manually update the state; the [AdaptiveDatePicker] handles
  /// state changes directly.
  ///
  /// Usage:
  /// ```dart
  /// AdaptiveDatePicker(
  ///   initialDate: DateTime.now(),
  ///   onCancel: () {
  ///     // Handle cancellation logic
  ///   },
  ///   onSelected: (DateTime selectedDate)
  ///     // Handle selected date logic
  ///   },
  /// )
  /// ```
  /// See also:
  ///
  ///  * [AdaptiveTimePicker] for a corresponding time selection.
  const AdaptiveDatePicker({
    super.key,
    super.builders,
    super.properties,
    this.onCancel,
    this.onSelected,
    this.initialDate,
  });

  /// The initial date displayed when the date picker is first shown.
  ///
  /// Default to `DateTime.now()`.
  final DateTime? initialDate;

  /// A callback function to be called when the user cancels the date picker.
  /// It can be null if no action is needed on cancellation.
  final VoidCallback? onCancel;

  /// A callback function called when the user selects a date in the picker.
  /// It provides the selected [DateTime] as an argument.
  /// It can be null if you don't need to handle date selection.
  final ValueChanged<DateTime>? onSelected;

  @override
  Widget windows(BuildContext context, [DatePickerWindowsProperty? property]) {
    return DatePickerWindows(
      property: property,
      onCancel: onCancel,
      initialDate: initialDate,
      onDateTimeChanged: onSelected,
    );
  }

  @override
  Widget macos(BuildContext context, [DatePickerMacosProperty? property]) {
    return DatePickerMacos(
      property: property,
      onCancel: onCancel,
      initialDate: initialDate,
      onDateTimeChanged: onSelected,
    );
  }
}
