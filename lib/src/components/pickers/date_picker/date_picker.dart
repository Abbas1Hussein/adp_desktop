import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

class AdaptiveDatePicker extends CoreAdaptiveComponent<DatePickerWindowsProperty, DatePickerMacosProperty> {
  /// The initial date displayed when the date picker is first shown.
  final DateTime initialDate;

  /// A callback function to be called when the user cancels the date picker.
  /// It can be null if no action is needed on cancellation.
  final VoidCallback? onCancel;

  /// A callback function called when the user selects a date in the picker.
  /// It provides the selected [DateTime] as an argument.
  /// It can be null if you don't need to handle date selection.
  final ValueChanged<DateTime>? onDateTimeSelected;

  const AdaptiveDatePicker({
    super.key,
    super.builders,
    super.properties,
    this.onCancel,
    this.onDateTimeSelected,
    required this.initialDate,
  });

  @override
  Widget windows(BuildContext context) {
    return DatePickerWindows(
      initialDate: initialDate,
      onDateTimeChanged: onDateTimeSelected,
      onCancel: onCancel,
      property: properties?.windows,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return DatePickerMacos(
      initialDate: initialDate,
      onDateTimeChanged: onDateTimeSelected,
      onCancel: onCancel,
      property: properties?.macos,
    );
  }
}
