import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'platforms/platforms.dart';

/// The time picker gives you a standardized way to let users pick a time value
/// using touch, mouse, or keyboard input.
///
/// See also:
///
///  * [DatePicker], which gives you a standardized way to let users pick a
///    localized date value
///
/// Use this widget to create time picker with platform-specific
/// styling and behavior:
/// - On macOS, [MacosTimePicker],[CupertinoTimerPicker] is utilized.
/// - On Windows, [TimePicker] is used.
class AdaptiveTimePicker extends CoreAdaptiveComponent<
    TimePickerWindowsProperty, TimePickerMacosProperty> {
  /// Creates an instance of [AdaptiveTimePicker].
  ///
  /// The [AdaptiveTimePicker] invokes the callback with the new selected value and
  /// automatically manages state updates until the parent widget rebuilds the
  /// time picker with the updated value.
  ///
  /// You do not need to manually update the state; the [AdaptiveTimePicker] handles
  /// state changes directly.
  ///
  /// The [properties] parameter allows you to customize the visual and functional aspects
  /// of the tab view separately for Windows and macOS platforms.
  /// You can provide specific [properties] for each platform using `TimePickerWindowsProperty`
  /// and `TimePickerMacosProperty` respectively.
  ///
  /// Usage:
  /// ```dart
  /// AdaptiveTimePicker(
  ///   initialTime: TimeOfDay.now(),
  ///   onCancel: () {
  ///     // Handle cancellation logic
  ///   },
  ///   onSelected: (TimeOfDay selectedTime)
  ///     // Handle selected date logic
  ///   },
  /// )
  /// ```
  const AdaptiveTimePicker({
    super.key,
    super.builders,
    super.properties,
    this.initialTime,
    this.onCancel,
    this.onSelected,
  });

  /// The initial time displayed when the time picker is first shown.
  ///
  /// Default to `TimeOfDay.now()`.
  final TimeOfDay? initialTime;

  /// A callback function to be called when the user cancels the time picker.
  /// It can be null if no action is needed on cancellation.
  final VoidCallback? onCancel;

  /// A callback function called when the user selects a time in the picker.
  /// It provides the selected [TimeOfDay] as an argument.
  final ValueChanged<TimeOfDay>? onSelected;

  @override
  Widget windows(BuildContext context, [TimePickerWindowsProperty? property]) {
    return TimePickerWindows(
      property: property,
      onCancel: onCancel,
      initialTime: initialTime,
      onTimeChanged: onSelected,
    );
  }

  @override
  Widget macos(BuildContext context, [TimePickerMacosProperty? property]) {
    return TimePickerMacos(
      property: property,
      onCancel: onCancel,
      initialTime: initialTime,
      onTimeChanged: onSelected,
    );
  }
}
