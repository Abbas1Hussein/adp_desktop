import 'package:fluent_ui/fluent_ui.dart' hide Builder;
import 'package:macos_ui/macos_ui.dart';

import 'platforms.dart';
import 'properties.dart';

typedef Builder<ThemeData, Property> = Widget Function(
    Widget platformChild, ThemeData theme, Property? property);

abstract class CoreAdaptiveBuilder extends CorePlatforms<
    Builder<FluentThemeData, CoreWindowsProperty?>,
    Builder<MacosThemeData, CoreMacosProperty?>> {
  const CoreAdaptiveBuilder({super.windows, super.macos});
}

final class AdaptiveBuilder extends CoreAdaptiveBuilder {
  const AdaptiveBuilder({super.windows, super.macos});

  AdaptiveBuilder.windows(
    Builder<FluentThemeData, CoreWindowsProperty?> windows,
  ) : super(windows: windows);

  AdaptiveBuilder.macos(
    Builder<MacosThemeData, CoreMacosProperty?> macos,
  ) : super(macos: macos);
}
