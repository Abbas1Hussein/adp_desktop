import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/core.dart';
import '../../tab.dart';

const double _kMinTileWidth = 80.0;
const double _kMaxTileWidth = 240.0;

class TabViewWindows extends StatefulWidget {
  final TabViewWindowsProperty? property;
  final int currentIndex;
  final ValueChanged<int>? onChanged;
  final List<AdaptiveTab> tabs;
  final List<Widget> children;

  const TabViewWindows({
    super.key,
    this.property,
    this.onChanged,
    required this.currentIndex,
    required this.tabs,
    required this.children,
  });

  @override
  State<TabViewWindows> createState() => _TabViewWindowsState();
}

class _TabViewWindowsState extends State<TabViewWindows> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabView(
      currentIndex: currentIndex,
      onChanged: (value) {
        widget.onChanged?.call(value);
        _onTabChanged(value);
      },
      footer: widget.property?.footer,
      header: widget.property?.header,
      scrollController: widget.property?.scrollController,
      addIconData: widget.property?.addIconData ?? FluentIcons.add,
      closeButtonVisibility: widget.property?.closeButtonVisibility ??
          CloseButtonVisibilityMode.never,
      closeDelayDuration: widget.property?.closeDelayDuration ??
          const Duration(milliseconds: 400),
      maxTabWidth: widget.property?.maxTabWidth ?? _kMaxTileWidth,
      minTabWidth: widget.property?.minTabWidth ?? _kMinTileWidth,
      onNewPressed: widget.property?.onNewPressed,
      onReorder: widget.property?.onReorder,
      shortcutsEnabled: widget.property?.shortcutsEnabled ?? true,
      showScrollButtons: widget.property?.showScrollButtons ?? true,
      tabWidthBehavior: widget.property?.tabWidthBehavior ?? TabWidthBehavior.equal,
      tabs: List.generate(
        widget.tabs.length,
        (index) => Tab(
          text: Text(widget.tabs[index].label),
          icon: widget.tabs[index].icon,
          closeIcon: widget.property?.closeIcon ?? FluentIcons.chrome_close,
          body: widget.children[currentIndex],
        ),
      ),
    );
  }

  _onTabChanged(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}

class TabViewWindowsProperty extends CoreWindowsProperty {
  /// Called when the new button is pressed or when the
  /// shortcut `Ctrl + T` is executed.
  ///
  /// If null, the new button won't be displayed
  final VoidCallback? onNewPressed;

  /// The icon of the new button
  final IconData? addIconData;

  /// Whether the following shortcuts are enabled:
  ///
  /// - Ctrl + T to create a new tab
  /// - Ctrl + F4 or Ctrl + W to close the current tab
  /// - `Ctrl+1` to `Ctrl+8` to navigate through tabs
  /// - `Ctrl+9` to navigate to the last tab
  final bool? shortcutsEnabled;

  /// Called when the tabs are reordered. If null,
  /// reordering is disabled. It's disabled by default.
  final ReorderCallback? onReorder;

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

  /// The [ScrollPosController] used to move tabview to right and left when the
  /// tabs don't fit the available horizontal space.
  ///
  /// If null, a [ScrollPosController] is created internally.
  final ScrollPosController? scrollController;

  /// Indicates the close button visibility mode
  final CloseButtonVisibilityMode? closeButtonVisibility;

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

  /// The delay duration to animate the tab after it's closed. Only applied when
  /// [tabWidthBehavior] is [TabWidthBehavior.equal].
  ///
  /// Defaults to 400 milliseconds.
  final Duration? closeDelayDuration;

  /// The close icon of the tab. Usually an [IconButton] widget
  final IconData? closeIcon;

  const TabViewWindowsProperty({
    this.onNewPressed,
    this.addIconData,
    this.shortcutsEnabled,
    this.onReorder,
    this.minTabWidth,
    this.maxTabWidth,
    this.showScrollButtons,
    this.scrollController,
    this.closeButtonVisibility,
    this.tabWidthBehavior,
    this.header,
    this.footer,
    this.closeIcon,
    this.closeDelayDuration,
  });
}
