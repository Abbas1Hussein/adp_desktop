import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../properties/properties.dart';
import 'platforms/platforms.dart';

class AdaptiveTextField extends CoreAdaptiveComponent<FieldWindowsProperty, FieldMacosProperty> {
  final AdaptiveFieldProperties? adaptiveFieldProperties;

  const AdaptiveTextField({
    super.key,
    super.builders,
    super.properties,
    this.adaptiveFieldProperties,
  });


  @override
  Widget macos(BuildContext context) {
    return TextFieldMacos(
      property: properties?.macos,
      adaptiveProperties: adaptiveFieldProperties,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return TextFieldWindows(
      property: properties?.windows,
      adaptiveProperties: adaptiveFieldProperties,
    );
  }
}
