import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';

class SwitchMacos extends StatelessWidget {
  final SwitchMacosProperty? property;

  /// Whether this switch is on or off.
  ///
  /// Must not be null.
  final bool value;

  /// Called when the user toggles with switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// If null, the switch will be displayed as disabled, which has a reduced opacity.
  ///
  /// The callback provided to onChanged should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// MacosSwitch(
  ///   value: _giveVerse,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _giveVerse = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  const SwitchMacos({
    super.key,
    this.property,
    this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return MacosSwitch(
      value: value,
      onChanged: onChanged,
      knobColor: property?.knobColor,
      trackColor: property?.trackColor,
      activeColor: property?.activeColor,
      semanticLabel: property?.semanticLabel,
      size: property?.size ?? ControlSize.regular,
      dragStartBehavior:
          property?.dragStartBehavior ?? DragStartBehavior.start,
    );
  }
}

class SwitchMacosProperty extends CoreMacosProperty {
  /// The size of the switch, which is [ControlSize.regular] by default.
  ///
  /// Allowable sizes are [ControlSize.mini], [ControlSize.small], and
  /// [ControlSize.regular]. If [ControlSize.large] is used, the switch will
  /// size itself as a [ControlSize.regular] switch.
  final ControlSize? size;

  /// {@macro flutter.cupertino.CupertinoSwitch.dragStartBehavior}
  final DragStartBehavior? dragStartBehavior;

  /// The color to use for the track when this switch is on.
  ///
  /// Defaults to [MacosThemeData.primaryColor] when null.
  final MacosColor? activeColor;

  /// The color to use for track when this switch is off.
  ///
  /// Defaults to [MacosTheme.primaryColor] when null.
  final MacosColor? trackColor;

  /// The color to use for the switch's knob.
  final MacosColor? knobColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  const SwitchMacosProperty({
    this.size,
    this.dragStartBehavior,
    this.activeColor,
    this.trackColor,
    this.knobColor,
    this.semanticLabel,
  });
}
