import 'package:fluent_ui/fluent_ui.dart';

import '../../../core/common/construct/properties.dart';

class ButtonWindowsProperty extends CoreWindowsProperty {
  /// Called when the button is pressed.
  ///
  /// If this callback, [onLongPress], [onBackTap] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onTapDown;

  /// Called when the button is released.
  ///
  /// If this callback, [onLongPress], [onBackTap] and [onTapDown] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onTapUp;

  /// Customizes this button's appearance.
  final ButtonStyle? style;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  final bool? focusable;


  const ButtonWindowsProperty({
    this.onTapDown,
    this.onTapUp,
    this.style,
    this.autofocus,
    this.focusNode,
    this.focusable,
  });
}
