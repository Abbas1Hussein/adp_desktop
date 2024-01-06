import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/adaptive.dart';

class AdaptiveTypography {
  const AdaptiveTypography({
    this.body,
    this.label,
    this.caption,
    this.headline,
    this.subheading,
  });

  final TextStyle? body;
  final TextStyle? label;
  final TextStyle? caption;
  final TextStyle? headline;
  final TextStyle? subheading;

  static AdaptiveTypography of(BuildContext context) => _data(context);

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
