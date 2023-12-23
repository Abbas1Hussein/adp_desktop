import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../../date_picker_formatter.dart';
import '../../macos_button_picker.dart';
import '../../macos_dialog_picker.dart';

class MacosDatePickerButton extends MacosPickerButton {
  const MacosDatePickerButton({
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
  const DatePickerMacos({
    super.key,
    this.onCancel,
    this.property,
    this.onDateTimeChanged,
    this.initialDate,
  });

  final DateTime? initialDate;
  final VoidCallback? onCancel;
  final DatePickerMacosProperty? property;
  final ValueChanged<DateTime>? onDateTimeChanged;

  @override
  State<DatePickerMacos> createState() => _DatePickerMacosState();
}

class _DatePickerMacosState extends State<DatePickerMacos> {
  late DateTime selectedDate;
  late DateTime lastSelectedDate;
  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedDate = widget.initialDate ?? DateTime.now();
    lastSelectedDate = widget.initialDate ?? DateTime.now();
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
      initialDate: selectedDate,
      localizations: localizations,
      onPressed: () => _showMacosDatePickerDialog(),
    );
  }

  Widget _buildMacosDatePicker() {
    return FittedBox(
      fit: BoxFit.fill,
      child: DefaultTextStyle(
        style: MacosTheme.of(context).typography.title1,
        child: MacosTheme(
          data: MacosTheme.of(context).copyWith(
            datePickerTheme: MacosDatePickerThemeData(),
          ),
          child: MacosDatePicker(
            initialDate: selectedDate,
            style: DatePickerStyle.graphical,
            onDateChanged: _onDateTimeChanged,
            startWeekOnMonday: widget.property?.startWeekOnMonday,
            weekdayAbbreviations: widget.property?.weekdayAbbreviations ??
                localizations.narrowWeekdays,
            monthAbbreviations: widget.property?.monthAbbreviations ??
                BaseDateFormatter.kMonthAbbreviations,
          ),
        ),
      ),
    );
  }

  Future<void> _showMacosDatePickerDialog() async {
    final result = await MacosDialogPicker(
      context,
      localizations,
      picker: _buildMacosDatePicker(),
    ).showMacosDatePicker();

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
    widget.onDateTimeChanged?.call(selectedDate);
  }

  void _onDateTimeChanged(DateTime dateTime) {
    setState(() {
      selectedDate = dateTime;
    });
  }
}

class DatePickerMacosProperty extends CoreMacosProperty {
  const DatePickerMacosProperty({
    this.weekdayAbbreviations,
    this.monthAbbreviations,
    this.startWeekOnMonday,
  });

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
}
