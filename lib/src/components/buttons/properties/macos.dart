import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/properties.dart';


class ButtonMacosProperty extends CoreMacosProperty {
  /// The size of the button.
  final ControlSize? controlSize;

  /// The amount of space to surround the child inside the bounds of the button.
  ///
  /// Leave blank to use the default padding provided by [_kSmallButtonPadding]
  /// or [_kLargeButtonPadding].
  final EdgeInsetsGeometry? padding;

  /// The opacity that the button will fade to when it is pressed.
  /// The button will have an opacity of 1.0 when it is not pressed.
  ///
  /// This defaults to 0.4. If null, opacity will not change on pressed if using
  /// your own custom effects is desired.
  final double? pressedOpacity;

  /// The radius of the button's corners when it has a background color.
  ///
  /// Leave blank to use the default radius provided by [_kSmallButtonRadius]
  /// or [_kLargeButtonRadius].
  final BorderRadiusGeometry? borderRadius;

  /// The alignment of the button's [title].
  ///
  /// Typically buttons are sized to be just big enough to contain the child and its
  /// [padding]. If the button's size is constrained to a fixed size, for example by
  /// enclosing it with a [SizedBox], this property defines how the child is aligned
  /// within the available space.
  ///
  /// Always defaults to [Alignment.center].
  final AlignmentGeometry? alignment;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// Whether the button is used as a secondary action button (e.g. Cancel buttons in dialogs)
  ///
  /// Sets its background color to [PushButtonThemeData]'s [secondaryColor] attributes (defaults
  /// are gray colors). Can still be overridden if the [activeTrackColor] attribute is non-null.
  final bool? secondary;

  const ButtonMacosProperty({
    this.controlSize,
    this.padding,
    this.pressedOpacity,
    this.borderRadius,
    this.alignment,
    this.semanticLabel,
    this.secondary,
  });
}
