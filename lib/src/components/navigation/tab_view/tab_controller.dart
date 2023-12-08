// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:macos_ui/macos_ui.dart';
//
// import '../../../core/common/adaptive.dart';
//
// class AdaptiveTabController extends ChangeNotifier {
//   MacosTabController? macosController;
//   ScrollPosController? windowsController;
//
//   int get initialIndex {
//     return adaptiveValue(
//       macos: () => macosController!.index,
//       windows: () => windowsController!.itemCount,
//     );
//   }
//
//   set initialIndex(int value) {
//     initialIndex = value;
//     notifyListeners();
//   }
//
//   @override
//   bool get hasListeners {
//     return adaptiveValue(
//       macos: () => macosController!.hasListeners,
//       windows: () => windowsController!.hasListeners,
//     );
//   }
//
//   @override
//   void addListener(VoidCallback listener) {
//     adaptiveValue(
//       macos: () {
//         macosController?.addListener(listener);
//       },
//       windows: () {
//         windowsController?.addListener(listener);
//       },
//     );
//   }
//
//   @override
//   void removeListener(VoidCallback listener) {
//     adaptiveValue(
//       macos: () {
//         macosController?.removeListener(listener);
//       },
//       windows: () {
//         windowsController?.removeListener(listener);
//       },
//     );
//   }
//
//   @override
//   void notifyListeners() {
//     adaptiveValue(
//       macos: () {
//         macosController?.notifyListeners();
//       },
//       windows: () {
//         windowsController?.notifyListeners();
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     adaptiveValue(
//       macos: () {
//         macosController?.dispose();
//       },
//       windows: () {
//         windowsController?.dispose();
//       },
//     );
//     super.dispose();
//   }
// }
