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
    this.initialDate,
    this.onDateTimeChanged,
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
      onPressed: _showMacosDatePickerDialog,
    );
  }

  Widget _buildMacosDatePicker() {
    return FittedBox(
      fit: BoxFit.fill,
      child: DefaultTextStyle(
        style: MacosTheme.of(context).typography.title1,
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
    );
  }

  Future<void> _showMacosDatePickerDialog() async {
    final showIcon = widget.property?.showIcon ?? true;
    final showTitle = widget.property?.showTitle ?? true;
    final isHorizontal = widget.property?.horizontalActions ?? true;
    final isDismissible = widget.property?.isDismissible ?? true;

    final result = await MacosDialogPicker(
      context,
      localizations,
      picker: _buildMacosDatePicker(),
    ).showMacosDatePicker(showIcon, showTitle, isHorizontal, isDismissible);

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
    this.showIcon = true,
    this.showTitle = true,
    this.isDismissible = true,
    this.horizontalActions = true,
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

  /// Determines whether to lay out [primaryButton] and [secondaryButton]
  /// horizontally or vertically.
  ///
  /// Defaults to `true`.
  final bool horizontalActions;

  /// Whether to display the icon.
  ///
  /// When set to true, an icon will be shown in the Date Picker.
  /// Defaults to `true`.
  final bool showIcon;

  /// Whether to display the title.
  ///
  /// When set to true, the title will be shown in the Date Picker.
  /// Defaults to `true`.
  final bool showTitle;

  /// Determines whether the DatePickerMacos can be dismissed by tapping outside of it.
  ///
  /// If set to true, the DatePickerMacos can be dismissed by tapping outside its bounds.
  /// If set to false, the DatePickerMacos will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to true.
  final bool isDismissible;
}
