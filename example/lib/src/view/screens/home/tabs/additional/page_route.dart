import 'package:adp_desktop/adp_desktop.dart';

class PageRoutePreview extends StatelessWidget {
  const PageRoutePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton.outlined(
        child: const Text('display'),
        onPressed: () {
          Navigator.push(
            context,
            AdaptivePageRoute(
              transition: AdaptiveTransition.page,
              builder: (context, animation, secondaryAnimation) {
                return AdaptiveScaffoldPage(
                  appBar: const AdaptiveAppBarPage(),
                  content: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AdaptiveButton(
                          child: const Text('AdaptiveEntranceTransition'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              AdaptivePageRoute(
                                transition: AdaptiveTransition.entrance,
                                builder:
                                    (context, animation, secondaryAnimation) {
                                      return AdaptiveScaffoldPage(
                                        appBar: const AdaptiveAppBarPage(),
                                        content: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              AdaptiveButton(
                                                child: const Text('close'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                              ),
                            );
                          },
                        ),
                        AdaptiveButton(
                          child: const Text(
                            'AdaptiveHorizontalSlideTransition',
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              AdaptivePageRoute(
                                transition: AdaptiveTransition.horizontal,
                                builder:
                                    (context, animation, secondaryAnimation) {
                                      return AdaptiveScaffoldPage(
                                        appBar: const AdaptiveAppBarPage(),
                                        content: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              AdaptiveButton(
                                                child: const Text('close'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
