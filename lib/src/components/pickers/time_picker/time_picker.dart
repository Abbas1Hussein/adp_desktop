import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import 'platforms/platforms.dart';

class AdaptiveTimePicker extends CoreAdaptiveComponent {
  const AdaptiveTimePicker({super.key});

  @override
  Widget windows(BuildContext context) {
    return TimePicker(
      onCancel: () {},
      onChanged: (value) {
        TimeOfDay timeOfDay = TimeOfDay.fromDateTime(value);
        print('Converted TimeOfDay: $timeOfDay');
      },
      selected: DateTime.now(),
    );
  }

  @override
  Widget macos(BuildContext context) {
    return TimePickerMacos(
      initialDate: DateTime.now(),
    );
  }

  void handleTimeChanged(TimeOfDay time, BuildContext context) {
    print("Selected time: ${time.format(context)}");
    // You can perform any action with the selected time here.
  }
}
