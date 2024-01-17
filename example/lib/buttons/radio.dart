import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';

/// let users select one option from a collection of two or more mutually exclusive, but related, options.
/// Radio buttons are always used in groups, and each option is represented by one
/// radio button in the group.
///
/// In the default state, no radio button in a RadioButtons group is selected.
/// That is, all radio buttons are cleared. However, once a user has selected a
/// radio button, the user can't deselect the button to restore the group to its
/// initial cleared state.
///
/// The singular behavior of a RadioButtons group distinguishes it from check
/// boxes, which support multi-selection and deselection, or clearing.
class Radio extends StatefulWidget {
  const Radio({Key? key}) : super(key: key);

  @override
  State<Radio> createState() => _BaseButtonsState();
}

class _BaseButtonsState extends State<Radio> {
  int selectedRadio = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveRadio(
          value: 1,
          groupValue: selectedRadio,
          label: const Text('Radio 1'),
          onChanged: (value) {
            setState(() => selectedRadio = value);
          },
        ),
        AdaptiveRadio(
          value: 2,
          groupValue: selectedRadio,
          label: const Text('Radio 2'),
          onChanged: (value) {
            setState(() => selectedRadio = value);
          },
        ),
        AdaptiveRadio(
          value: 3,
          groupValue: selectedRadio,
          label: const Text('Radio 3'),
          onChanged: (value) {
            setState(() => selectedRadio = value);
          },
        ),
      ],
    );
  }

}
