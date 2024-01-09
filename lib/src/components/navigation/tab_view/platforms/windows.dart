import 'package:fluent_ui/fluent_ui.dart';

import '../../../../core/core.dart';
import '../tab.dart';

const double _kMinTileWidth = 80.0;
const double _kMaxTileWidth = 240.0;

class TabViewWindows extends StatelessWidget {
  const TabViewWindows({
    super.key,
    this.property,
    this.onChanged,
    this.primaryColor,
    this.secondaryColor,
    this.selectedTabColor,
    this.unselectedTabColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.contentMargin,
    required this.tabs,
    required this.children,
    required this.currentIndex,
    required this.contentPadding,
  });

  /// The Windows-specific property for customizing the tab view.
  final TabViewWindowsProperty? property;

  final int currentIndex;
  final ValueChanged<int>? onChanged;

  final List<Widget> children;
  final List<AdaptiveTab> tabs;

  final Color? primaryColor;
  final Color? secondaryColor;

  final Color? selectedTabColor;
  final Color? unselectedTabColor;

  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry? contentMargin;

  Widget get body => children[currentIndex];

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    final activeColor =
        selectedTabColor ?? theme.resources.solidBackgroundFillColorTertiary;

    final inactiveColor = unselectedTabColor ??
        theme.resources.layerOnMicaBaseAltFillColorTransparent;

    return FluentTheme(
      data: theme.copyWith(
        resources: theme.brightness.isDark
            ? ResourceDictionary.dark(
          solidBackgroundFillColorTertiary: activeColor,
          layerOnMicaBaseAltFillColorTransparent: inactiveColor,
        )
            : ResourceDictionary.light(
          solidBackgroundFillColorTertiary: activeColor,
          layerOnMicaBaseAltFillColorTransparent: inactiveColor,
          layerOnMicaBaseAltFillColorDefault: primaryColor !=
              null
              ? theme.resources.layerOnMicaBaseAltFillColorDefault
              : theme.resources.layerOnMicaBaseAltFillColorTransparent,
        ),
      ),
      child: Mica(
        backgroundColor: primaryColor,
        child: TabView(
          tabs: _buildTabs(context),
          onChanged: _onChanged,
          shortcutsEnabled: false,
          currentIndex: currentIndex,
          footer: property?.footer,
          header: property?.header,
          closeButtonVisibility: CloseButtonVisibilityMode.never,
          maxTabWidth: property?.maxTabWidth ?? _kMaxTileWidth,
          minTabWidth: property?.minTabWidth ?? _kMinTileWidth,
          showScrollButtons: property?.showScrollButtons ?? true,
          tabWidthBehavior:
          property?.tabWidthBehavior ?? TabWidthBehavior.equal,
        ),
      ),
    );
  }

  List<Tab> _buildTabs(BuildContext context) {
    return List.generate(
      tabs.length,
          (index) {
        final isActive = currentIndex == index;
        return tabs[index].toWindows(
          context,
          body: Card(
            padding: contentPadding,
            margin: contentMargin ?? EdgeInsets.zero,
            backgroundColor: secondaryColor ??
                FluentTheme
                    .of(context)
                    .resources
                    .solidBackgroundFillColorTertiary,
            borderRadius: BorderRadius.zero,
            child: CustomSingleChildLayout(
              delegate: DesktopTextSelectionToolbarLayoutDelegate(
                anchor: Offset.zero,
              ),
              child: body,
            ),
          ),
          isActive: isActive,
          style: isActive ? selectedLabelStyle : unselectedLabelStyle,
          data: isActive ? selectedIconTheme : unselectedIconTheme,
        );
      },
    );
  }

  void _onChanged(int value) => onChanged?.call(value);
}

class TabViewWindowsProperty extends CoreWindowsProperty {
  const TabViewWindowsProperty({
    this.header,
    this.footer,
    this.minTabWidth,
    this.maxTabWidth,
    this.showScrollButtons = true,
    this.tabWidthBehavior = TabWidthBehavior.equal,
  });

  /// Displayed before all the tabs and buttons.
  ///
  /// Usually a [Text]
  final Widget? header;

  /// Displayed after all the tabs and buttons.
  ///
  /// Usually a [Text] widget
  final Widget? footer;

  /// The min width a tab can have. Must not be negative.
  ///
  /// Default to 80 logical pixels
  final double? minTabWidth;

  /// The max width a tab can have. Must not be negative.
  ///
  /// Defaults to 240 logical pixels
  final double? maxTabWidth;

  /// Whether the buttons that scroll forward or backward
  /// should be displayed, if necessary. Defaults to true.
  final bool showScrollButtons;

  /// Indicates how a tab will size itself
  ///
  /// Defaults to [TabWidthBehavior.equal].
  final TabWidthBehavior tabWidthBehavior;
}
