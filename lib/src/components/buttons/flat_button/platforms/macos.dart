import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/property.dart';
import '../../../../core/common/platform_ruining.dart';

class FlatButtonMacos extends StatelessWidget {
  const FlatButtonMacos({
    super.key,
    this.color,
    this.property,
    this.disabledColor,
    this.onLongPress,
    this.onPressed,
    required this.child,
  });

  /// customize the appearance of the button on macOS.
  final FlatButtonMacosProperty? property;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The color of the button's background.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  ///
  /// Ignored if the [PushButton] doesn't also have a [color].
  ///
  /// Defaults to [CupertinoColors.quaternarySystemFill] when [color] is
  /// specified. Must not be null.
  final Color? disabledColor;

  /// if [onPressed] or [onLongPress] callback is not null.
  ///
  /// This getter is used to determine whether the button should respond to user interactions.
  bool get enabled => onPressed != null || onLongPress != null;

  /// Returns true if the current platform is not macOS.
  ///
  /// This getter is used to conditionally apply a foreground decoration
  /// to the button's container when the platform is not macOS.
  ///
  /// Note: This is particularly useful during testing on a non-Mac device
  /// to provide a near-realistic experience.
  bool get isNotRunningOnMacOS => PlatformRuining.isFakeMacos;

  /// Calculates and returns the appropriate BorderRadius based on the control size.
  ///
  /// The BorderRadius is determined by the control size specified in the [property].
  /// If no control size is provided, the default is set to [ControlSize.large].
  ///
  /// The returned BorderRadius is used for styling the button's background.
  BorderRadiusGeometry? get borderRadius => property?.controlSize.borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = MacosTheme.of(context);

    final activeColor = color ?? theme.primaryColor;
    final inActiveColor = disabledColor ?? CupertinoColors.quaternarySystemFill;

    final backgroundColor = enabled ? activeColor : inActiveColor;

    return GestureDetector(
      onLongPress: enabled ? onLongPress : null,
      child: Container(
        foregroundDecoration: isNotRunningOnMacOS &&
                ((color != null && enabled) || disabledColor != null)
            ? BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
                backgroundBlendMode: BlendMode.color,
              )
            : null,
        child: PushButton(
          borderRadius: borderRadius,
          onPressed: enabled ? (onPressed ?? () {}) : null,
          controlSize: property?.controlSize ?? ControlSize.large,
          alignment: property?.alignment ?? Alignment.center,
          semanticLabel: property?.semanticLabel,
          secondary: property?.secondary,
          disabledColor: inActiveColor,
          color: activeColor,
          pressedOpacity: property?.pressedOpacity ?? 0.4,
          child: DefaultTextStyle(style: theme.typography.body, child: child),
        ),
      ),
    );
  }
}

class FlatButtonMacosProperty extends CoreMacosProperty {
  const FlatButtonMacosProperty({
    this.controlSize = ControlSize.large,
    this.alignment = Alignment.center,
    this.pressedOpacity = 0.4,
    this.secondary = false,
    this.semanticLabel,
  });

  /// The size of the button.
  ///
  /// Defaults to [ControlSize.large].
  final ControlSize controlSize;

  /// The opacity that the button will fade to when it is pressed.
  /// The button will have an opacity of 1.0 when it is not pressed.
  ///
  /// This defaults to 0.4. If null, opacity will not change on pressed if using
  /// your own custom effects is desired.
  final double pressedOpacity;

  /// The alignment of the button's [title].
  ///
  /// Typically buttons are sized to be just big enough to contain the child and its
  /// [padding]. If the button's size is constrained to a fixed size, for example by
  /// enclosing it with a [SizedBox], this property defines how the child is aligned
  /// within the available space.
  ///
  /// Always defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// Whether the button is used as a secondary action button (e.g. Cancel buttons in dialogs)
  ///
  /// Sets its background color to [PushButtonThemeData]'s [secondaryColor] attributes (defaults
  /// are gray colors). Can still be overridden if the [activeTrackColor] attribute is non-null.
  final bool secondary;
}
