import 'package:flutter/widgets.dart';

import 'platforms.dart';

typedef Builder<ThemePlatformData, Property> = Widget Function(
  Widget platformChild,
  ThemePlatformData theme,
  Property property,
);

abstract class CoreAdaptiveBuilder<W, M> extends CorePlatforms<W, M> {
  const CoreAdaptiveBuilder({super.windows, super.macos});
}

final class AdaptiveBuilder<W, M> extends CoreAdaptiveBuilder<W, M> {
  const AdaptiveBuilder({super.windows, super.macos});

  const AdaptiveBuilder.windows(W windows) : super(windows: windows);

  const AdaptiveBuilder.macos(M macos) : super(macos: macos);
}
