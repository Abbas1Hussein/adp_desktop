import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../../../../core/common/platform_ruining.dart';
import '../../../../core/extension/time.dart';
import '../../button_picker/button_picker.dart';
import '../../dialog_picker/dialog_picker.dart';

class TimePickerMacosButton extends MacosPickerButton {
  const TimePickerMacosButton({
    super.key,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  @override
  Widget child(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildTimeComponent('${timeOfDay.hourOfPeriod}', 'h'),
        verticalDivider(context),
        buildTimeComponent('${timeOfDay.minute}', 'm'),
        verticalDivider(context),
        Text(amPm),
      ],
    );
  }

  Widget buildTimeComponent(String value, String unit) {
    return Row(
      children: [
        Text(value),
        const SizedBox(width: 2.0),
        Baseline(
          baseline: 25,
          baselineType: TextBaseline.alphabetic,
          child: Text(unit, style: const TextStyle(fontSize: 13.0)),
        ),
      ],
    );
  }
}

class TimePickerMacos extends StatefulWidget {
  const TimePickerMacos({
    super.key,
    this.property,
    this.onCancel,
    this.onTimeChanged,
    required this.initialTime,
  });

  final TimeOfDay? initialTime;
  final VoidCallback? onCancel;

  final TimePickerMacosProperty? property;
  final ValueChanged<TimeOfDay>? onTimeChanged;

  @override
  State<TimePickerMacos> createState() => _TimePickerMacosState();
}

class _TimePickerMacosState extends State<TimePickerMacos> {
  late TimeOfDay selectedDate;
  late TimeOfDay lastSelectedDate;

  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedDate = widget.initialTime ?? TimeOfDay.now();
    lastSelectedDate = widget.initialTime ?? TimeOfDay.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = MaterialLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return TimePickerMacosButton(
      localizations: localizations,
      initialDate: selectedDate.toDateTime(),
      onPressed: _showMacosTimePicker,
    );
  }

  Widget _buildMacosTimePicker() {
    return FittedBox(
      fit: BoxFit.contain,
      child: MacosTimePicker(
        initialTime: selectedDate,
        style: PlatformRuining.isFakeMacos
            ? TimePickerStyle.combined
            : TimePickerStyle.graphical,
        onTimeChanged: (time) => _onDateTimeChanged(time),
      ),
    );
  }

  Future<void> _showMacosTimePicker() async {
    final isHorizontal = widget.property?.horizontalActions ?? true;
    final isDismissible = widget.property?.isDismissible ?? true;
    final result = await MacosDialogPicker(
      context,
      localizations,
      picker: _buildMacosTimePicker(),
    ).showMacosTimePicker(isHorizontal, isDismissible);

    if (result != null && result) {
      _handleOkClick();
    } else {
      _handleCancelClick();
    }
  }

  void _handleCancelClick() {
    _onDateTimeChanged(lastSelectedDate);
    widget.onCancel?.call();
  }

  void _handleOkClick() {
    setState(() {
      lastSelectedDate = selectedDate;
    });
    widget.onTimeChanged?.call(selectedDate);
  }

  void _onDateTimeChanged(TimeOfDay timeOfDay) {
    setState(() {
      selectedDate = timeOfDay;
    });
  }
}

class TimePickerMacosProperty extends CoreMacosProperty {
  const TimePickerMacosProperty({
    this.isDismissible = true,
    this.horizontalActions = true,
  });

  /// Determines whether to lay out [primaryButton] and [secondaryButton]
  /// horizontally or vertically.
  ///
  /// Defaults to `true`.
  final bool horizontalActions;

  /// Determines whether the MacosTimePicker can be dismissed by tapping outside of it.
  ///
  /// If set to true, the MacosTimePicker can be dismissed by tapping outside its bounds.
  /// If set to false, the MacosTimePicker will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to true.
  final bool isDismissible;
}
