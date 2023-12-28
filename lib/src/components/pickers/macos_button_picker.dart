import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'date_picker_formatter.dart';

const kPickerButtonConstraints = BoxConstraints(
  maxHeight: 40.0,
  maxWidth: 250.0,
);

const kVerticalDivider = Padding(
  padding: EdgeInsets.symmetric(vertical: 10.5),
  child: VerticalDivider(
    color: CupertinoColors.quaternarySystemFill,
    thickness: 2.0,
  ),
);

const kCupertinoActionStyle = TextStyle(
  fontFamily: '.SF UI Text',
  inherit: false,
  fontSize: 15.8,
  fontWeight: MacosFontWeight.w590,
  color: MacosColors.systemBlueColor,
  textBaseline: TextBaseline.alphabetic,
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
    return ConstrainedBox(
      constraints: kPickerButtonConstraints,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          platformBrightness: MacosTheme.brightnessOf(context),
        ),
        child: CupertinoContextMenuAction(
          onPressed: onPressed,
          child: DefaultTextStyle(
            style: kCupertinoActionStyle,
            child: child(context),
          ),
        ),
      ),
    );
  }

  Widget child(BuildContext context);
}
