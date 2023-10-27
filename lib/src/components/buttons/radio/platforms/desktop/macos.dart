import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';

class RadioMacos<T> extends StatelessWidget {
  final RadioMacosProperty? property;

  /// Whether the button is checked or not
  final T value;

// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T? groupValue;

  /// Called when [value] changes. If null, the button will be
  /// considered disabled.
  final ValueChanged<T?>? onChanged;

  const RadioMacos({
    super.key,
    this.property,
    this.onChanged,
    this.groupValue,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return MacosRadioButton(
      value: value,
      onChanged: onChanged,
      groupValue: groupValue,
      onColor: property?.onColor,
      size: property?.size ?? 16.0,
      innerColor: property?.innerColor,
      semanticLabel: property?.semanticLabel,
      offColor: property?.offColor ?? CupertinoColors.tertiaryLabel,
    );
  }
}

class RadioMacosProperty extends CoreMacosProperty {
  /// The size of the button. Defaults to 16px
  final double? size;

  /// The color of the border when [value] is true. If null,
  /// [MacosThemeData.primaryColor] is used
  final Color? onColor;

  /// The color of the border when [value] is false.
  /// [CupertinoColors.tertiaryLabel] is used by default
  final Color? offColor;

  /// The color in the middle. If null, the following colors are
  /// used when:
  ///
  ///   - Disabled: [CupertinoColors.quaternarySystemFill]
  ///   - On: [CupertinoColors.white]
  ///   - Off: [CupertinoColors.tertiarySystemFill]
  final Color? innerColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  RadioMacosProperty({
    this.size,
    this.onColor,
    this.offColor,
    this.innerColor,
    this.semanticLabel,
  });
}
