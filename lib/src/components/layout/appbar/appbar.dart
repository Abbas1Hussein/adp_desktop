import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/properties.dart';
import 'platforms/platforms.dart';

class AdaptiveAppBar extends CoreAdaptiveComponent<NoneProperty, AppBarMacosProperty> {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;
  final double toolbarOpacity;
  final double? leadingWidth;
  final IconThemeData? actionsIconTheme;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final double? titleWidth;

  const AdaptiveAppBar({
    super.key,
    super.properties,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.actionsIconTheme,
    this.centerTitle,
    this.automaticallyImplyLeading = false,
    this.toolbarOpacity = 1.0,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.titleWidth,
  });

  @override
  Widget macos(BuildContext context) {
    return AppBarMacos(
      property: properties?.macos,
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      titleTextStyle: titleTextStyle,
      foregroundColor: foregroundColor,
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      titleWidth: titleWidth,
      toolbarOpacity: toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return AppBarWindows(
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      titleTextStyle: titleTextStyle,
      foregroundColor: foregroundColor,
      actionsIconTheme: actionsIconTheme,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      titleWidth: titleWidth,
      toolbarOpacity: toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle,
    );
  }
}
