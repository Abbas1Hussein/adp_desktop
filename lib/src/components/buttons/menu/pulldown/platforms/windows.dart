import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/properties.dart';
import '../pulldown_item.dart';
import '../single_choice.dart';

class PulldownMenuWindows<T> extends StatelessWidget {
  const PulldownMenuWindows({
    super.key,
    this.property,
    this.onSelected,
    this.autofocus,
    this.focusNode,
    this.onOpen,
    this.disabled,
    this.disabledTitle,
    required this.selectionType,
    required this.title,
    required this.items,
  });

  /// Additional properties for configuring the appearance and behavior of the pulldown menu.
  final PulldownMenuWindowsProperty? property;

  /// The title text to be displayed on the pulldown button.
  final String title;

  /// Callback function invoked when a menu item is selected. The generic type `T` represents the type of the selected value.
  final ValueChanged<T?>? onSelected;

  /// The list of menu items to be displayed in the menu.
  ///
  /// Use:
  /// * [AdaptivePulldownMenuItem] for selectable items.
  /// * [AdaptivePulldownMenuDivider] for visual separators.
  final List<AdaptivePulldownMenuItemEntry> items;

  /// {@macro flutter.widgets.Focus.focusNode}
  /// The focus node to control the focus behavior of the pulldown menu.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  /// If true, the pulldown menu will automatically focus when displayed.
  final bool? autofocus;

  /// If [disabled] is true, the pulldown button will not be clickable.
  /// If null, the [title] will be used as a fallback.
  final String? disabledTitle;

  /// If true, the pulldown button won't be clickable. Default is false.
  final bool? disabled;

  /// Callback function invoked when the pulldown button is tapped.
  /// The callback will not be invoked if the pulldown button is disabled.
  final VoidCallback? onOpen;

  final SelectionType selectionType;

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      onOpen: onOpen,
      focusNode: focusNode,
      closeAfterClick: false,
      disabled: disabled ?? false,
      autofocus: autofocus ?? false,
      trailing: const ChevronDown(),
      menuColor: property?.menuColor,
      menuShape: property?.menuShape,
      items: _buildListPulldown(context),
      title: Text(disabled == true ? disabledTitle ?? title : title),
      placement: property?.placement ?? FlyoutPlacementMode.bottomCenter,
      verticalOffset: property?.verticalOffset ?? 6.0,
      transitionBuilder: property?.transitionBuilder ??
          PulldownMenuWindowsProperty._defaultTransitionBuilder,
    );
  }

  List<MenuFlyoutItemBase> _buildListPulldown(BuildContext context) {
    return List.generate(
      items.length,
      (index) {
        final item = items[index];
        if (item is AdaptivePulldownMenuItem<T?>) {
          final defaultSelected = item.selected ?? selectionType == SelectionType.none;

          switch (selectionType) {
            case SelectionType.none:
              return _menuFlyoutItemSingleSelection(defaultSelected, item, context);
            case SelectionType.single:
              return _menuFlyoutItemNoneSelection(defaultSelected, item, context);
          }
        }
        return const MenuFlyoutSeparator();
      },
    );
  }

  MenuFlyoutItem _menuFlyoutItemSingleSelection(
    bool defaultSelected,
    AdaptivePulldownMenuItem<T?> item,
    BuildContext context,
  ) {
    return MenuFlyoutItem(
      onPressed: defaultSelected ? () => onPressed(item, context) : null,
      text: AdaptivePulldownMenuItem.disabledOpacity(
        item.child,
        defaultSelected,
      ),
      trailing: AdaptivePulldownMenuItem.disabledOpacity(
        item.trailing,
        defaultSelected,
      ),
      leading: AdaptivePulldownMenuItem.disabledOpacity(
        item.leading,
        defaultSelected,
      ),
    );
  }

  MenuFlyoutItem _menuFlyoutItemNoneSelection(
    bool defaultSelected,
    AdaptivePulldownMenuItem<T?> item,
    BuildContext context,
  ) {
    return MenuFlyoutItem(
      onPressed: () => onPressed(item, context),
      selected: defaultSelected,
      text: item.child,
      trailing: item.trailing,
      leading: item.leading,
    );
  }

  void onPressed(AdaptivePulldownMenuItem<T?> item, BuildContext context) {
    onSelected?.call(item.value);
    item.onTap?.call();
    Navigator.pop(context);
  }
}

class PulldownMenuWindowsProperty extends CoreWindowsProperty {
  const PulldownMenuWindowsProperty({
    this.verticalOffset,
    this.menuShape,
    this.menuColor,
    this.placement,
    this.transitionBuilder,
  });

  /// The space between the button and the flyout.
  ///
  /// 6.0 is used by default
  final double? verticalOffset;

  /// The menu shape
  final ShapeBorder? menuShape;

  /// The menu color. If null, [FluentThemeData.menuColor] is used
  final Color? menuColor;

  /// The placement of the flyout.
  ///
  /// [FlyoutPlacementMode.bottomCenter] is used by default
  final FlyoutPlacementMode? placement;

  /// A builder for customizing the transition animation of the pulldown menu.
  final FlyoutTransitionBuilder? transitionBuilder;

  /// The default transition builder used if none is provided.
  static Widget _defaultTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    FlyoutPlacementMode placement,
    Widget flyout,
  ) {
    assert(debugCheckHasFluentTheme(context));
    assert(debugCheckHasDirectionality(context));
    final textDirection = Directionality.of(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        /// On the slide animation, we make use of a [ClipRect] to ensure
        /// only the necessary parts of the widgets will be visible. Altough,
        /// [ClipRect] clips all the borders of the widget, not only the necessary
        /// parts, hiding any shadow the [flyout] may have. To avoid this issue,
        /// we show the flyout independent when the animation is complated (1.0)
        /// or dismissed (0.0)
        if (animation.isCompleted || animation.isDismissed) return child!;

        if (animation.status == AnimationStatus.reverse) {
          return FadeTransition(opacity: animation, child: child!);
        }

        switch (placement) {
          case FlyoutPlacementMode.bottomCenter:
          case FlyoutPlacementMode.bottomLeft:
          case FlyoutPlacementMode.bottomRight:
            return ClipRect(
              child: SlideTransition(
                textDirection: textDirection,
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: const Offset(0, 0),
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: FluentTheme.of(context).animationCurve,
                )),
                child: child,
              ),
            );
          case FlyoutPlacementMode.topCenter:
          case FlyoutPlacementMode.topLeft:
          case FlyoutPlacementMode.topRight:
            return ClipRect(
              child: SlideTransition(
                textDirection: textDirection,
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: const Offset(0, 0),
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: FluentTheme.of(context).animationCurve,
                )),
                child: child,
              ),
            );
          default:
            return child!;
        }
      },
      child: flyout,
    );
  }
}
