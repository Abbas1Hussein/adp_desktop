import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/common/construct/properties.dart';
import '../../../../core/common/platform_ruining.dart';
import '../../../../core/extension/time.dart';
import '../../macos_button_picker.dart';
import '../../macos_dialog_picker.dart';

/// available modes for MacosTimePicker
enum MacosTimePickerMode {
  /// Displayed MacosTimePicker with Macos Dialog.
  macOS,

  /// Displayed CupertinoTimerPicker with Macos Dialog.
  cupertino,

  /// Displayed CupertinoTimerPicker as a button.
  cupertinoButton,
}

class TimePickerMacosButton extends MacosPickerButton {
  const TimePickerMacosButton({
    super.key,
    required super.onPressed,
    required super.initialDate,
    required super.localizations,
  });

  @override
  Widget child(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildTimeComponent('${timeOfDay.hourOfPeriod}', 'h'),
        verticalDivider(context),
        buildTimeComponent('${timeOfDay.minute}', 'm'),
        verticalDivider(context),
        Text(amPm),
      ],
    );
  }

  Widget buildTimeComponent(String value, String unit) {
    return Row(
      children: [
        Text(value),
        const SizedBox(width: 2.0),
        Baseline(
          baseline: 25,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            unit,
            style: const TextStyle(fontSize: 13.0),
          ),
        ),
      ],
    );
  }
}

class TimePickerMacos extends StatefulWidget {
  const TimePickerMacos({
    super.key,
    this.property,
    this.onCancel,
    this.onTimeChanged,
    required this.initialTime,
  });

  final TimeOfDay? initialTime;
  final VoidCallback? onCancel;

  final TimePickerMacosProperty? property;
  final ValueChanged<TimeOfDay>? onTimeChanged;

  @override
  State<TimePickerMacos> createState() => _TimePickerMacosState();
}

class _TimePickerMacosState extends State<TimePickerMacos> {
  late TimeOfDay selectedDate;
  late TimeOfDay lastSelectedDate;

  late MaterialLocalizations localizations;

  @override
  void initState() {
    selectedDate = widget.initialTime ?? TimeOfDay.now();
    lastSelectedDate = widget.initialTime ?? TimeOfDay.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = MaterialLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.property?.mode == MacosTimePickerMode.cupertinoButton) {
      return ConstrainedBox(
        constraints: kPickerButtonConstraints,
        child: _buildCupertinoTimePicker(),
      );
    }

    return TimePickerMacosButton(
      localizations: localizations,
      initialDate: selectedDate.toDateTime(),
      onPressed: _showMacosTimePicker,
    );
  }

  Widget _buildMacosTimePicker() {
    return FittedBox(
      fit: BoxFit.contain,
      child: MacosTimePicker(
        initialTime: selectedDate,
        style: PlatformRuining.isFakeMacos
            ? TimePickerStyle.combined
            : TimePickerStyle.graphical,
        onTimeChanged: (time) => _onDateTimeChanged(time),
      ),
    );
  }

  Widget _buildCupertinoTimePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      itemExtent: kPickerButtonConstraints.maxHeight,
      initialTimerDuration: selectedDate.convertTimeOfDayToDuration(),
      onTimerDurationChanged: (value) {
        _onDateTimeChanged(value.convertDurationToTimeOfDay());
        if (widget.property?.mode == MacosTimePickerMode.cupertinoButton) {
          widget.onTimeChanged?.call(selectedDate);
        }
      },
    );
  }

  Future<void> _showMacosTimePicker() async {
    final showIcon = widget.property?.showIcon ?? true;
    final showTitle = widget.property?.showTitle ?? true;
    final isHorizontal = widget.property?.horizontalActions ?? true;
    final isDismissible = widget.property?.isDismissible ?? true;

    final isCupertino = widget.property?.mode == MacosTimePickerMode.cupertino;
    final result = await MacosDialogPicker(
      context,
      localizations,
      picker:
          isCupertino ? _buildCupertinoTimePicker() : _buildMacosTimePicker(),
    ).showMacosTimePicker(
      isCupertino,
      showIcon,
      showTitle,
      isHorizontal,
      isDismissible,
    );

    if (result != null && result) {
      _handleOkClick();
    } else {
      _handleCancelClick();
    }
  }

  void _handleCancelClick() {
    _onDateTimeChanged(lastSelectedDate);
    widget.onCancel?.call();
  }

  void _handleOkClick() {
    setState(() {
      lastSelectedDate = selectedDate;
    });
    widget.onTimeChanged?.call(selectedDate);
  }

  void _onDateTimeChanged(TimeOfDay timeOfDay) {
    setState(() {
      selectedDate = timeOfDay;
    });
  }
}

class TimePickerMacosProperty extends CoreMacosProperty {
  const TimePickerMacosProperty({
    this.showIcon = true,
    this.showTitle = true,
    this.isDismissible = true,
    this.horizontalActions = true,
    this.mode = MacosTimePickerMode.macOS,
  });

  /// Represents the display mode of the MacosTimePicker.
  ///
  /// Use [MacosTimePickerMode] to specify the desired appearance and behavior
  /// of the MacosTimePicker.
  ///
  /// Defaults to [MacosTimePickerMode.macOS].
  final MacosTimePickerMode mode;

  /// Determines whether to lay out [primaryButton] and [secondaryButton]
  /// horizontally or vertically.
  ///
  /// Defaults to `true`.
  final bool horizontalActions;

  /// Whether to display the icon in [MacosTimePickerMode.cupertino].
  ///
  /// When set to true, an icon will be shown in the Cupertino-style time picker.
  /// Defaults to `true`.
  final bool showIcon;

  /// Whether to display the title in [MacosTimePickerMode.cupertino].
  ///
  /// When set to true, the title will be shown in the Cupertino-style time picker.
  /// Defaults to `true`.
  final bool showTitle;

  /// Determines whether the MacosTimePicker can be dismissed by tapping outside of it.
  ///
  /// If set to true, the MacosTimePicker can be dismissed by tapping outside its bounds.
  /// If set to false, the MacosTimePicker will remain open until a selection is made or the cancel action is triggered.
  /// Defaults to true.
  final bool isDismissible;
}
