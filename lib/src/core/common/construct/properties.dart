import '../adaptive.dart';

export 'property.dart';

/// Core properties class providing a common structure for platform-specific properties.
abstract class CoreProperties<W, M> {
  CoreProperties({this.windows, this.macos});

  /// Windows-specific properties.
  W? windows;

  /// macOS-specific properties.
  M? macos;
}

/// The [Properties] class allows you to customize the visual and functional aspects
/// of a support widget separately for Windows and macOS platforms.
final class Properties<W, M> extends CoreProperties<W, M> {
  Properties({super.windows, super.macos});

  Properties.windows(W windows) : super(windows: windows);

  Properties.macos(M macos) : super(macos: macos);
}

/// Callback type for defining platform-specific properties.
typedef PropertiesCallback<T> = T Function();

/// The [PropertiesLogic] class allows you to tailor the visual and functional aspects
/// of a support widget independently for Windows and macOS platforms.
///
/// This becomes useful when specific properties should be applied only to a particular platform.
///
/// Example:
/// ```dart
/// properties: PropertiesLogic.windows(
///   () {
///     /// The following code block only applies to the Windows platform:
///     final theme = FluentTheme.of(context);
///     return FlatButtonWindowsProperty(
///       style: ButtonStyle(
///         backgroundColor: ButtonState.all(theme.cardColor),
///       ),
///     );
///   },
/// ),
/// ```
final class PropertiesLogic<W, M> extends CoreProperties<W, M> {
  /// creating an instance of [PropertiesLogic].
  factory PropertiesLogic({
    PropertiesCallback<W>? windows,
    PropertiesCallback<M>? macos,
  }) {
    return PropertiesLogic._internal(windows: windows, macos: macos);
  }

  /// creating an instance of [PropertiesLogic] with Windows-specific properties.
  factory PropertiesLogic.windows(PropertiesCallback<W>? windows) {
    return PropertiesLogic._internal(windows: windows);
  }

  /// creating an instance of [PropertiesLogic] with macOS-specific properties.
  factory PropertiesLogic.macos(PropertiesCallback<M>? macos) {
    return PropertiesLogic._internal(macos: macos);
  }

  /// Internal constructor for [PropertiesLogic].
  PropertiesLogic._internal({
    PropertiesCallback<W>? windows,
    PropertiesCallback<M>? macos,
  }) {
    adaptiveValue<void>(
      windows: () {
        if (windows != null) this.windows = windows();
      },
      macos: () {
        if (macos != null) this.macos = macos();
      },
    );
  }
}
