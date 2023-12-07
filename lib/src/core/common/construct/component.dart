import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart' hide Builder;

import 'builders.dart';

abstract class CoreAdaptiveComponent<Windows, Macos> extends StatelessWidget {
  final CoreAdaptiveBuilder? builders;

  /// An optional parameter for platform-specific properties. You can specify platform-specific properties as follows:
  /// - For Windows, use [Windows] property.
  /// - For macOS, use [Macos] property.
  final CoreProperties<Windows, Macos>? properties;

  const CoreAdaptiveComponent({this.builders, this.properties, super.key});

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return adaptiveValue(
      windows: () => _getBuilderOrFallback(builders?.windows, windows(context)),
      macos: () => _getBuilderOrFallback(builders?.macos, macos(context)),
    );
  }

  Widget _getBuilderOrFallback(Builder? builder, Widget fallback) {
    return builder?.call(fallback) ?? fallback;
  }

  Widget windows(BuildContext context);

  Widget macos(BuildContext context);
}
