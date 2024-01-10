import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

import '../../../core/common/construct/builders.dart';
import '../../../core/common/platform_ruining.dart';
import '../../../core/extension/context.dart';
import '../../additional/color.dart';
import '../../components.dart';

class AdaptiveTitleBar extends StatefulWidget {
  const AdaptiveTitleBar({
    super.key,
    this.appIcon,
    this.appTitle,
    this.backgroundColor,
    required this.child,
  });

  final Widget? appIcon;
  final Widget? appTitle;

  final Widget child;
  final Color? backgroundColor;

  @override
  State<AdaptiveTitleBar> createState() => _AdaptiveTitleBarState();
}

class _AdaptiveTitleBarState extends State<AdaptiveTitleBar> {
  Future<String>? getTitle;

  @override
  void initState() {
    if (widget.appTitle == null) {
      getTitle = windowManager.getTitle();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragToMoveArea(
          child: ColoredBox(
            color: handelBackgroundColor(widget.backgroundColor, context),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: double.infinity,
                height: kWindowCaptionHeight,
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  AdaptiveWindowButtons(
                    builders: AdaptiveBuilder(
                      macos: (platformChild, theme, property) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: platformChild,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AdaptiveIconTheme.merge(
                          data: const AdaptiveIconThemeData(size: 15.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child:
                                widget.appIcon ?? const FlutterLogo(size: 15.0),
                          ),
                        ),
                        DefaultTextStyle(
                          style: context.typography.body!.copyWith(
                            fontWeight: PlatformRuining.isMacos
                                ? MacosFontWeight.w510
                                : FontWeight.w400,
                          ),
                          child: _buildGetTitleBuilder(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const AdaptiveDivider(size: double.infinity),
        Expanded(child: widget.child)
      ],
    );
  }

  Widget _buildGetTitleBuilder() {
    if (widget.appTitle != null) return widget.appTitle!;

    return FutureBuilder(
      future: getTitle,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Text(snapshot.data!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
