import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class BottomSheetMacos extends StatelessWidget {
  const BottomSheetMacos({
    super.key,
    this.insetPadding,
    this.backgroundColor,
    this.insetAnimationCurve,
    this.insetAnimationDuration,
    required this.child,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  final EdgeInsets? insetPadding;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  final Duration? insetAnimationDuration;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  final Curve? insetAnimationCurve;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final defaultInsetPadding = EdgeInsets.fromLTRB(
      8.0,
      MediaQuery.sizeOf(context).height * 0.5,
      8.0,
      8.0,
    );

    final EdgeInsets effectivePadding = MediaQuery.of(context).viewInsets +
        (insetPadding ?? defaultInsetPadding);

    return MacosSheet(
      backgroundColor: backgroundColor,
      insetAnimationCurve: insetAnimationCurve ?? Curves.decelerate,
      insetAnimationDuration:
          insetAnimationDuration ?? const Duration(milliseconds: 100),
      insetPadding: effectivePadding,
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
