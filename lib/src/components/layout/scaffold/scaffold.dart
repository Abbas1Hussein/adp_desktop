import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../appbar/appbar.dart';
import '../appbar/platforms/platforms.dart';

class AdaptiveScaffold extends CoreAdaptiveComponent {
  final Color? backgroundColor;
  final AdaptiveAppBar? appBar;
  final Widget? body;

  const AdaptiveScaffold({
    super.key,
    super.builders,
    this.appBar,
    this.body,
    this.backgroundColor,
  });

  @override
  Widget windows(BuildContext context) {
    return ScaffoldPage(
      header: appBar?.windows(context),
      content: SafeArea(
        child: Mica(
          elevation: 10.0,
          backgroundColor: backgroundColor,
          child: Center(child: body ?? const SizedBox.expand()),
        ),
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    final appBarMacos = appBar?.macos(context) as AppBarMacos?;
    return MacosScaffold(
      backgroundColor: backgroundColor,
      toolBar:
          appBarMacos != null ? appBarMacos.build(context) as ToolBar : null,
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Center(child: body ?? const SizedBox.shrink());
          },
        ),
      ],
    );
  }
}
