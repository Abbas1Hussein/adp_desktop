import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/extension/widget.dart';

class CustomMacosCheckbox extends MacosCheckbox {
  const CustomMacosCheckbox({
    super.key,
    this.label,
    this.icon,
    this.foregroundColor,
    this.checkedIconColor,
    this.uncheckedIconColor,
    this.thirdstateIconColor,
    this.checkedDecoration,
    this.uncheckedDecoration,
    this.thirdstateDecoration,
    super.semanticLabel,
    required super.value,
    required super.onChanged,
  });

  final IconData? icon;

  final Color? foregroundColor;

  final Color? checkedIconColor;
  final Color? uncheckedIconColor;
  final Color? thirdstateIconColor;

  final Decoration? checkedDecoration;
  final Decoration? uncheckedDecoration;
  final Decoration? thirdstateDecoration;
  final Widget? label;

  bool get isTrueValue => value == true;

  /// the color of the checkbox icon based on its state.
  ///
  /// If the checkbox is in a mixed state, [thirdstateIconColor] is used.
  /// If the checkbox value is true, [checkedIconColor] is used.
  /// If the checkbox value is false, [uncheckedIconColor] is used.
  Color? get iconColor => isMixed
      ? thirdstateIconColor
      : isTrueValue
          ? checkedIconColor
          : uncheckedIconColor;

  @override
  Widget build(BuildContext context) {
    final MacosThemeData theme = MacosTheme.of(context);

    final isLight = !theme.brightness.isDark;

    final buildLabel = label != null
        ? GestureDetector(
            onTap: () => onChanged?.call(!isTrueValue),
            child: MacosIconTheme(
              data: theme.iconTheme.copyWith(
                color: foregroundColor,
              ),
              child: DefaultTextStyle(
                style: theme.typography.body.copyWith(
                  color: foregroundColor,
                  fontWeight: MacosFontWeight.w300,
                  fontSize: 14.0,
                ),
                child: label!,
              ),
            ),
          )
        : null;

    final defaultCheckedDecoration = _checkedDecorationBuild(theme, context);

    final defaultUnCheckedDecoration = _unCheckedDecorationBuild(isLight);

    const size = 18.0;
    return Semantics(
      checked: isTrueValue,
      label: semanticLabel,
      child: SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: isMixed
              ? (thirdstateDecoration ?? defaultCheckedDecoration)
              : (isTrueValue
                  ? checkedDecoration ?? defaultCheckedDecoration
                  : uncheckedDecoration ?? defaultUnCheckedDecoration),
          child: MacosIconButton(
            pressedOpacity: 0.8,
            padding: EdgeInsets.zero,
            hoverColor: Colors.transparent,
            onPressed: () => onChanged?.call(!isTrueValue),
            icon: MacosIcon(
              isMixed
                  ? CupertinoIcons.minus
                  : ((isTrueValue || uncheckedIconColor != null)
                      ? icon ?? CupertinoIcons.check_mark
                      : null),
              color: iconColor ?? CupertinoColors.white,
              size: size - 3,
            ),
          ),
        ),
      ).margeWith(buildLabel, 8.0).applyDisabledEffect(isDisabled),
    );
  }

  BoxDecoration _checkedDecorationBuild(
    MacosThemeData theme,
    BuildContext context,
  ) {
    return BoxDecoration(
      color: MacosDynamicColor.resolve(
        isDisabled ? disabledColor : activeColor ?? theme.primaryColor,
        context,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
  }

  Decoration _unCheckedDecorationBuild(bool isLight) {
    return isLight
        ? ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.0, -1.0),
              end: const Alignment(0, 0),
              colors: [
                CupertinoColors.white.withValues(alpha: 0.85),
                CupertinoColors.white.withValues(alpha: 1.0),
              ],
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 1,
                blurStyle: BlurStyle.inner,
                offset: Offset(0, 0),
                spreadRadius: 0.0,
              ),
            ],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.25,
                color: CupertinoColors.black
                    .withValues(alpha: 0.35000000596046448),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(3.5)),
            ),
          )
        : ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.0, -1.0),
              end: const Alignment(0, 1),
              colors: [
                CupertinoColors.white.withValues(alpha: 0.14000000059604645),
                CupertinoColors.white.withValues(alpha: 0.2800000011920929),
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 1,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          );
  }
}
