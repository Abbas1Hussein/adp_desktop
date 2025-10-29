import 'package:fluent_ui/fluent_ui.dart';

import '../../../../core/common/construct/properties.dart';

class DialogWindows extends StatelessWidget {
  const DialogWindows({
    super.key,
    this.title,
    this.content,
    this.property,
    this.secondary,
    required this.primary,
  });
  final DialogWindowsProperty? property;

  final Widget? title;
  final Widget? content;

  final Widget primary;
  final Widget? secondary;

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: title,
      content: content,
      style: property?.style,
      actions: [secondary ?? const SizedBox.shrink(), primary],
      constraints: property?.constraints ?? kDefaultContentDialogConstraints,
    );
  }
}

class DialogWindowsProperty extends CoreWindowsProperty {
  const DialogWindowsProperty({
    this.style,
    this.constraints = kDefaultContentDialogConstraints,
  });

  /// The style used by this dialog.
  ///
  /// If non-null, it's merged with [FluentThemeData.dialogTheme].
  final ContentDialogThemeData? style;

  /// The constraints of the dialog.
  ///
  /// Defaults to [kDefaultContentDialogConstraints].
  final BoxConstraints constraints;
}
