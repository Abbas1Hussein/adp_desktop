// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:macos_ui/macos_ui.dart';
//
// import '../common/adaptive.dart';
//
// extension ColorEx on Color {
//   Color resolveFrom(BuildContext context) {
//     return adaptiveValue<Color>(
//       macos: ()
//     {
//       return CupertinoDynamicColor.resolve(this!, context);
//     }        return CupertinoColors.quaternarySystemFill;
//       },
//     );
//   }
//
//   Color resolve(
//     BuildContext context, {
//     required Color color,
//     required Color darkColor,
//   }) {
//     return adaptiveValue<Color>(
//       macos: () {
//         if (this != null) {
//           return CupertinoDynamicColor.resolve(this!, context);
//         }
//         return CupertinoColors.quaternarySystemFill;
//       },
//       windows: () {
//         if (Colors) ;
//       },
//     );
//   }
// }
