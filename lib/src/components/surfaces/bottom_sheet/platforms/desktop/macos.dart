import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'windows.dart';

class BottomSheetMacos extends StatelessWidget {
  final BottomSheetMacosProperty? property;

  /// The widget below this widget in the tree.
  final Widget title;

  /// An optional content that provides more details about the
  /// reason for the alert.
  final Widget? content;

  const BottomSheetMacos({
    super.key,
    this.property,
    this.content,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final defaultInsetPadding = EdgeInsets.fromLTRB(
        8.0, MediaQuery.sizeOf(context).height * 0.5, 8.0, 8.0);

    final EdgeInsets effectivePadding = MediaQuery.of(context).viewInsets +
        (property?.insetPadding ?? defaultInsetPadding);

    return MacosSheet(
      insetPadding: effectivePadding,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: MacosTheme.of(context).typography.headline,
              child: title,
            ),
            const SizedBox(height: 8.0),
            if (content != null) content!,
          ],
        ),
      ),
    );
  }

}

class BottomSheetMacosProperty extends BottomSheetWindowsProperty {
  const BottomSheetMacosProperty({
    super.insetPadding,
    super.insetAnimationDuration,
    super.insetAnimationCurve,
    super.backgroundColor,
  });
}
