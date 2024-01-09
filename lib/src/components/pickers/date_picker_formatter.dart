import 'package:flutter/material.dart';

abstract class BaseDateFormatter extends StatelessWidget {
  const BaseDateFormatter({
    super.key,
    required this.initialDate,
    required this.localizations,
  });

  final DateTime initialDate;
  final MaterialLocalizations localizations;

  List<String> get _splitFullDateData {
    return localizations.formatFullDate(initialDate).split(',');
  }

  String get weekDay => _splitFullDateData[0].substring(0, 3);

  String get monthWithDay => _splitFullDateData[1];

  String get year => _splitFullDateData[2];

  String get month => monthWithDay.trim().split(' ').first;

  String get day => initialDate.day.toString();

  String get amPm => timeOfDay.period.name.toUpperCase();

  TimeOfDay get timeOfDay => TimeOfDay.fromDateTime(initialDate);

  static const kMonthAbbreviations = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
}
