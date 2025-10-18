import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosDialogPicker {
  const MacosDialogPicker(
    this.context,
    this.localizations, {
    required this.picker,
  });

  final Widget picker;
  final BuildContext context;
  final MaterialLocalizations localizations;

  Future<bool?> showMacosDatePicker(
    bool showIcon,
    bool showTitle,
    bool horizontalActions,
    bool isDismissible,
  ) async {
    final size = MediaQuery.sizeOf(context);
    return await showMacosAlertDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: isDismissible,
      builder: (context) {
        return MacosAlertDialog(
          appIcon: showIcon
              ? const MacosIcon(CupertinoIcons.calendar, size: 64.0)
              : const SizedBox.shrink(),
          title: showTitle
              ? Text(
                  localizations.datePickerHelpText,
                  style: MacosTheme.of(context).typography.largeTitle,
                )
              : const SizedBox.shrink(),
          message: SizedBox(
            height: size.height * 0.4,
            width: size.width,
            child: picker,
          ),
          horizontalActions: horizontalActions,
          primaryButton: _buildCancelPickerButton(),
          secondaryButton: _buildOkPickerButton(),
        );
      },
    );
  }

  Future<bool?> showMacosTimePicker(
    bool horizontalActions,
    bool isDismissible,
  ) async {
    final size = MediaQuery.sizeOf(context);
    return await showMacosAlertDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: isDismissible,
      builder: (context) => MacosAlertDialog(
        horizontalActions: horizontalActions,
        appIcon: const SizedBox.shrink(),
        title: const SizedBox.shrink(),
        message: SizedBox(
          width: size.width,
          height: size.height * 0.4,
          child: picker,
        ),
        primaryButton: _buildCancelPickerButton(),
        secondaryButton: _buildOkPickerButton(),
      ),
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
      secondary: true,
      onPressed: _onCancelClick,
      controlSize: ControlSize.large,
      mouseCursor: SystemMouseCursors.click,
      semanticLabel: localizations.cancelButtonLabel,
      child: Text(localizations.cancelButtonLabel),
    );
  }

  void _onOkClick() => Navigator.pop(context, true);

  void _onCancelClick() => Navigator.pop(context, false);
}
