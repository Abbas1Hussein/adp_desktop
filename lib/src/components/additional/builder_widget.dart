import 'package:flutter/widgets.dart';

import '../../core/common/construct/component.dart';
import '../../core/common/construct/properties.dart';

class AdaptiveBuilderWidget extends CoreAdaptiveComponent {
  const AdaptiveBuilderWidget({
    super.key,
    super.builders,
    required this.child,
  });

  final Widget child;

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) => child;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) => child;
}
