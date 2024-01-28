import 'package:adp_desktop/adp_desktop.dart';

class DialogPreview extends StatelessWidget {
  const DialogPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveButton(
          onPressed: () {
            showAdpDialog(
              context: context,
              builder: (context) {
                return AdaptiveDialog(
                  title: const Text('Delete #username'),
                  content: const Text(
                    'are you sure you want delete #username user?',
                  ),
                  primary: AdaptiveButton(
                    backgroundColor: AdpColors.red,
                    child: const Text('delete'),
                    onPressed: () {},
                  ),
                  secondary: AdaptiveButton(
                    child: const Text('close'),
                    onPressed: () {},
                  ),
                );
              },
            );
          },
          child: const Text('show dialog'),
        ),
        AdaptiveButton(
          onPressed: () {
            DialogPresenter.showInformationDialog(
              context,
              title: 'Information Dialog',
              message:
                  'The Sample information dialog box displays information about a sample location including the Local Coordinates (LX, LY).'
                  'It also allows certain built-in parameters as well as all user-defined parameters to be changed.',
              confirmLabel: 'confirmLabel',
            );
          },
          child: const Text('show information dialog'),
        ),
        AdaptiveButton(
          onPressed: () {
            DialogPresenter.showConfirmationDialog(
              context,
              title: 'Confirmation Dialog',
              message:
                  'The Sample information dialog box displays information about a sample location including the Local Coordinates (LX, LY).'
                  'It also allows certain built-in parameters as well as all user-defined parameters to be changed.',
              confirmLabel: 'confirmLabel',
              cancelLabel: 'cancelLabel',
            );
          },
          child: const Text('show confirmation dialog'),
        ),
      ],
    );
  }
}
