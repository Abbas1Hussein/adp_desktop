import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../../../macos_button_picker.dart';

/// The padding used on the content of [DatePicker] and [TimePicker]
const kPickerContentPadding = EdgeInsetsDirectional.only(
  start: 8.0,
  top: 4.0,
  bottom: 4.0,
);

/// The default popup height
const double kPickerPopupHeight = kOneLineTileHeight * 10;

class DatePickerWindows extends StatefulWidget {
  final DatePickerWindowsProperty? property;
  final DateTime initialDate;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final VoidCallback? onCancel;

  const DatePickerWindows({
    super.key,
    this.onCancel,
    this.property,
    this.onDateTimeChanged,
    required this.initialDate,
  });

  @override
  State<DatePickerWindows> createState() => _DatePickerWindowsState();
}

class _DatePickerWindowsState extends State<DatePickerWindows> {
  late DateTime initialDate;

  @override
  void initState() {
    initialDate = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: DatePicker(
        selected: initialDate,
        onChanged: _onDateTimeChanged,
        onCancel: widget.onCancel,
        header: widget.property?.header,
        headerStyle: widget.property?.headerStyle,
        focusNode: widget.property?.focusNode,
        autofocus: widget.property?.autofocus ?? false,
        locale: widget.property?.locale,
        endDate: widget.property?.endDate,
        fieldOrder: widget.property?.fieldOrder,
        popupHeight: widget.property?.popupHeight ?? kPickerPopupHeight,
        showDay: widget.property?.showDay ?? true,
        showMonth: widget.property?.showMonth ?? true,
        showYear: widget.property?.showYear ?? true,
        startDate: widget.property?.startDate,
        contentPadding:
            widget.property?.contentPadding ?? kPickerContentPadding,
      ),
    );
  }

  void _onDateTimeChanged(DateTime dateTime) {
    widget.onDateTimeChanged?.call(dateTime);
    setState(() {
      initialDate = dateTime;
    });
  }
}

class DatePickerWindowsProperty extends CoreWindowsProperty {
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
}
