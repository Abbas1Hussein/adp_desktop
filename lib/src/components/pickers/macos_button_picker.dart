import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../buttons/button/macos.dart';
import '../surfaces/divider/divider.dart';
import 'date_picker_formatter.dart';

const kPickerButtonConstraints = BoxConstraints(
  maxHeight: 40.0,
  maxWidth: 295.0,
);

abstract class MacosPickerButton extends BaseDateFormatter {
  const MacosPickerButton({
    super.key,
    required this.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        CupertinoTheme.of(context).textTheme.pickerTextStyle.copyWith(
              color: MacosTheme.of(context).typography.body.color,
            );

    final Color? resolvedBackgroundColor = MacosDynamicColor.maybeResolve(null, context);
    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: MacosButton(
        onPressed: onPressed,
        backgroundColor: resolvedBackgroundColor,
        child: DefaultTextStyle(
            style: textStyle, maxLines: 1, child: child(context)),
      ),
    );
  }

  Widget child(BuildContext context);

  Widget verticalDivider(BuildContext context) {
    return const AdaptiveDivider(direction: Axis.vertical).macos(context);
  }
}
