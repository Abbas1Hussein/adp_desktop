import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/construct/component.dart';
import 'icons.dart';

/// Icons are graphical symbols used to represent actions, objects, or concepts within an application's user interface.
/// They provide visual cues that help users quickly understand and interact with the interface.
///
/// Use this widget to create time picker with platform-specific
/// styling and behavior:
/// - On macOS, [MacosIcon], is utilized.
/// - On Windows, [Icon] is used.
class AdaptiveIcon extends CoreAdaptiveComponent {
  /// Creates an adp icon.
  ///
  /// The [size] and [color] default to the value given by the current platform Theme.
  const AdaptiveIcon(
    this.adaptiveIcons, {
    super.key,
    super.builders,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  })  : mICON = null,
        wICON = null;

  /// Creates a new adaptive icon with specific icons for each platform.
  ///
  /// - On Windows: [wICON] icon is used.
  /// - On Macos: [mICON]  icon is used.
  const AdaptiveIcon.from({
    super.key,
    super.builders,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    required IconData this.wICON,
    required IconData this.mICON,
  }) : adaptiveIcons = null;

  /// Creates a new adaptive icon with one icons for all platforms.
  ///
  /// This [iconData] will apply for all platforms.
  const AdaptiveIcon.all(
    IconData iconData, {
    super.key,
    super.builders,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  })  : mICON = iconData,
        wICON = iconData,
        adaptiveIcons = null;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current platform theme size,
  /// if any defaults to 24.0.
  final double? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current [AdaptiveIconTheme] color, if any.
  final Color? color;

  /// The icon to display, used for different platforms.
  ///
  /// The available icons are described in [CupertinoIcons], [FluentIcons].
  ///
  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  final AdpIcons? adaptiveIcons;

  /// The Fluent UI icon data to be displayed on Windows [FluentIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? wICON;

  /// The Cupertino icon data to be displayed on macOS [CupertinoIcons].
  ///
  /// used on [AdaptiveIcon.from].
  final IconData? mICON;

  /// Semantic label for the icon.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  final TextDirection? textDirection;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    final icon = wICON ?? adaptiveIcons?.wICON;
    return Icon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final icon = mICON ?? adaptiveIcons?.mICON;
    return MacosIcon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
