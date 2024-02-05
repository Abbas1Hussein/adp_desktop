import 'package:adp_desktop/adp_desktop.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({super.key});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdaptiveSwitch(
        label: const Text('Switch'),
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }
}
