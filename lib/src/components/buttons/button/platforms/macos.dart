import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/extension/widget.dart';

/// A macOS style button.
class MacosButton extends StatefulWidget {
  const MacosButton({
    super.key,
    this.border,
    this.onTapUp,
    this.onTapDown,
    this.onPressed,
    this.onLongPress,
    this.borderRadius,
    this.hoverColor,
    this.pressedColor,
    this.backgroundColor,
    this.disabledColor,
    this.padding,
    this.pressedOpacity = 0.4,
    this.mouseCursor = SystemMouseCursors.basic,
    required this.child,
  });

  final Widget child;
  final Color? hoverColor;
  final Color? pressedColor;
  final Color? backgroundColor;
  final Color? disabledColor;

  final double pressedOpacity;

  final EdgeInsetsGeometry? padding;

  /// The mouse cursor to use when hovering over this widget.
  final MouseCursor mouseCursor;

  /// A border to draw above the background [backgroundColor].
  ///
  /// Follows the [itemsShape] and [borderRadius].
  ///
  /// Use [Border] objects to describe borders that do not depend on the reading
  /// direction.
  ///
  /// Use [BoxBorder] objects to describe borders that should flip their left
  /// and right edges based on whether the text is being read left-to-right or
  /// right-to-left.
  final BoxBorder? border;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  ///
  /// Applies only to boxes with rectangular shapes; ignored if [itemsShape] is not
  /// [BoxShape.rectangle].
  ///
  /// {@macro flutter.painting.BoxDecoration.clip}
  final BorderRadiusGeometry? borderRadius;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback, [onLongPress], [onTapDown], and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is pressed.
  ///
  /// If this callback, [onLongPress], [onPressed] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onTapDown;

  /// Called when the button is released.
  ///
  /// If this callback, [onLongPress], [onPressed] and [onTapDown] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onTapUp;

  /// Called when the button is long-pressed.
  ///
  /// If this callback, [onPressed], [onTapDown] and [onTapUp] are null,
  /// then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled =>
      onPressed != null ||
      onLongPress != null ||
      onTapDown != null ||
      onTapUp != null;

  @override
  MacosButtonState createState() => MacosButtonState();
}

class MacosButtonState extends State<MacosButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);

  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  bool _isHovered = false;

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
  void didUpdateWidget(MacosButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setTween();
  }

  void _setTween() => _opacityTween.end = widget.pressedOpacity;

  @visibleForTesting
  bool buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!buttonHeldDown) {
      buttonHeldDown = true;
      _animate();
    }
    widget.onTapDown?.call();
  }

  void _handleTapUp(TapUpDetails event) {
    if (buttonHeldDown) {
      buttonHeldDown = false;
      _animate();
    }
    widget.onTapUp?.call();
  }

  void _handleTapCancel() {
    if (buttonHeldDown) {
      buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;

    final bool wasHeldDown = buttonHeldDown;

    final TickerFuture ticker = wasHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);

    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;

    final brightness = MacosTheme.of(context).brightness;

    final iconColor =
        brightness.resolve(CupertinoColors.black, CupertinoColors.white);

    final disableBackgroundColor =
        widget.disabledColor ?? CupertinoColors.quaternarySystemFill;

    final backgroundColor =
        widget.backgroundColor ?? CupertinoColors.quaternarySystemFill;

    final fillColor = enabled ? backgroundColor : disableBackgroundColor;

    final hoverColor = widget.hoverColor ??
        brightness.resolve(const Color(0xffE5E5E5), const Color(0xff3C383C));

    final pressedColor = widget.pressedColor ??
        brightness.resolve(const Color(0xe8eae6e6), const Color(0xe6383438));

    return MouseRegion(
      cursor: enabled ? widget.mouseCursor : SystemMouseCursors.forbidden,
      onEnter: (e) {
        if (enabled) setState(() => _isHovered = true);
      },
      onExit: (e) {
        if (enabled) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTap: widget.onPressed,
        onLongPress: widget.onLongPress,
        child: Semantics(
          button: true,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, _) {
                return MacosIconTheme(
                  data: MacosIconThemeData(color: iconColor, size: 18),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 25),
                    decoration: BoxDecoration(
                      border: widget.border,
                      color: buttonHeldDown
                          ? pressedColor
                          : (_isHovered ? hoverColor : fillColor),
                      borderRadius: widget.borderRadius ??
                          const BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 13.0,
                          ),
                      child: widget.child,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ).applyDisabledEffect(!enabled),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
