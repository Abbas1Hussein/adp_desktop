import 'package:adp_desktop/adp_desktop.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({super.key});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: AdaptiveTextButton(
        onPressed: () {},
        child: const Text('Text Button'),
      ),
    );
  }
}
