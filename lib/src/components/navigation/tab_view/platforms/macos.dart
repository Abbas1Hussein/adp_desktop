import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../core/core.dart';
import '../tab.dart';

class TabViewMacos extends StatefulWidget {
  const TabViewMacos({
    super.key,
    this.property,
    this.onChanged,
    this.selectedColor,
    this.unSelectedColor,
    this.primaryBackgroundColor,
    this.secondaryBackgroundColor,
    required this.tabs,
    required this.children,
    required this.currentIndex,
  });

  /// The macOS-specific property for customizing the tab view.
  final TabViewMacosProperty? property;

  /// The index of the currently selected tab.
  final int currentIndex;

  /// Callback function called when the selected tab index changes.
  final ValueChanged<int>? onChanged;

  /// List of AdaptiveTab objects representing tabs in the view.
  final List<AdaptiveTab> tabs;

  /// The primary background color.
  final Color? primaryBackgroundColor;

  /// The secondary background color.
  final Color? secondaryBackgroundColor;

  /// The color to be applied to the selected tab.
  final Color? selectedColor;

  /// The color to be applied to unselected tabs.
  final Color? unSelectedColor;

  /// List of widgets representing the content associated with each tab.
  final List<Widget> children;

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

  void _onChanged(AdaptiveTab tab) {
    final index = macosTabController.index = widget.tabs.indexOf(tab);
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MacosTheme.brightnessOf(context);

    final backgroundColor = brightness
        .resolve(const Color(0xFFE6E9EA), const Color(0xFF2B2E33))
        .withOpacity(0.8);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.primaryBackgroundColor ?? backgroundColor,
      ),
      child: MacosIconTheme(
        data: const MacosIconThemeData(size: 16.0),
        child: DefaultTextStyle(
          style: MacosTheme.of(context).typography.body,
          child: MacosTabView(
            controller: macosTabController,
            position: widget.property?.position ?? MacosTabPosition.top,
            padding: widget.property?.padding ?? const EdgeInsets.all(12.0),
            tabs: widget.tabs.map((tab) {
              return tab.toMacos(
                context,
                isActive: macosTabController.index == widget.tabs.indexOf(tab),
                onChanged: () => _onChanged(tab),
                padding: widget.property?.insets,
                axis: widget.property?.axis ?? Axis.horizontal,
                selectedColor: widget.selectedColor,
                unSelectedColor: widget.unSelectedColor,
              );
            }).toList(),
            children: widget.children.map((child) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                child: ColoredBox(
                  color: widget.secondaryBackgroundColor ?? backgroundColor,
                  child: child,
                ),
              );
            }).toList(),
          ),
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
  const TabViewMacosProperty(
      {this.axis, this.insets, this.padding, this.position});

  /// The padding of the tab view widget.
  ///
  /// Defaults to `EdgeInsets.all(12.0)`.
  final EdgeInsetsGeometry? padding;

  /// The placement of the [tabs], typically [MacosTabPosition.top].
  final MacosTabPosition? position;

  /// Specifies the insets for tabs.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry? insets;

  /// Determines the axis along which tabs will be displayed.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis? axis;
}
