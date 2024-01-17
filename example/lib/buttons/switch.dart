import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';

/// A switch is a two-state user interface element used to toggle between ON (Checked) or OFF (Unchecked) states.
/// Typically, it is a button with a thumb slider where the user can drag back and forth to choose an option in the form of ON or OFF.
/// Its working is similar to the house electricity switches.
///
/// In Flutter, the switch is a widget used to select between two options, either ON or OFF.
/// It does not maintain the state itself. To maintain the states, it will call the onChanged property.
/// If the value return by this property is true, then the switch is ON and false when it is OFF.
/// When this property is null, the switch widget is disabled.
class Switch extends StatefulWidget {
  const Switch({Key? key}) : super(key: key);

  @override
  State<Switch> createState() => _BaseButtonsState();
}

class _BaseButtonsState extends State<Switch> {
  bool _currentValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveSwitch(
          value: _currentValue,
          label: const Text('switch'),
          onChanged: (value) {
            setState(() => _currentValue = value);
          },
        ),
      ],
    );
  }
}
