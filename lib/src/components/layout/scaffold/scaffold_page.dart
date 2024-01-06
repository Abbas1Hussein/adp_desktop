import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/core.dart';
import '../appbar/appbar_page.dart';

const _contentPadding = EdgeInsets.all(4.0);

/// The Scaffold Page is designed to be a top level container for
/// a [AdpApp]. This means that adding a Scaffold Page
/// to each route on a adp app will provide the app with
/// platform's basic visual layout structure.
///
/// See also:
///
///  * [AdaptiveScaffold] a more generic scaffold widget for consistent adaptive styling.
///  * [AdaptiveAppBar], which is a horizontal bar typically shown at the top of an app.
///
/// Use this widget to create a scaffold page with platform-specific
/// styling and behavior:
/// - On macOS, [MacosScaffold] is utilized.
/// - On Windows, [ScaffoldPage] is used.
class AdaptiveScaffoldPage extends CoreAdaptiveComponent {
  /// Creates an adaptive scaffold page.
  ///
  /// Example usage:
  /// ```dart
  /// const AdaptiveScaffoldPage(
  ///   appBar: AdaptiveAppBarPage(
  ///     title: Text('Adaptive App'),
  ///     leading: AdaptiveIcon(AdpIcons.home),
  ///   ),
  ///   drawer: const AdaptiveDrawer(),
  /// );
  /// ```
  /// See also:
  ///
  ///  * [AdaptiveAppBarPage], which is a horizontal bar typically shown at the top of an app,
  ///  using the [appBar] property.
  const AdaptiveScaffoldPage({
    super.key,
    super.builders,
    this.appBar,
    this.content,
    this.backgroundColor,
    this.contentPadding = _contentPadding,
  });

  /// The main content of the adaptive scaffold page.
  final Widget? content;

  /// The app bar to be displayed at the top of the scaffold page.
  final AdaptiveAppBarPage? appBar;

  /// Padding around the content of the adaptive scaffold page.
  final EdgeInsets contentPadding;

  /// The background color of the adaptive scaffold page.
  final Color? backgroundColor;

  /// custom-layout child widget. child widget is controlled by a custom layout delegate on desktop.
  Widget get _customLayoutContent {
    return Padding(
      padding: contentPadding,
      child: CustomSingleChildLayout(
        delegate: DesktopTextSelectionToolbarLayoutDelegate(
          anchor: Offset.zero,
        ),
        child: content,
      ),
    );
  }

  @override
  Widget windows(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Mica(
      backgroundColor:
          backgroundColor ?? theme.resources.solidBackgroundFillColorBase,
      child: ScaffoldPage(
        padding: EdgeInsets.zero,
        header: (appBar?.windows != null) ? appBar!.windows(context) : null,
        content: _customLayoutContent,
      ),
    );
  }

  @override
  Widget macos(BuildContext context) {
    final defaultBackgroundColor = MacosDynamicColor.resolve(
      backgroundColor ?? MacosTheme.of(context).canvasColor,
      context,
    );

    return MacosScaffold(
      backgroundColor: defaultBackgroundColor,
      toolBar:
          (appBar?.macos != null) ? appBar?.macos(context) as ToolBar : null,
      children: [
        ContentArea(
          minWidth: double.infinity,
          builder: (context, scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(color: defaultBackgroundColor),
              child: DefaultTextStyle(
                style: MacosTheme.of(context).typography.body,
                child: _customLayoutContent,
              ),
            );
          },
        ),
      ],
    );
  }
}
