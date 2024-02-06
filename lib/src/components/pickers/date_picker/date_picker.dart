import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

/// A Date picker is a graphical user interface element that used to select a date from a graphical calendar interface.
/// It allows users to easily choose a specific date by clicking or tapping on the desired day within the calendar.
/// Date pickers provide options for navigating between months and years. They are widely used in various applications,
/// including scheduling, event management, and form submissions, to facilitate the input of dates with accuracy and efficiency.
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
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the tab view separately for Windows and macOS platforms.
  /// You can provide specific [properties] for each platform using `DatePickerWindowsProperty`
  /// and `DatePickerMacosProperty` respectively.
  ///
  /// See also:
  ///
  ///  * [TimePicker], which gives you a standardized way to let users pick a time
  ///    value
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
