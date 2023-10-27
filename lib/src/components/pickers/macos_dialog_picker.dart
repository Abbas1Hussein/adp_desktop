import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosDialogPicker {
  final Widget picker;
  final BuildContext context;
  final VoidCallback? onOkClick;
  final VoidCallback? onCancelClick;
  final MaterialLocalizations localizations;

  const MacosDialogPicker(
    this.context,
    this.picker, {
    this.onOkClick,
    this.onCancelClick,
    required this.localizations,
  });

  void showMacosDatePicker() {
    final size = MediaQuery.sizeOf(context);
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return MacosAlertDialog(
          appIcon: const SizedBox.shrink(),
          title: Text(localizations.datePickerHelpText),
          message: SizedBox(
            width: size.height * 0.4,
            height: size.height * 0.4,
            child: picker,
          ),
          primaryButton: _buildCancelPickerButton(),
          secondaryButton: _buildOkPickerButton(),
        );
      },
      barrierDismissible: true,
    );
  }

  PushButton _buildOkPickerButton() {
    return PushButton(
      onPressed: _onOkClick,
      controlSize: ControlSize.large,
      mouseCursor: SystemMouseCursors.click,
      semanticLabel: localizations.okButtonLabel,
      child: Text(localizations.okButtonLabel),
    );
  }

  PushButton _buildCancelPickerButton() {
    return PushButton(
      onPressed: _onCancelClick,
      controlSize: ControlSize.large,
      mouseCursor: SystemMouseCursors.click,
      semanticLabel: localizations.cancelButtonLabel,
      child: Text(localizations.cancelButtonLabel),
    );
  }

  void _onOkClick() {
    onOkClick?.call();
    Navigator.pop(context);
  }

  void _onCancelClick() {
    onCancelClick?.call();
    Navigator.pop(context);
  }
}
