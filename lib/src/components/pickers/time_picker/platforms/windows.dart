import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/time.dart';
import '../../date_picker/platforms/windows.dart';
import '../../macos_button_picker.dart';

class TimePickerWindows extends StatefulWidget {
  const TimePickerWindows({
    super.key,
    this.onCancel,
    this.property,
    this.initialTime,
    this.onTimeChanged,
  });

  final TimeOfDay? initialTime;
  final VoidCallback? onCancel;
  final TimePickerWindowsProperty? property;
  final ValueChanged<TimeOfDay>? onTimeChanged;

  @override
  State<TimePickerWindows> createState() => _TimePickerWindowsState();
}

class _TimePickerWindowsState extends State<TimePickerWindows> {
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = widget.initialTime?.toDateTime() ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: TimePicker(
        selected: selectedDate,
        onCancel: widget.onCancel,
        onChanged: _onDateTimeChanged,
        header: widget.property?.header,
        focusNode: widget.property?.focusNode,
        headerStyle: widget.property?.headerStyle,
        autofocus: widget.property?.autofocus ?? false,
        minuteIncrement: widget.property?.minuteIncrement ?? 1,
        hourFormat: widget.property?.hourFormat ?? HourFormat.h,
        popupHeight: widget.property?.popupHeight ?? kPickerPopupHeight,
        contentPadding:
            widget.property?.contentPadding ?? kPickerContentPadding,
      ),
    );
  }

  void _onDateTimeChanged(DateTime time) {
    setState(() {
      selectedDate = time;
    });
    widget.onTimeChanged?.call(TimeOfDay.fromDateTime(time));
  }
}

class TimePickerWindowsProperty extends DatePickerWindowsProperty {
  const TimePickerWindowsProperty({
    super.autofocus,
    super.focusNode,
    super.header,
    super.headerStyle,
    super.popupHeight,
    super.contentPadding,
    this.hourFormat = HourFormat.h,
    this.minuteIncrement = 1,
  });

  /// The clock system to use
  ///
  /// Defaults to  [HourFormat.h].
  final HourFormat hourFormat;

  /// The value that indicates the time increments shown in the minute picker.
  /// For example, 15 specifies that the TimePicker minute control displays
  /// only the choices 00, 15, 30, 45.
  ///
  /// ![15 minute increment preview](https://docs.microsoft.com/en-us/windows/apps/design/controls/images/date-time/time-picker-minute-increment.png)
  ///
  /// Defaults to 1px.
  final int minuteIncrement;
}
