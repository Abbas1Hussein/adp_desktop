import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/extension/time.dart';
import '../../../macos_button_picker.dart';
import '../../../macos_dialog_picker.dart';

class MacosTimePickerButton extends MacosPickerButton {
  const MacosTimePickerButton({
    super.key,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  @override
  Widget child(BuildContext context) {
    final formatHour = initialDate.toTimeOfDay().format(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(formatHour.substring(0, 1)),
        kVerticalDivider,
        Text(initialDate.minute.toString()),
        kVerticalDivider,
        Text(amPm),
      ],
    );
  }
}

class TimePickerMacos extends StatefulWidget {
  final DateTime initialDate;
  final VoidCallback? onCancel;

  final ValueChanged<DateTime>? onDateTimeChanged;

  const TimePickerMacos({
    super.key,
    this.onCancel,
    this.onDateTimeChanged,
    required this.initialDate,
  });

  @override
  State<TimePickerMacos> createState() => _TimePickerMacosState();
}

class _TimePickerMacosState extends State<TimePickerMacos> {
  late DateTime initialDate;
  late MaterialLocalizations localizations;

  @override
  void initState() {
    initialDate = widget.initialDate;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = MaterialLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MacosTimePickerButton(
      initialDate: initialDate,
      localizations: localizations,
      onPressed: _showMacosTimePicker,
    );
  }

  Widget _buildMacosTimePicker() {
    return FittedBox(
      fit: BoxFit.contain,
      child: MacosTimePicker(
        style: TimePickerStyle.combined,
        onTimeChanged: (time) {
          _onDateTimeChanged(time.toDateTime());
        },
      ),
    );
  }

  void _showMacosTimePicker() {
    MacosDialogPicker(
      context,
      _buildMacosTimePicker(),
      localizations: localizations,
      onCancelClick: widget.onCancel,
      onOkClick: () => _onDateTimeChanged(initialDate),
    ).showMacosDatePicker();
  }

  void _onDateTimeChanged(DateTime dateTime) {
    widget.onDateTimeChanged?.call(dateTime);
    setState(() {
      initialDate = dateTime;
    });
  }
}

