import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../../../../buttons/flat_button/flat_button.dart';
import '../../../../buttons/properties/macos.dart';

class DialogMacos extends StatelessWidget {
  final DialogMacosProperty? property;

  final Widget? title;
  final Widget? content;

  final AdaptiveFlatButton? secondary;
  final AdaptiveFlatButton? primary;

  const DialogMacos({
    super.key,
    this.title,
    this.content,
    this.property,
    required this.secondary,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return MacosAlertDialog(
      appIcon: property?.appIcon ?? empty,
      horizontalActions: property?.horizontalActions ?? true,
      suppress: property?.suppress,
      title: title ?? empty,
      message: content ?? empty,
      secondaryButton: secondary?._pushButton ??
          PushButton(controlSize: ControlSize.large, child: empty),
      primaryButton: primary?._pushButton ??
          PushButton(controlSize: ControlSize.large, child: empty),
    );
  }

  Widget get empty => const SizedBox.shrink();
}

class DialogMacosProperty extends CoreMacosProperty {
  /// This should be your application's icon.
  ///
  /// The size of this widget should be 64x64.
  final Widget? appIcon;

  /// Determines whether to lay out [primaryButton] and [secondaryButton]
  /// horizontally or vertically.
  ///
  /// Defaults to `true`.
  final bool? horizontalActions;

  /// A widget to allow users to suppress alerts of this type.
  ///
  /// The logic for this should be user-implemented. Here is a sample of a
  /// widget that can be passed in for this parameter:
  /// ```dart
  /// class DoNotNotifyRow extends StatefulWidget {
  ///   const DoNotNotifyRow({Key? key}) : super(key: key);
  ///
  ///   @override
  ///   _DoNotNotifyRowState createState() => _DoNotNotifyRowState();
  /// }
  ///
  /// class _DoNotNotifyRowState extends State<DoNotNotifyRow> {
  ///   bool suppress = false;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Row(
  ///       mainAxisAlignment: MainAxisAlignment.center,
  ///       children: [
  ///         MacosCheckbox(
  ///  value: suppress,
  ///  onChanged: (value) {
  ///    setState(() => suppress = value);
  ///  },
  ///         ),
  ///         const SizedBox(width: 8),
  ///         Text('Don\'t ask again'),
  ///       ],
  ///     );
  ///   }
  /// }
  /// ```
  ///
  /// Notable, the above widget is a `StatefulWidget`. Your widget must be
  /// stateful or your checkbox will not update as you expect.
  final Widget? suppress;

  const DialogMacosProperty({
    this.appIcon,
    this.horizontalActions,
    this.suppress,
  });
}

extension _AdaptiveFlatButtonEx on AdaptiveFlatButton {
  PushButton get _pushButton {
    final ButtonMacosProperty? property = properties?.macos;
    return PushButton(
      alignment: property?.alignment ?? Alignment.center,
      pressedOpacity: property?.pressedOpacity ?? 0.6,
      semanticLabel: property?.semanticLabel,
      borderRadius: property?.borderRadius,
      controlSize: ControlSize.large,
      secondary: property?.secondary,
      disabledColor: disabledColor,
      padding: property?.padding,
      onPressed: onPressed,
      color: color,
      child: child,
    );
  }
}
