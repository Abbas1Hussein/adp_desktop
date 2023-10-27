import 'package:flutter/material.dart';

abstract class BaseDateFormatter extends StatelessWidget {
  final DateTime initialDate;
  final MaterialLocalizations localizations;

  const BaseDateFormatter({
    super.key,
    required this.initialDate,
    required this.localizations,
  });

  List<String> get _splitFullDateData {
    return localizations.formatFullDate(initialDate).split(',');
  }

  TimeOfDay get timeOfDay => TimeOfDay.fromDateTime(initialDate);

  String get weekDay => _splitFullDateData[0].substring(0, 3);

  String get monthWithDay => _splitFullDateData[1];

  String get year => _splitFullDateData[2];

  String get month => monthWithDay.trim().split(' ').first;

  String get day => initialDate.day.toString();

  String get amPm {
    final hour = initialDate.hour;
    return hour >= 12 ? 'PM' : 'AM';
  }

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
