import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../adaptive.dart';
import 'builders.dart' as b;
import 'properties.dart';

export 'builders.dart';

mixin AdaptiveComponentMixin<Windows extends CoreWindowsProperty,
    Macos extends CoreMacosProperty> {
  CoreProperties<Windows, Macos>? get properties => null;

  b.CoreAdaptiveBuilder<b.Builder<FluentThemeData, Windows?>,
      b.Builder<MacosThemeData, Macos?>>? get builders => null;

  Widget windows(BuildContext context, [Windows? property]);

  Widget macos(BuildContext context, [Macos? property]);

  Widget getAdaptiveComponent(BuildContext context) {
    return adaptiveValue<Widget>(
      windows: () {
        final body = windows(context, properties?.windows);

        if (builders?.windows != null) {
          return builders!.windows!.call(
            body,
            FluentTheme.of(context),
            properties?.windows,
          );
        }
        return body;
      },
      macos: () {
        final body = macos(context, properties?.macos);

        if (builders?.macos != null) {
          return builders!.macos!.call(
            body,
            MacosTheme.of(context),
            properties?.macos,
          );
        }
        return body;
      },
    );
  }
}
