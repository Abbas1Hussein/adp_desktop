import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:macos_ui/macos_ui.dart';

import '../../core/common/adaptive.dart';

class AdaptiveTypography {
  final TextStyle? body;
  final TextStyle? label;
  final TextStyle? caption;
  final TextStyle? headline;
  final TextStyle? subheading;

  AdaptiveTypography({
    this.body,
    this.label,
    this.caption,
    this.headline,
    this.subheading,
  });

  static AdaptiveTypography of(BuildContext context) {
    return _data(context);
  }

  static AdaptiveTypography _data(BuildContext context) {
    final macosTheme = MacosTheme.of(context);
    final windowsTheme = FluentTheme.of(context);

    return AdaptiveTypography(
      body: adaptiveValue<TextStyle?>(
        macos: () => macosTheme.typography.body,
        windows: () => windowsTheme.typography.body,
      ),
      headline: adaptiveValue<TextStyle?>(
        macos: () => macosTheme.typography.largeTitle,
        windows: () => windowsTheme.typography.titleLarge,
      ),
      caption: adaptiveValue<TextStyle?>(
        macos: () => macosTheme.typography.caption1,
        windows: () => windowsTheme.typography.caption,
      ),
      label: adaptiveValue<TextStyle?>(
        macos: () => macosTheme.typography.caption2,
        windows: () => windowsTheme.typography.subtitle,
      ),
      subheading: adaptiveValue<TextStyle?>(
        macos: () => macosTheme.typography.title1,
        windows: () => windowsTheme.typography.bodyLarge
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
  int get hashCode {
    return Object.hash(body, headline, caption, label, subheading);
  }
}
