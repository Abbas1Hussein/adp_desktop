// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../core/common/construct/model.dart';
//
// class AdaptivePageRoute extends PageRoute {
//   AdaptivePageRoute({
//     super.allowSnapshotting,
//     super.barrierDismissible,
//     super.fullscreenDialog,
//     super.settings,
//   });
//
//
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     // TODO: implement buildPage
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement barrierColor
//   Color? get barrierColor => throw UnimplementedError();
//
//   @override
//   // TODO: implement barrierLabel
//   String? get barrierLabel => throw UnimplementedError();
//
//   @override
//   // TODO: implement transitionDuration
//   Duration get transitionDuration => throw UnimplementedError();
//
//   @override
//   // TODO: implement maintainState
//   bool get maintainState => throw UnimplementedError();
// }
//
// mixin _AdaptivePageRoute
//     implements CoreModel<FluentPageRoute, CupertinoPageRoute> {
//   /// Builds the primary contents of the route.
//   late WidgetBuilder builder;
//
//   /// Whether this page route is a full-screen dialog.
//   late bool fullscreenDialog;
//
//   late bool maintainState;
//
//   late RouteSettings settings;
//
//   @override
//   CupertinoPageRoute toMacos(BuildContext context) {
//     return CupertinoPageRoute(
//       builder: builder,
//       settings: settings,
//       maintainState: maintainState,
//       fullscreenDialog: fullscreenDialog,
//     );
//   }
//
//   @override
//   FluentPageRoute toWindows(BuildContext context) {
//     return FluentPageRoute(
//       builder: builder,
//       settings: settings,
//       maintainState: maintainState,
//       fullscreenDialog: fullscreenDialog,
//     );
//   }
// }
// class _WindowsSheetRoute<T> extends PopupRoute<T> {
//   _WindowsSheetRoute({
//     required RoutePageBuilder pageBuilder,
//     bool barrierDismissible = true,
//     Color? barrierColor,
//     String? barrierLabel,
//     super.settings,
//   })  : _pageBuilder = pageBuilder,
//         _barrierDismissible = barrierDismissible,
//         _barrierLabel = barrierLabel,
//         _barrierColor = barrierColor;
//
//   final RoutePageBuilder _pageBuilder;
//
//   @override
//   bool get barrierDismissible => _barrierDismissible;
//   final bool _barrierDismissible;
//
//   @override
//   String? get barrierLabel => _barrierLabel;
//   final String? _barrierLabel;
//
//   @override
//   Color? get barrierColor => _barrierColor;
//   final Color? _barrierColor;
//
//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 250);
//
//   @override
//   Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
//
//   @override
//   Widget buildPage(
//       BuildContext context,
//       Animation<double> animation,
//       Animation<double> secondaryAnimation,
//       ) {
//     return Semantics(
//       scopesRoute: true,
//       explicitChildNodes: true,
//       child: _pageBuilder(context, animation, secondaryAnimation),
//     );
//   }
//
//   @override
//   Widget buildTransitions(
//       BuildContext context,
//       Animation<double> animation,
//       Animation<double> secondaryAnimation,
//       Widget child,
//       ) {
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: const Offset(0.0, 1.0),
//         end: Offset.zero,
//       ).animate(animation),
//       child: child,
//     );
//   }
// }

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';



// class AdaptivePageRoute extends PageRoute {
//   @override
//   // TODO: implement barrierColor
//   Color? get barrierColor => throw UnimplementedError();
//
//   @override
//   // TODO: implement barrierLabel
//   String? get barrierLabel => throw UnimplementedError();
//
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//     // TODO: implement buildPage
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement maintainState
//   bool get maintainState => throw UnimplementedError();
//
//   @override
//   // TODO: implement transitionDuration
//   Duration get transitionDuration => throw UnimplementedError();
// }