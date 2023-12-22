import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

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
    final appBarWindows = appBar?.windows(context) as AppBarWindows?;
    return ScaffoldPage(
      // header: PageHeader(
      //   title: appBarWindows?.title,
      //   leading: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //     child: appBarWindows?.leading,
      //   ),
      // ),
      content: SafeArea(
        child: Mica(
          elevation: 10.0,
          backgroundColor: backgroundColor,
          child: body ?? const SizedBox.expand(),
        ),
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    final appBarMacos = appBar?.macos(context) as AppBarMacos?;

    final isDark = MacosTheme.brightnessOf(context) == Brightness.dark;

    return MacosScaffold(
      backgroundColor: backgroundColor,
      toolBar:
          appBarMacos != null ? appBarMacos.build(context) as ToolBar : null,
      children: [
        ContentArea(
          minWidth: MediaQuery.sizeOf(context).width,
          builder: (context, scrollController) {
            return ColoredBox(
              color: backgroundColor ??
                  (isDark
                      ? CupertinoColors.secondarySystemFill
                      : MacosColors.white),
              child: body,
            );
          },
        ),
      ],
    );
  }
}
