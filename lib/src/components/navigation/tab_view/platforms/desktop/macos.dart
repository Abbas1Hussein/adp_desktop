import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../../../core/core.dart';
import '../../../../../core/extension/widget.dart';
import '../../tab.dart';

class TabViewMacos extends StatefulWidget {
  final TabViewMacosProperty? property;

  final int currentIndex;
  final ValueChanged<int>? onChanged;
  final List<AdaptiveTab> tabs;
  final List<Widget> children;

  const TabViewMacos({
    super.key,
    this.property,
    required this.currentIndex,
    required this.tabs,
    required this.children,
    this.onChanged,
  });

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

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: MacosTheme.of(context).typography.body,
      child: MacosTabView(
        controller: macosTabController,
        position: widget.property?.position ?? MacosTabPosition.top,
        padding: widget.property?.padding ?? const EdgeInsets.all(12.0),
        tabs: widget.tabs.map((tab) {
          return _MacosTab(
            label: tab.label,
            icon: tab.icon,
            onTap: () => _onTap(tab),
            active: macosTabController.index == widget.tabs.indexOf(tab),
          );
        }).toList(),
        children: widget.children,
      ),
    );
  }

  _onTap(AdaptiveTab tab) {
    final int index = macosTabController.index = widget.tabs.indexOf(tab);
    widget.onChanged?.call(index);
    setState(() {});
  }
}

class _MacosTab extends MacosTab {
  final VoidCallback? onTap;
  final Widget? icon;

  const _MacosTab({
    this.onTap,
    this.icon,
    super.active,
    required super.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: super.build(context).margeWith(icon),
    );
  }

  @override
  MacosTab copyWith({String? label, bool? active}) => this;
}

class TabViewMacosProperty extends CoreMacosProperty {
  /// The placement of the [tabs], typically [MacosTabPosition.top].
  final MacosTabPosition? position;

  /// The padding of the tab view widget.
  ///
  /// Defaults to `EdgeInsets.all(12.0)`.
  final EdgeInsetsGeometry? padding;

  const TabViewMacosProperty({
    this.position,
    this.padding,
  });
}
