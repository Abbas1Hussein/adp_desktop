import 'package:fluent_ui/fluent_ui.dart';

import 'overlay_visibility.dart';

extension OverlayVisibilityModeEX on FieldOverlayVisibilityMode {
  OverlayVisibilityMode get overlayMode {
    switch (name) {
      case 'always':
        return OverlayVisibilityMode.always;
      case 'never':
        return OverlayVisibilityMode.never;
      case 'notEditing':
        return OverlayVisibilityMode.notEditing;
      default:
        return OverlayVisibilityMode.always;
    }
  }
}