import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'date_picker_formatter.dart';

const kPickerButtonConstraints = BoxConstraints(maxHeight: 65.0, maxWidth: 250.0);

const kVerticalDivider = Padding(
  padding: EdgeInsets.symmetric(vertical: 10.5),
  child: VerticalDivider(color: CupertinoColors.quaternarySystemFill),
);

const _kCupertinoDialogActionStyle = TextStyle(
  fontFamily: '.SF UI Text',
  inherit: false,
  fontSize: 15.8,
  fontWeight: FontWeight.w500,
  color: MacosColors.systemBlueColor,
  textBaseline: TextBaseline.alphabetic,
);

abstract class MacosPickerButton extends BaseDateFormatter {
  final VoidCallback onPressed;

  const MacosPickerButton({
    super.key,
    required this.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: CupertinoPopupSurface(
        child: CupertinoContextMenuAction(
          onPressed: onPressed,
          child: DefaultTextStyle(
            style: _kCupertinoDialogActionStyle,
            child: child(context),
          ),
        ),
      ),
    );
  }

  Widget child(BuildContext context);
}
