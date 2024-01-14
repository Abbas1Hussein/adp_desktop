import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/adaptive.dart';

/// A class representing adaptive typography that provides styles for various text elements
/// based on the current platform (macOS or Windows).
class AdaptiveTypography {
  /// Creates an instance of [AdaptiveTypography].
  const AdaptiveTypography({
    this.body,
    this.label,
    this.caption,
    this.headline,
    this.subheading,
  });

  /// The text style for body text.
  final TextStyle? body;

  /// The text style for label text.
  final TextStyle? label;

  /// The text style for caption text.
  final TextStyle? caption;

  /// The text style for headline text.
  final TextStyle? headline;

  /// The text style for subheading text.
  final TextStyle? subheading;

  /// Retrieves an instance of [AdaptiveTypography] based on the current platform.
  ///
  /// Uses [adaptiveValue] to select the appropriate text styles for the current platform.
  static AdaptiveTypography of(BuildContext context) => _data(context);

  /// Internal method to retrieve the adaptive typography based on the current platform.
  static AdaptiveTypography _data(BuildContext context) {
    return AdaptiveTypography(
      body: adaptiveValue<TextStyle?>(
        macos: () => MacosTheme.of(context).typography.body,
        windows: () => FluentTheme.of(context).typography.body,
      ),
      headline: adaptiveValue<TextStyle?>(
        macos: () => MacosTheme.of(context).typography.largeTitle,
        windows: () => FluentTheme.of(context).typography.titleLarge,
      ),
      caption: adaptiveValue<TextStyle?>(
        macos: () => MacosTheme.of(context).typography.caption1,
        windows: () => FluentTheme.of(context).typography.caption,
      ),
      label: adaptiveValue<TextStyle?>(
        macos: () => MacosTheme.of(context).typography.caption2,
        windows: () => FluentTheme.of(context).typography.subtitle,
      ),
      subheading: adaptiveValue<TextStyle?>(
        macos: () => MacosTheme.of(context).typography.title1,
        windows: () => FluentTheme.of(context)
            .typography
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  bool operator ==(other) {
    if (other is AdaptiveTypography) {
      return body == other.body &&
          headline == other.headline &&
          caption == other.caption &&
          label == other.label &&
          subheading == other.subheading;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(body, headline, caption, label, subheading);
}
