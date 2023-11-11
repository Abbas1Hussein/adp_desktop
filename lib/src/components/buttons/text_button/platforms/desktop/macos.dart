import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';

class TextButtonMacos extends StatelessWidget {
  const TextButtonMacos({
    super.key,
    this.property,
    this.onPressed,
    this.onLongPress,
    this.disabledColor,
    this.color,
    required this.child,
  });

  /// customize the appearance of the TextButton on macOS.
  final TextButtonMacosProperty? property;

  /// The color of the TextButton.
  ///
  /// If null, the default platform-specific color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  ///
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// Callback triggered when the user tapped.
  final VoidCallback? onPressed;

  /// Callback triggered when the user performs a long press.
  final VoidCallback? onLongPress;

  /// The child widget that will be displayed within the TextButtonMacos.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoTextButton(
      color: color,
      onPressed: onPressed,
      onLongPress: onLongPress,
      disabledColor: disabledColor,
      pressedOpacity: property?.pressedOpacity ?? 0.4,
      isDestructiveAction: property?.isDestructiveAction ?? true,
      isDefaultAction: property?.isDefaultAction ?? false,
      minSize: property?.minSize ?? kMinInteractiveDimensionCupertino,
      child: child,
    );
  }
}

class TextButtonMacosProperty extends CoreMacosProperty {
  const TextButtonMacosProperty({
    this.pressedOpacity,
    this.isDefaultAction,
    this.isDestructiveAction,
    this.minSize,
  });

  /// The opacity that the button will fade to when it is pressed. The button will have an opacity of 1.0 when it is not pressed.
  ///  This defaults to 0.4. If null, opacity will not change on pressed if using your own custom effects is desired.
  final double? pressedOpacity;

  /// Indicates whether this action should receive the style of an emphasized,
  /// default to 'false'.
  final bool? isDefaultAction;

  /// Indicates whether this action should receive the style of a destructive
  /// default to 'true'.
  final bool? isDestructiveAction;

  /// Minimum size of the button.
  ///
  /// Defaults to [kMinInteractiveDimensionCupertino] which the iOS Human
  /// Interface Guidelines recommends as the minimum tappable area.
  final double? minSize;
}

class CustomCupertinoTextButton extends StatefulWidget {
  const CustomCupertinoTextButton({
    super.key,
    this.color,
    this.disabledColor,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.pressedOpacity = 0.4,
    this.onPressed,
    this.onLongPress,
    required this.child,
  }) : assert(pressedOpacity == null ||
            (pressedOpacity >= 0.0 && pressedOpacity <= 1.0));

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The callback that is called when the button is Long-Press or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onLongPress;

  /// Minimum size of the button.
  ///
  /// Defaults to kMinInteractiveDimensionCupertino which the iOS Human
  /// Interface Guidelines recommends as the minimum tappable area.
  final double minSize;

  /// The opacity that the button will fade to when it is pressed.
  /// The button will have an opacity of 1.0 when it is not pressed.
  ///
  /// This defaults to 0.4. If null, opacity will not change on pressed if using
  /// your own custom effects is desired.
  final double? pressedOpacity;

  /// Whether this action is the default choice in the TextButton.
  ///
  /// Default buttons have bold text.
  final bool isDefaultAction;

  /// Whether this action might change data.
  ///
  /// Destructive buttons have [CupertinoColors.activeBlue] color text.
  final bool isDestructiveAction;

  /// The background color of the button. If null, the default platform-specific
  /// background color will be used.
  final Color? color;

  /// The color to be used when the button is in a disabled state.
  /// If null, the default disabled color for the respective platform will be used.
  final Color? disabledColor;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null || onLongPress != null;

  @override
  State<CustomCupertinoTextButton> createState() =>
      _CustomCupertinoTextButtonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'));
  }
}

class _CustomCupertinoTextButtonState extends State<CustomCupertinoTextButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);

  static const TextStyle _kTextButtonStyle = TextStyle(
    fontFamily: '.SF UI Text',
    inherit: false,
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.alphabetic,
  );

  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(CustomCupertinoTextButton old) {
    super.didUpdateWidget(old);
    _handleDisabledColor();

    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _updateButtonState(bool value) {
    _buttonHeldDown = value;
    _animate();
  }

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) _updateButtonState(true);
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) _updateButtonState(false);
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) _updateButtonState(false);
  }

  void _handleDisabledColor() {
    if (!widget.enabled) _updateButtonState(true);
    _updateButtonState(false);
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;

    final color = widget.color ?? CupertinoColors.activeBlue;

    TextStyle style = _kTextButtonStyle.copyWith(
      backgroundColor: !enabled
          ? widget.disabledColor?.withOpacity(_opacityAnimation.value)
          : null,
      color: widget.isDestructiveAction
          ? CupertinoDynamicColor.resolve(color, context)
          : MacosTheme.of(context).primaryColor,
    );

    if (widget.isDefaultAction) {
      style = style.copyWith(fontWeight: FontWeight.bold);
    }

    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: enabled ? widget.onPressed : null,
        onLongPress: enabled ? widget.onLongPress : null,
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: widget.minSize,
              minHeight: widget.minSize,
            ),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DefaultTextStyle(
                style: style,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
