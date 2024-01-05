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

  /// The title of the dialog. Usually, a [Text] widget.
  final Widget? title;

  /// The content of the dialog. Usually, a [Text] widget.
  final Widget? content;

  /// The secondary action button in the dialog.
  final Widget? secondary;

  /// The primary action button in the dialog.
  final Widget primary;

  /// Additional properties for configuring the Windows dialog.
  final DialogWindowsProperty? property;

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
