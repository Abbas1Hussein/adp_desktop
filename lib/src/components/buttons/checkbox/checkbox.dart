import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/extension/widget.dart';

class AdaptiveCheckbox extends CoreAdaptiveComponent {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? label;

  final Color? activeColor;
  final Color? inactiveColor;

  const AdaptiveCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.activeColor,
    this.mouseCursor,
    this.inactiveColor,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget macos(BuildContext context) {
    return Focus(
      autofocus: autofocus,
      focusNode: focusNode,
      child: MouseRegion(
        cursor: mouseCursor ?? SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: MacosCheckbox(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            disabledColor: inactiveColor ?? CupertinoColors.quaternaryLabel,
          ),
        ).margeWith(
          label != null ? GestureDetector(onTap: () => onChanged?.call(value), child: label!) : null,
        ),
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    return MouseRegion(
      cursor: mouseCursor ?? SystemMouseCursors.click,
      child: Checkbox(
        checked: value,
        style: CheckboxThemeData(
          checkedIconColor: activeColor != null ? ButtonState.all(activeColor) : null,
          uncheckedIconColor: inactiveColor != null ? ButtonState.all(inactiveColor) : null,
        ),
        onChanged: onChanged,
        focusNode: focusNode,
        autofocus: autofocus,
        content: label,
      ),
    );
  }
}
