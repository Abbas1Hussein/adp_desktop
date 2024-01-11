import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

import '../../../core/common/construct/builders.dart';
import '../../../core/common/platform_ruining.dart';
import '../../../core/extension/context.dart';
import '../../additional/color.dart';
import '../../components.dart';

/// different modes for the title bar.
enum TitleBarMode { hidden, normal }

/// Configuration for [AdaptiveTitleBar].
class AdaptiveTitleBarConfig {
  AdaptiveTitleBarConfig({
    this.mode,
    this.appIcon,
    this.appTitle,
    this.dividerColor,
    this.dividerThickness,
    this.backgroundColor,
  });

  /// Icon widget representing the application.
  ///
  /// If null, defaults to [FlutterLogo].
  final Widget? appIcon;

  /// Title widget displayed in the title bar.
  ///
  /// If null, defaults to obtaining the app name.
  final Widget? appTitle;

  /// Background color of the title bar.
  final Color? backgroundColor;

  /// Color of the divider line at the bottom of the title bar.
  final Color? dividerColor;

  /// Thickness of the divider line at the bottom of the title bar.
  final double? dividerThickness;

  /// Mode for the title bar.
  ///
  /// whether the title bar should be hidden or normal, this only work on [AdpApp].
  final TitleBarMode? mode;
}

/// an adaptive title bar that adjusts based on the platform.
class AdaptiveTitleBar extends StatefulWidget {
  /// Creates an `AdaptiveTitleBar`.
  ///
  /// The [child] parameter is the main content below the title bar.
  /// The [config] parameter allows customizing the appearance of the title bar.
  const AdaptiveTitleBar({super.key, this.config, required this.child});

  /// The child widget to be displayed beneath the title bar.
  final Widget child;

  /// Configuration for the title bar appearance.
  final AdaptiveTitleBarConfig? config;

  @override
  State<AdaptiveTitleBar> createState() => _AdaptiveTitleBarState();
}

class _AdaptiveTitleBarState extends State<AdaptiveTitleBar>
    with WindowListener {
  Future<String>? getTitle;

  double height = kWindowCaptionHeight;

  @override
  void initState() {
    if (widget.config?.appTitle == null) {
      getTitle = windowManager.getTitle();
    }
    windowManager.addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color:
                handelBackgroundColor(widget.config?.backgroundColor, context),
            border: Border(
              bottom: BorderSide(
                color: widget.config?.dividerColor ??
                    _getDefaultBuilderColor(context)!,
              ),
            ),
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: double.infinity, height: height),
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
                const Expanded(
                  child: DragToMoveArea(
                    child: SizedBox(height: kWindowCaptionHeight),
                  ),
                ),
                AdaptiveIconTheme.merge(
                  data: const AdaptiveIconThemeData(size: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: widget.config?.appIcon ??
                            const FlutterLogo(size: 15.0),
                      ),
                      DefaultTextStyle(
                        style: context.typography.body!.copyWith(
                          fontSize: 12,
                          fontWeight: PlatformRuining.isMacos
                              ? MacosFontWeight.w510
                              : null,
                        ),
                        child: _buildAppTitleBuilder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: widget.child)
      ],
    );
  }

  Widget _buildAppTitleBuilder() {
    if (widget.config?.appTitle != null) return widget.config!.appTitle!;

    return FutureBuilder(
      future: getTitle,
      builder: (context, snapshot) => Text(snapshot.data ?? ''),
    );
  }

  Color? _getDefaultBuilderColor(BuildContext context) {
    return PlatformRuining.isMacos
        ? MacosTheme.of(context).iconButtonTheme.disabledColor
        : FluentTheme.of(context).resources.controlStrokeColorDefault;
  }

  @override
  void onWindowMaximize() {
    height = kWindowCaptionHeight - 8;
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    height = kWindowCaptionHeight;
    setState(() {});
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }
}
