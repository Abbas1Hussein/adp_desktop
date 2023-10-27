import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  /// Convert TimeOfDay to DateTime
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}

extension DateTimeExtension on DateTime {
  /// Convert DateTime to TimeOfDay
  TimeOfDay toTimeOfDay() => TimeOfDay(hour: hour, minute: minute);
}
