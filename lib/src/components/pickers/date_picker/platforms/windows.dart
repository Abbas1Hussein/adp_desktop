import 'package:fluent_ui/fluent_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../../button_picker/button_picker.dart';

/// The padding used on the content of [DatePicker] and [TimePicker]
const kPickerContentPadding = EdgeInsetsDirectional.only(
  start: 8.0,
  top: 4.0,
  bottom: 4.0,
);

/// The default popup height
const double kPickerPopupHeight = kOneLineTileHeight * 10;

class DatePickerWindows extends StatefulWidget {
  const DatePickerWindows({
    super.key,
    this.onCancel,
    this.property,
    this.initialDate,
    this.onDateTimeChanged,
  });

  final DateTime? initialDate;
  final VoidCallback? onCancel;
  final DatePickerWindowsProperty? property;
  final ValueChanged<DateTime>? onDateTimeChanged;

  @override
  State<DatePickerWindows> createState() => _DatePickerWindowsState();
}

class _DatePickerWindowsState extends State<DatePickerWindows> {
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: DatePicker(
        selected: selectedDate,
        onCancel: widget.onCancel,
        onChanged: _onDateTimeChanged,
        header: widget.property?.header,
        headerStyle: widget.property?.headerStyle,
        focusNode: widget.property?.focusNode,
        autofocus: widget.property?.autofocus ?? false,
        locale: widget.property?.locale,
        fieldOrder: widget.property?.fieldOrder,
        popupHeight: widget.property?.popupHeight ?? kPickerPopupHeight,
        showMonth: widget.property?.showMonth ?? true,
        showDay: widget.property?.showDay ?? true,
        showYear: widget.property?.showYear ?? true,
        endDate: widget.property?.endDate,
        startDate: widget.property?.startDate,
        contentPadding:
            widget.property?.contentPadding ?? kPickerContentPadding,
      ),
    );
  }

  void _onDateTimeChanged(DateTime dateTime) {
    setState(() {
      selectedDate = dateTime;
    });
    widget.onDateTimeChanged?.call(dateTime);
  }
}

class DatePickerWindowsProperty extends CoreWindowsProperty {
  const DatePickerWindowsProperty({
    this.header,
    this.headerStyle,
    this.showMonth,
    this.showDay,
    this.showYear,
    this.startDate,
    this.endDate,
    this.contentPadding,
    this.focusNode,
    this.autofocus,
    this.popupHeight,
    this.locale,
    this.fieldOrder,
  });

  /// The content of the header
  final String? header;

  /// The style of the [header]
  final TextStyle? headerStyle;

  /// Whenever to show the month field
  ///
  /// See also:
  ///
  ///  * [showDay], which configures whether to show the day field
  ///  * [showYear], which configures whether to show the year field
  final bool? showMonth;

  /// Whenever to show the day field
  ///
  /// See also:
  ///
  ///  * [showMonth], which configures whether to show the month field
  ///  * [showYear], which configures whether to show the year field
  final bool? showDay;

  /// Whenever to show the year field
  ///
  /// See also:
  ///
  ///  * [showDay], which configures whether to show the day field
  ///  * [showMonth], which configures whether to show the month field
  final bool? showYear;

  /// The date displayed at the beginning
  ///
  /// Defaults to 100 to today
  final DateTime? startDate;

  /// The date displayed at the end of the list
  ///
  /// Defaults to 25 years from today
  final DateTime? endDate;

  /// The padding of the picker fields. Defaults to [kPickerContentPadding]
  final EdgeInsetsGeometry? contentPadding;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// The height of the popup.
  ///
  /// Defaults to [kPickerPopupHeight]
  final double? popupHeight;

  /// The locale used to format the month name.
  ///
  /// If null, the system locale will be used.
  final Locale? locale;

  /// The order of the fields.
  ///
  /// If null, the order is based on the current locale.
  ///
  /// See also:
  ///
  ///  * [getDateOrderFromLocale], which returns the order of the fields based
  ///    on the current locale
  final List<DatePickerField>? fieldOrder;
}
