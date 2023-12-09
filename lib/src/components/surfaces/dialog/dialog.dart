import 'package:flutter/material.dart';

import '../../../core/common/construct/component.dart';
import '../../buttons/flat_button/flat_button.dart';
import 'platforms/platforms.dart';

/// A custom dialog widget that adapts its appearance based on the platform.
///
/// Use this widget to create dialogs with platform-specific styling and behavior.
/// It supports macOS, Windows.
class AdaptiveDialog extends CoreAdaptiveComponent<DialogWindowsProperty, DialogMacosProperty> {
  final Widget? title;
  final Widget? content;

  final AdaptiveFlatButton? primary;
  final AdaptiveFlatButton? secondary;

  const AdaptiveDialog({
    super.key,
    super.builders,
    super.properties,
    this.title,
    this.content,
    this.secondary,
    this.primary,
  });

  @override
  Widget macos(BuildContext context) {
    return DialogMacos(
      title: title,
      content: content,
      secondary: secondary,
      primary: primary,
    );
  }

  @override
  Widget windows(BuildContext context) {
    return DialogWindows(
      title: title,
      content: content,
      primary: primary ?? empty,
      secondary: secondary ?? empty,
    );
  }

  Widget get empty => const SizedBox.shrink();
}
