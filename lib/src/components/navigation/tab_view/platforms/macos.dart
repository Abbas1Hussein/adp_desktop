import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/core.dart';
import '../tab.dart';

class TabViewMacos extends StatefulWidget {
  const TabViewMacos({
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

  final TabViewMacosProperty? property;

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

  final MacosIconThemeData? selectedIconTheme;
  final MacosIconThemeData? unselectedIconTheme;

  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry? contentMargin;

  @override
  State<TabViewMacos> createState() => _TabViewMacosState();
}

class _TabViewMacosState extends State<TabViewMacos> {
  late MacosTabController macosTabController;

  @override
  void initState() {
    macosTabController = MacosTabController(
      length: widget.tabs.length,
      initialIndex: widget.currentIndex,
    );
    super.initState();
  }

  bool isSelectedIndex(AdaptiveTab tab) =>
      macosTabController.index == widget.tabs.indexOf(tab);

  void _onChanged(AdaptiveTab tab) {
    final index = macosTabController.index = widget.tabs.indexOf(tab);
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MacosTheme.brightnessOf(context);

    final backgroundColor = brightness
        .resolve(const Color(0xFFE6E9EA), const Color(0xFF2B2E33))
        .withValues(alpha: 0.8);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.primaryColor ?? backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: MacosTabView(
          controller: macosTabController,
          position: widget.property?.position ?? MacosTabPosition.top,
          padding: widget.contentMargin ?? const EdgeInsets.all(12.0),
          tabs: widget.tabs.map((tab) {
            final isActive = isSelectedIndex(tab);

            return tab.toMacos(
              context,
              isActive: isActive,
              onChanged: () => _onChanged(tab),
              padding: widget.property?.paddingTab,
              selectedColor: widget.selectedTabColor,
              unSelectedColor: widget.unselectedTabColor,
              direction: widget.property?.direction ?? Axis.horizontal,
              data: isActive
                  ? widget.selectedIconTheme
                  : widget.unselectedIconTheme,
              style: isActive
                  ? widget.selectedLabelStyle
                  : widget.unselectedLabelStyle,
            );
          }).toList(),
          children: widget.children.map((child) {
            return Padding(
              padding: widget.contentPadding,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                child: ColoredBox(
                  color: widget.secondaryColor ?? backgroundColor,
                  child: CustomSingleChildLayout(
                    delegate: DesktopTextSelectionToolbarLayoutDelegate(
                      anchor: Offset.zero,
                    ),
                    child: child,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    macosTabController.dispose();
    super.dispose();
  }
}

class TabViewMacosProperty extends CoreMacosProperty {
  const TabViewMacosProperty({
    this.direction,
    this.paddingTab = EdgeInsets.zero,
    this.position = MacosTabPosition.top,
  });

  /// Determines the direction along which tabs will be displayed.
  ///
  /// if [AdaptiveTab.icon] is null, always be [Axis.horizontal].
  ///
  /// Defaults to [Axis.horizontal].
  final Axis? direction;

  /// The placement of the [tabs],
  ///
  /// Defaults and typically [MacosTabPosition.top].
  final MacosTabPosition position;

  /// Specifies the insets for tabs.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry? paddingTab;
}
