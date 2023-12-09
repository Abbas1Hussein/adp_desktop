import 'package:fluent_ui/fluent_ui.dart' hide Builder;
import 'package:macos_ui/macos_ui.dart';

import '../../core.dart';

abstract class CoreAdaptiveComponent<Windows extends CoreWindowsProperty,
    Macos extends CoreMacosProperty> extends StatelessWidget {
  const CoreAdaptiveComponent({this.builders, this.properties, super.key});

  final CoreAdaptiveBuilder? builders;

  /// An optional parameter for platform-specific properties. You can specify platform-specific properties as follows:
  /// - For Windows, use [Windows] property.
  /// - For macOS, use [Macos] property.
  final CoreProperties<Windows, Macos>? properties;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return adaptiveValue(
      windows: () {
        return builders?.windows?.call(
              windows(context),
              FluentTheme.of(context),
              properties?.windows,
            ) ?? windows(context);
      },
      macos: () =>
          builders?.macos?.call(
            macos(context),
            MacosTheme.of(context),
            properties?.macos,
          ) ??
          macos(context),
    );
  }

  Widget windows(BuildContext context);

  Widget macos(BuildContext context);
}
