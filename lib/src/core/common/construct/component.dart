import 'package:fluent_ui/fluent_ui.dart' hide Builder;
import 'package:macos_ui/macos_ui.dart';

import '../../core.dart';
import 'component_mixin.dart';
export 'property.dart';

/// A base class for creating adaptive components that can have different implementations
/// on Windows and macOS platforms.
///
/// This class provides a consistent structure for building widgets that can adapt to
/// platform-specific visual and functional aspects.
///
/// - [Windows]: Type of Windows-specific properties.
/// - [Macos]: Type of macOS-specific properties.
abstract class CoreAdaptiveComponent<Windows extends CoreWindowsProperty,
        Macos extends CoreMacosProperty> extends StatelessWidget
    with AdaptiveComponentMixin<Windows, Macos> {
  const CoreAdaptiveComponent({this.builders, this.properties, super.key});

  /// Builders for adapting the component based on platform and theme.
  ///
  /// This property allows you to specify builders for both Windows and macOS platforms.
  /// Builders are functions that customize the appearance and behavior of the component
  /// based on the provided [ThemePlatformData] and [Property] for each platform.
  ///
  /// Example:
  /// ```dart
  /// CoreAdaptiveBuilder(
  ///   windows: (platformChild, theme, property) {
  ///     // Windows-specific customization logic here
  ///     return CustomWindowsWidget(
  ///       child: platformChild, // The core content for Windows.
  ///       theme: theme, // The FluentTheme data.
  ///       property: property, // The CoreWindowsProperty.
  ///     );
  ///   },
  ///   macos: (platformChild, theme, property) {
  ///     // macOS-specific customization logic here
  ///     return CustomMacosWidget(
  ///       child: platformChild, // The core content for macOS.
  ///       theme: theme, // The MacosTheme data.
  ///       property: property, // The CoreMacosProperty.
  ///     );
  ///   },
  /// );
  /// ```
  /// The [windows] builder receives [platformChild], [tooltipTheme], and [property] parameters,
  /// and it returns a Windows-specific widget, while the [macos] builder performs
  /// similar customization for the macOS platform.
  @override
  final CoreAdaptiveBuilder<Builder<FluentThemeData, Windows?>,
      Builder<MacosThemeData, Macos?>>? builders;

  /// Properties for customizing the visual and functional aspects of the adaptive component.
  ///
  /// This property allows you to specify properties separately for both Windows and macOS platforms.
  /// Properties are objects containing platform-specific settings that influence the appearance and
  /// behavior of the component based on the provided [Windows] and [Macos] types.
  ///
  /// Example:
  /// ```dart
  /// CoreProperties(
  ///   windows: MyWindowsProperties(), // An instance of CoreWindowsProperty.
  ///   macos: MyMacosProperties(), // An instance of CoreMacosProperty.
  /// );
  /// ```
  /// The [windows] and [macos] properties enable you to set platform-specific settings
  /// to tailor the component's behavior and appearance on Windows and macOS platforms, respectively.
  @override
  final CoreProperties<Windows, Macos>? properties;

  @override
  @mustCallSuper
  Widget build(BuildContext context) => getAdaptiveComponent(context);
}
