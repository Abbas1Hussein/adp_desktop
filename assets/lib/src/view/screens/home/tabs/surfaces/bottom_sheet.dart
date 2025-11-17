import 'package:adp_desktop/adp_desktop.dart';

class BottomSheetPreview extends StatelessWidget {
  const BottomSheetPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      onPressed: () {
        showAdpBottomSheet(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AdaptiveBottomSheet(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: DefaultTextStyle(
                          style: AdaptiveTypography.of(context).subheading!,
                          child: Text(DummyText.generateQuestion),
                        ),
                      ),
                      const AdaptiveCloseButton(),
                    ],
                  ),
                  Text(DummyText.generateAnswer),
                  Expanded(child: Image.asset('assets/images/banner.png')),
                ],
              ),
            );
          },
        );
      },
      child: const Text('show bottom sheet'),
    );
  }
}
