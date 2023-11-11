import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/properties.dart';

class ButtonWindowsProperty extends CoreWindowsProperty {
  /// Customizes this button's appearance.
  final ButtonStyle? style;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  final bool? focusable;


  const ButtonWindowsProperty({
    this.style,
    this.autofocus,
    this.focusNode,
    this.focusable,
  });
}
