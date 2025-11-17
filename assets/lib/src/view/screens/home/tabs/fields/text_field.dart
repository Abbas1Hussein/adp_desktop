import 'package:adp_desktop/adp_desktop.dart';

class TextFieldPreview extends StatefulWidget {
  const TextFieldPreview({super.key});

  @override
  State<TextFieldPreview> createState() => _TextFieldPreviewState();
}

class _TextFieldPreviewState extends State<TextFieldPreview> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdaptiveTextField(
            controller: controller,
            placeholder: 'Enter your text',
          ),
          const SizedBox(height: 20.0),
          AdaptiveButton(onPressed: _submitText, child: const Text('Submit')),
        ],
      ),
    );
  }

  void _submitText() {
    final enteredText = controller.text;
    DialogPresenter.showInformationDialog(
      context,
      title: 'Your Text',
      message: enteredText,
      confirmLabel: 'Cancel',
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
