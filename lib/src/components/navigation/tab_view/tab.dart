import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../../core/extension/widget.dart';

const _kTabBorderRadius = BorderRadius.all(Radius.circular(4.0));

class AdaptiveTab extends CoreModel<Tab, MacosTab> {
  const AdaptiveTab({
    this.icon,
    required this.label,
  });

  /// The main content of the tab,
  ///
  /// typically an [Text].
  final Widget label;

  final Widget? icon;

  @override
  MacosTab toMacos(
    BuildContext context, {
    TextStyle? style,
    bool isActive = true,
    Color? selectedColor,
    Color? unSelectedColor,
    VoidCallback? onChanged,
    MacosIconThemeData? data,
    EdgeInsetsGeometry? padding,
    Axis? direction,
  }) {
    final labelStyled = style != null
        ? DefaultTextStyle.merge(style: style, child: label)
        : label;

    final iconStyled = data != null && icon != null
        ? MacosIconTheme.merge(data: data, child: icon!)
        : icon;

    return _MacosTab(
      active: isActive,
      padding: padding,
      onTap: onChanged,
      icon: iconStyled,
      text: labelStyled,
      direction: direction,
      selectedColor: selectedColor,
      unSelectedColor: unSelectedColor,
    );
  }

  @override
  Tab toWindows(
    BuildContext context, {
    bool isActive = false,
    IconThemeData? data,
    TextStyle? style,
    Widget? body,
  }) {
    final labelStyled = style != null
        ? DefaultTextStyle.merge(style: style, child: label)
        : label;

    final iconStyled = data != null && icon != null
        ? IconTheme.merge(data: data, child: icon!)
        : icon;

    return Tab(
      icon: iconStyled,
      text: labelStyled,
      disabled: isActive,
      body: body ?? const SizedBox.shrink(),
    );
  }
}

class _MacosTab extends MacosTab {
  const _MacosTab({
    this.onTap,
    this.icon,
    this.text,
    this.padding,
    this.selectedColor,
    this.unSelectedColor,
    this.direction,
    super.active,
  }) : super(label: '');

  final Axis? direction;

  final Widget? icon;
  final Widget? text;

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  final Color? selectedColor;
  final Color? unSelectedColor;

  @override
  Widget build(BuildContext context) {
    final brightness = MacosTheme.brightnessOf(context);

    final defaultDecorationColor = active
        ? brightness.resolve(MacosColors.white, const Color(0xFF646669))
        : MacosColors.transparent;

    final defaultPhysicalColor =
        active ? const Color(0xFF2B2E33) : MacosColors.transparent;

    final color = (active ? selectedColor : unSelectedColor);

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: PhysicalModel(
          color: color ?? defaultPhysicalColor,
          borderRadius: _kTabBorderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: _kTabBorderRadius,
              color: color ?? defaultDecorationColor,
            ),
            child: MacosIconTheme(
              data: MacosIconThemeData(
                size: 16.0,
                color: brightness.resolve(
                  const Color.fromRGBO(0, 0, 0, 0.5),
                  const Color.fromRGBO(255, 255, 255, 1),
                ),
                opacity: active ? 1.0 : 0.5,
              ),
              child: DefaultTextStyle(
                style: MacosTheme.of(context).typography.body.copyWith(
                      fontWeight: active
                          ? MacosFontWeight.w510
                          : MacosFontWeight.normal,
                    ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: direction == Axis.vertical && icon != null
                      ? icon!.margeWith(text, 2.0, Axis.vertical)
                      : text?.margeWith(icon),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  MacosTab copyWith({String? label, bool? active}) => this;
}
