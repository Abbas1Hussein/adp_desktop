import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../../../date_picker_formatter.dart';
import '../../../macos_button_picker.dart';
import '../../../macos_dialog_picker.dart';

class MacosDatePickerButton extends MacosPickerButton {
  const MacosDatePickerButton({
    super.key,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  @override
  Widget child(BuildContext context) => _buildDatePicker();

  Widget _buildDatePicker() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(month.substring(0, 3)),
        kVerticalDivider,
        Text(day),
        kVerticalDivider,
        Text(year),
      ],
    );
  }
}

class DatePickerMacos extends StatefulWidget {
  final DatePickerMacosProperty? property;
  final DateTime initialDate;
  final VoidCallback? onCancel;

  final ValueChanged<DateTime>? onDateTimeChanged;

  const DatePickerMacos({
    super.key,
    this.onCancel,
    this.property,
    this.onDateTimeChanged,
    required this.initialDate,
  });

  @override
  State<DatePickerMacos> createState() => _DatePickerMacosState();
}

class _DatePickerMacosState extends State<DatePickerMacos> {
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
    return MacosDatePickerButton(
      initialDate: initialDate,
      localizations: localizations,
      onPressed: _showMacosDatePicker,
    );
  }

  Widget _buildMacosDatePicker() {
    return FittedBox(
      fit: BoxFit.fill,
      child: MacosDatePicker(
        initialDate: initialDate,
        onDateChanged: _onDateTimeChanged,
        style: DatePickerStyle.graphical,
        startWeekOnMonday: widget.property?.startWeekOnMonday,
        weekdayAbbreviations: widget.property?.weekdayAbbreviations ?? localizations.narrowWeekdays,
        monthAbbreviations: widget.property?.monthAbbreviations ?? BaseDateFormatter.kMonthAbbreviations,
      ),
    );
  }

  void _showMacosDatePicker() {
    MacosDialogPicker(
      context,
      _buildMacosDatePicker(),
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

class DatePickerMacosProperty extends CoreMacosProperty {
  /// A list of 7 strings, one for each day of the week, starting with Sunday.
  final List<String>? weekdayAbbreviations;

  /// A list of 12 strings, one for each month of the year, starting with January.
  final List<String>? monthAbbreviations;

  /// Allows for changing the order of day headers in the graphical Date Picker
  /// to Mo, Tu, We, Th, Fr, Sa, Su.
  ///
  /// This is useful for internationalization purposes, as many countries begin their weeks on Mondays.
  ///
  /// Defaults to `false`.
  final bool? startWeekOnMonday;

  const DatePickerMacosProperty({
    this.weekdayAbbreviations,
    this.monthAbbreviations,
    this.startWeekOnMonday,
  });
}
