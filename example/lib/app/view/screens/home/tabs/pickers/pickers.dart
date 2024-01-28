import 'package:adp_desktop/adp_desktop.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'date_picker.dart';
import 'time_picker.dart';

class Pickers extends StatelessWidget {
  const Pickers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTitle(
          path: HighlightPaths.datePicker,
          title: 'Date Picker',
          message:
              'AdaptiveDatePicker: A widget that provides a standardized way to let users pick a localized date value.',
        ),
        DatePickerPreview(),
        CustomTitle(
          path: HighlightPaths.timePicker,
          title: 'Time Picker',
          message:
              'AdaptiveTimePicker: A widget that provides a standardized way to let users pick a time value.',
        ),
        TimePickerPreview(),
      ],
    );
  }
}
