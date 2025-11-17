import 'package:adp_desktop/adp_desktop.dart';

class WindowControlButtonsPreview extends StatelessWidget {
  const WindowControlButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AdaptiveWindowButtons(),
        const AdaptiveCloseWindowButton().margeWith(const Text('Close')),
        const AdaptiveMaximizeWindowButton().margeWith(const Text('Maximize')),
        const AdaptiveMinimizeWindowButton().margeWith(const Text('Minimize')),
      ],
    );
  }
}
