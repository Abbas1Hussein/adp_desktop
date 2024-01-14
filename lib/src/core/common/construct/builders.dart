import 'package:flutter/widgets.dart';

/// for a builder function used to create adaptive widgets based on platform-specific data.
///
/// - [platformChild]: The widget that represents the core content of the adaptive component.
/// - [theme]: The theme data specific to the platform (Windows [FluentTheme] or macOS [MacosTheme]).
/// - [property]: The platform-specific property used to customize the component (CoreWindowsProperty or CoreMacosProperty).
typedef Builder<ThemePlatformData, Property> = Widget Function(
  Widget platformChild,
  ThemePlatformData theme,
  Property property,
);

/// Base class for defining adaptive builders that customize the appearance and behavior
/// of a component separately for Windows and macOS platforms.
///
/// - [W]: Type of Windows-specific builder.
/// - [M]: Type of macOS-specific builder.
abstract class CoreAdaptiveBuilder<W, M> {
  const CoreAdaptiveBuilder({this.windows, this.macos});

  final W? windows;
  final M? macos;
}

/// Concrete implementation of [CoreAdaptiveBuilder] that allows setting both Windows
/// and macOS builders simultaneously.
///
/// See also:
///
/// * [CoreAdaptiveComponent]: Used this to create edit adaptive components on Windows and macOS platforms.
final class AdaptiveBuilder<W, M> extends CoreAdaptiveBuilder<W, M> {
  const AdaptiveBuilder({super.windows, super.macos});

  /// for setting the Windows-specific builder.
  const AdaptiveBuilder.windows(W windows) : super(windows: windows);

  /// for setting the macOS-specific builder.
  const AdaptiveBuilder.macos(M macos) : super(macos: macos);
}
