import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../../../../buttons/flat_button/flat_button.dart';

///  different dialog modes for macOS dialogs.
///
/// - `cupertino`: Represents a Cupertino-style dialog.
/// - `macOS`: Represents a macOS-style dialog.
enum MacosDialogMode { cupertino, macOS }

class DialogMacos extends StatelessWidget {
  const DialogMacos({
    super.key,
    this.title,
    this.message,
    this.property,
    this.secondary,
    required this.primary,
  });

  /// the title widget in the macOS dialog.
  final Widget? title;

  /// the message widget in the macOS dialog.
  final Widget? message;

  /// the secondary button in the macOS dialog.
  ///
  /// If [MacosDialogMode]:
  /// - `cupertino`: [CupertinoDialogAction] will be used.
  /// - `macOS`: [PushButton] will be used.
  final AdaptiveFlatButton? secondary;

  /// the primary button in the macOS dialog (required).
  ///
  /// If [MacosDialogMode]:
  /// - `cupertino`: [CupertinoDialogAction] will be used.
  /// - `macOS`: [PushButton] will be used.
  final AdaptiveFlatButton primary;

  /// additional properties for configuring the macOS dialog.
  final DialogMacosProperty? property;

  /// A constant SizedBox with a height of 8.0, used for vertical spacing.
  static const _spaceHeight = SizedBox(height: 8.0);

  /// A constant SizedBox that represents an empty widget, used when no content is present.
  static const _noneWidget = SizedBox.shrink();

  /// Determines whether the macOS dialog (title and icon) layout is vertical based on the axis property.
  bool get isVertical => property?.axis == Axis.vertical;

  bool get hasAppIcon => property?.appIcon != null;

  @override
  Widget build(BuildContext context) {
    final typography = MacosTheme.of(context).typography;

    final content = message != null
        ? DefaultTextStyle(
            textAlign: TextAlign.justify,
            style: typography.body,
            child: message!,
          )
        : null;

    switch (property?.dialogMode ?? MacosDialogMode.macOS) {
      case MacosDialogMode.cupertino:
        return _buildCupertinoDialog(isVertical, content, typography);
      case MacosDialogMode.macOS:
        return _buildMacOSDialog(isVertical, content, typography);
    }
  }

  Widget _buildCupertinoDialog(
    bool isVertical,
    Widget? content,
    MacosTypography typography,
  ) {
    return CupertinoAlertDialog(
      title: title != null
          ? Builder(
              builder: (context) {
                if (isVertical) {
                  return Column(
                    children: [
                      if (hasAppIcon) ...[property!.appIcon!, _spaceHeight],
                      title!,
                    ],
                  );
                } else if (hasAppIcon) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Flexible(child: title!), property!.appIcon!],
                  );
                }
                return title!;
              },
            )
          : null,
      content: Column(
        children: [
          if (title != null) _spaceHeight,
          if (content != null) content,
          if (property?.suppress != null) ...[_spaceHeight, property!.suppress!]
        ],
      ),
      actions: [
        primary._cupertinoDialogAction(typography.title3),
        if (secondary != null)
          secondary!._cupertinoDialogAction(typography.title3),
      ],
    );
  }

  Widget _buildMacOSDialog(
    bool isVertical,
    Widget? content,
    MacosTypography typography,
  ) {
    final titleWithStyled = title != null
        ? DefaultTextStyle(
            style: (typography.title1).copyWith(fontWeight: FontWeight.bold),
            child: title!,
          )
        : null;

    return MacosAlertDialog(
      suppress: property?.suppress,
      appIcon: isVertical && hasAppIcon ? property!.appIcon! : _noneWidget,
      title: title != null
          ? Builder(
              builder: (context) {
                if (isVertical) {
                  return titleWithStyled!;
                } else if (hasAppIcon) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [titleWithStyled!, property!.appIcon!],
                  );
                }
                return titleWithStyled!;
              },
            )
          : _noneWidget,
      message: content ?? _noneWidget,
      primaryButton: primary._pushButton,
      secondaryButton: secondary?._pushButton,
      horizontalActions: property?.horizontalActions ?? true,
    );
  }
}

class DialogMacosProperty extends CoreMacosProperty {
  const DialogMacosProperty({
    this.axis,
    this.appIcon,
    this.suppress,
    this.dialogMode,
    this.horizontalActions,
  });

  /// This should be your application's icon.
  ///
  /// If [Axis.vertical] The size of this widget should be 64x64.
  /// If [Axis.horizontal] The size of this widget should be 24x24.
  final Widget? appIcon;

  /// Determines whether to lay out [primaryButton] and [secondaryButton]
  /// horizontally or vertically.
  ///
  /// for only [MacosDialogMode.macOS], Defaults to `true`.
  final bool? horizontalActions;

  /// the axis for laying out [appIcon] and [title] in the macOS dialog.
  ///
  /// If set to [Axis.vertical], buttons will be laid out vertically.
  /// If set to [Axis.horizontal], buttons will be laid out horizontally.
  ///
  /// Defaults to `Axis.horizontal`.
  final Axis? axis;

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
  ///           value: suppress,
  ///           onChanged: (value) {
  ///             setState(() => suppress = value);
  ///           },
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

  /// Represents the dialog mode for the macOS dialog.
  final MacosDialogMode? dialogMode;
}

extension _AdaptiveFlatButtonEx on AdaptiveFlatButton {
  bool get isEnabled => _pushButton.onPressed != null || onLongPress != null;

  PushButton get _pushButton {
    final property = properties?.macos;
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

  Widget _cupertinoDialogAction(TextStyle? textStyle) {
    final backgroundColor = (isEnabled ? color : disabledColor);

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? MacosColors.transparent,
          backgroundBlendMode: BlendMode.difference,
        ),
        child: CupertinoDialogAction(
          textStyle: backgroundColor != null ? textStyle : null,
          onPressed: _pushButton.onPressed,
          child: _pushButton.child,
        ),
      ),
    );
  }
}
