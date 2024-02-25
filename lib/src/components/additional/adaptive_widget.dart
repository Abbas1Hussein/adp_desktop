import 'package:flutter/widgets.dart';

import '../../core/common/construct/component.dart';

class AdaptiveWidget extends CoreAdaptiveComponent {
  const AdaptiveWidget({
    super.key,
    required this.onWindows,
    required this.onMacos,
  });

  final WidgetBuilder onWindows;
  final WidgetBuilder onMacos;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) =>
      onWindows(context);

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) =>
      onMacos(context);
}
