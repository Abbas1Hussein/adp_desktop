import 'package:flutter/material.dart';

extension TimeOfDayEx on TimeOfDay {
  DateTime get dateTime => DateTime.now();

  /// to convert TimeOfDay to DateTime
  DateTime toDateTime() {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  }

  ///  to convert Duration to TimeOfDay
  Duration convertTimeOfDayToDuration() {
    return Duration(hours: hour, minutes: minute, seconds: dateTime.second);
  }
}

extension DurationEx on Duration {
  ///  to convert Duration to TimeOfDay
  TimeOfDay convertDurationToTimeOfDay() {
    return TimeOfDay(hour: inHours, minute: inMinutes % 60);
  }
}
