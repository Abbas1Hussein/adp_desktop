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
    this.primaryBackgroundColor,
    this.secondaryBackgroundColor,
    this.unSelectedColor,
    this.selectedColor,
    required this.tabs,
    required this.children,
    required this.currentIndex,
  });

  /// The Windows-specific property for customizing the tab view.
  final TabViewWindowsProperty? property;

  /// The index of the currently selected tab.
  final int currentIndex;

  /// Callback function called when the selected tab index changes.
  final ValueChanged<int>? onChanged;

  /// List of AdaptiveTab objects representing tabs in the view.
  final List<AdaptiveTab> tabs;

  /// List of widgets representing the content associated with each tab.
  final List<Widget> children;

  /// The primary background color.
  final Color? primaryBackgroundColor;

  /// The secondary background color.
  final Color? secondaryBackgroundColor;

  /// The color to be applied to the selected tab.
  final Color? selectedColor;

  /// The color to be applied to unselected tabs.
  final Color? unSelectedColor;

  /// Returns the widget associated with the currently selected tab.
  Widget get body => children[currentIndex];

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    final activeColor =
        selectedColor ?? theme.resources.solidBackgroundFillColorTertiary;

    final inactiveColor = unSelectedColor ??
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
                layerOnMicaBaseAltFillColorDefault: primaryBackgroundColor !=
                        null
                    ? theme.resources.layerOnMicaBaseAltFillColorDefault
                    : theme.resources.layerOnMicaBaseAltFillColorTransparent,
              ),
      ),
      child: Mica(
        backgroundColor: primaryBackgroundColor,
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
        final tab = tabs[index];
        return tab.toWindows(
          body: Card(
            backgroundColor: secondaryBackgroundColor ??
                FluentTheme.of(context)
                    .resources
                    .solidBackgroundFillColorTertiary,
            borderRadius: BorderRadius.zero,
            child: body,
          ),
          isActive: currentIndex == index,
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
    this.showScrollButtons,
    this.tabWidthBehavior,
  });

  /// The min width a tab can have. Must not be negative.
  ///
  /// Default to 80 logical pixels
  final double? minTabWidth;

  /// The max width a tab can have. Must not be negative.
  ///
  /// Defaults to 240 logical pixels
  final double? maxTabWidth;

  /// Whether the buttons that scroll forward or backward
  /// should be displayed, if necessary. Defaults to true
  final bool? showScrollButtons;

  /// Indicates how a tab will size itself
  final TabWidthBehavior? tabWidthBehavior;

  /// Displayed before all the tabs and buttons.
  ///
  /// Usually a [Text]
  final Widget? header;

  /// Displayed after all the tabs and buttons.
  ///
  /// Usually a [Text] widget
  final Widget? footer;
}
