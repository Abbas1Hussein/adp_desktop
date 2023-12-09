import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/properties.dart';
import 'platforms/platforms.dart';

class AdaptiveBottomSheet extends CoreAdaptiveComponent<
    BottomSheetWindowsProperty, NoneProperty> {
  /// The widget below this widget in the tree.
  final Widget title;

  /// An optional content that provides more details about the
  /// reason for the alert.
  final Widget? content;

  const AdaptiveBottomSheet({
    super.key,
    super.properties,
    this.content,
    required this.title,
  });

  @override
  Widget macos(BuildContext context) {
    return BottomSheetMacos(
      title: title,
      content: content,
     // property: properties?.macos,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return BottomSheetWindows(
      title: title,
      content: content,
      property: properties?.windows,
    );
  }
}
