import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/properties.dart';

class DialogWindows extends StatelessWidget {
  final DialogWindowsProperty? property;

  /// The title of the dialog. Usually, a [Text] widget
  final Widget? title;

  /// The content of the dialog. Usually, a [Text] widget
  final Widget? content;

  final Widget secondary;
  final Widget primary;

  const DialogWindows({
    super.key,
    this.title,
    this.content,
    this.property,
    required this.secondary,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: title,
      content: content,
      style: property?.style,
      actions: [secondary, primary],
      constraints: property?.constraints ?? const BoxConstraints(maxWidth: 368),
    );
  }
}

class DialogWindowsProperty extends CoreWindowsProperty {
  /// The style used by this dialog. If non-null, it's merged with
  /// [FluentThemeData.dialogTheme]
  final ContentDialogThemeData? style;

  /// The constraints of the dialog. It defaults to `BoxConstraints(maxWidth: 368)`
  final BoxConstraints? constraints;

  const DialogWindowsProperty({this.style, this.constraints});
}
