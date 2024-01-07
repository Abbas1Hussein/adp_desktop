import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import '../../core/common/construct/component.dart';
import '../../core/common/construct/property.dart';

/// A widget that provides an adaptive entrance transition for the child based on the platform.
///
/// On macOS, it uses [CupertinoFullscreenDialogTransition] for a native-looking transition.
/// On Windows, it uses a custom [EntrancePageTransition] for the entrance animation.
class AdaptiveEntranceTransition extends CoreAdaptiveComponent {
  const AdaptiveEntranceTransition({
    Key? key,
    required this.child,
    required this.animation,
    required this.secondaryAnimation,
  }) : super(key: key);

  /// The widget to apply the entrance transition to.
  final Widget child;

  /// The primary animation for the entrance transition.
  final Animation<double> animation;

  /// The secondary animation for the entrance transition.
  final Animation<double> secondaryAnimation;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return EntrancePageTransition(animation: animation, child: child);
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    return CupertinoFullscreenDialogTransition(
      secondaryRouteAnimation: secondaryAnimation,
      primaryRouteAnimation: animation,
      linearTransition: true,
      child: child,
    );
  }
}
