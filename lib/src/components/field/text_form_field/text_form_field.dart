// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../core/common/construct/component.dart';
// import '../properties/properties.dart';
// import 'platforms/platforms.dart';
//
// class AdaptiveTextFormField extends CoreAdaptiveComponent{
//   final AdaptiveFormFieldProperties? adaptiveFormFieldProperties;
//
//   const AdaptiveTextFormField({
//     super.key,
//     super.builders,
//     super.properties,
//     this.adaptiveFormFieldProperties,
//   });
//
//   @override
//   Widget macos(BuildContext context) {
//     return TextFormFieldMacos(
//       property: properties?.macos,
//       adaptiveProperties: adaptiveFormFieldProperties,
//     );
//   }
//
//   @override
//   Widget windows(BuildContext context) {
//     return TextFormFieldWindows(
//       property: properties?.windows,
//       adaptiveProperties: adaptiveFormFieldProperties,
//     );
//   }
// }
