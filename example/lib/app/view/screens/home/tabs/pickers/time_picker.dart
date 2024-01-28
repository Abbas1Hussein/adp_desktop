import 'package:adp_desktop/adp_desktop.dart';

class TimePickerPreview extends StatelessWidget {
  const TimePickerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AdaptiveTimePicker(),
        if (PlatformRuining.isMacos)
          AdaptiveTimePicker(
            properties: Properties.macos(
              const TimePickerMacosProperty(
                mode: MacosTimePickerMode.cupertino,
              ),
            ),
          ),
        if (PlatformRuining.isMacos)
          AdaptiveTimePicker(
            properties: Properties.macos(
              const TimePickerMacosProperty(
                mode: MacosTimePickerMode.cupertinoButton,
              ),
            ),
          ),
      ],
    );
  }
}
