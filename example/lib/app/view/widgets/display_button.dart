import 'package:adp_desktop/adp_desktop.dart';

class DisplayNavButton extends StatelessWidget {
  const DisplayNavButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 20.0);

    return Padding(
      padding: edgeInsets,
      child: SizedBox(
        width: double.infinity,
        child: AdaptiveButton(
          child: const Text('display'),
          onPressed: () {
            Navigator.push(
              context,
              AdaptivePageRoute(
                builder: (context, animation, secondaryAnimation) => child,
              ),
            );
          },
        ),
      ),
    );
  }
}
