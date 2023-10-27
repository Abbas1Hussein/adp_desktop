import 'package:flutter/widgets.dart' hide Builder;

import 'platforms.dart';

typedef Builder = Widget Function(Widget platformChild);

abstract class CoreAdaptiveBuilder extends CorePlatforms<Builder, Builder> {
  const CoreAdaptiveBuilder({super.windows, super.macos});
}

final class AdaptiveBuilder extends CoreAdaptiveBuilder {
  const AdaptiveBuilder({super.windows, super.macos});
}

final class OnlyBuilder extends CoreAdaptiveBuilder {
  OnlyBuilder.windows(Builder? windows) : super(windows: windows);

  OnlyBuilder.macos(Builder? macos) : super(macos: macos);
}
