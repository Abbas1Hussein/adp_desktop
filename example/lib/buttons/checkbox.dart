import 'package:adp_desktop/adp_desktop.dart';

/// A checkbox is a type of input component which holds the Boolean value.
/// It is a GUI element that allows the user to choose multiple options from several selections.
/// Here, a user can answer only in yes or no value. A marked/checked checkbox means yes, and an unmarked/unchecked checkbox means no value.
/// Typically, we can see the checkboxes on the screen as a square box with white space or a tick mark.
/// A label or caption corresponding to each checkbox described the meaning of the checkboxes.
class Checked extends StatefulWidget {
  const Checked({Key? key}) : super(key: key);

  @override
  State<Checked> createState() => _BaseButtonsState();
}

class _BaseButtonsState extends State<Checked> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveCheckbox(
      value: isChecked,
      label: const Text('checkbox'),
      onChanged: (value) {
        setState(() => isChecked = value);
      },
    );
  }
}
