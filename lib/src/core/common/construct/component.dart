import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Builder;
import 'package:macos_ui/macos_ui.dart';

import '../../core.dart';

abstract class CoreAdaptiveComponent<Windows extends CoreWindowsProperty,
    Macos extends CoreMacosProperty> extends StatelessWidget {
  const CoreAdaptiveComponent({
    this.builders,
    this.properties,
    super.key,
  });

  final CoreAdaptiveBuilder? builders;
  final CoreProperties<Windows, Macos>? properties;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return adaptiveValue(
      windows: () {
        final body = windows(context);

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
        final body = macos(context);

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


  Widget windows(BuildContext context);

  Widget macos(BuildContext context);
}
