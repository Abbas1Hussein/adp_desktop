import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/model.dart';
import '../../../core/extension/widget.dart';

class AdaptiveTab extends CoreModel<Tab, MacosTab> {
  const AdaptiveTab({
    this.icon,
    required this.label,
  });

  final Widget label;
  final Widget? icon;

  @override
  MacosTab toMacos({
    bool isActive = true,
    VoidCallback? onChanged,
    Color? selectedColor,
    Color? unSelectedColor,
    EdgeInsetsGeometry? padding,
    Axis axis = Axis.horizontal,
  }) {
    return _MacosTab(
      axis: axis,
      icon: icon,
      text: label,
      padding: padding,
      active: isActive,
      selectedColor: selectedColor,
      unSelectedColor: unSelectedColor,
      onTap: () => onChanged?.call(),
    );
  }

  @override
  Tab toWindows({
    bool isActive = false,
    Widget? body,
  }) {
    return Tab(
      text: label,
      icon: icon,
      disabled: isActive,
      body: body ?? const SizedBox.shrink(),
    );
  }
}

const _kTabBorderRadius = BorderRadius.all(Radius.circular(4.0));

class _MacosTab extends MacosTab {
  const _MacosTab({
    this.onTap,
    this.icon,
    this.text,
    this.padding,
    this.selectedColor,
    this.unSelectedColor,
    this.axis = Axis.horizontal,
    super.active,
  }) : super(label: '');

  final Axis axis;

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
        onTap: () => onTap?.call(),
        child: PhysicalModel(
          color: color ?? defaultPhysicalColor,
          borderRadius: _kTabBorderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: _kTabBorderRadius,
              color: color ?? defaultDecorationColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: axis == Axis.vertical
                  ? icon?.margeWith(text, 2.0, axis)
                  : text?.margeWith(icon),
            ),
          ),
        ),
      ),
    );
  }

  @override
  MacosTab copyWith({String? label, bool? active}) => this;
}
