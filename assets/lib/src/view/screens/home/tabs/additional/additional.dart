import 'package:flutter/widgets.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/title.dart';
import 'adaptive.dart';
import 'brightness_typography.dart';
import 'colors.dart';
import 'page_route.dart';

class Additional extends StatelessWidget {
  const Additional({super.key});

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 20.0);
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitle(
            path: HighlightPaths.colors,
            title: 'Primary Colors',
            message:
                "AdpColors: a collection of primary color for different platforms.",
          ),
          Padding(padding: edgeInsets, child: ColorsPreview()),
          CustomTitle(
            path: HighlightPaths.brightnessTypography,
            title: 'Brightness, Typography',
            message:
                "AdaptiveBrightness: get current brightness from different platforms."
                "\nAdaptiveTypography: that provides styles for various text elements based on the current platform",
          ),
          Padding(padding: edgeInsets, child: BrightnessTypographyPreview()),
          CustomTitle(
            path: HighlightPaths.adaptive,
            title: 'adaptive value, Platform Ruining',
            message:
                "adaptiveValue: returns value based on the current platform."
                "\nPlatformRuining: platform-related checks and information retrieval.",
          ),
          Padding(padding: edgeInsets, child: AdaptiveValuePreview()),
          CustomTitle(
            path: HighlightPaths.pageRoute,
            title: 'Page Route',
            message:
                "AdaptivePageRoute: A modal route that replaces the entire screen with a platform-adaptive transition.",
          ),
          Padding(padding: edgeInsets, child: PageRoutePreview()),
        ],
      ),
    );
  }
}
