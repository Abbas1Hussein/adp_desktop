import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/common/construct/property.dart';
import '../../../../../core/extension/widget.dart';
import '../pulldown_item.dart';
import '../single_choice.dart';

class PulldownMenuWindows<T> extends StatelessWidget {
  const PulldownMenuWindows({
    super.key,
    this.property,
    this.onSelected,
    this.autofocus,
    this.focusNode,
    this.menuColor,
    this.onOpen,
    this.disabled,
    this.disabledTitle,
    required this.selectionType,
    required this.title,
    required this.items,
  });

  /// Additional properties for configuring the appearance and behavior of the pulldown menu.
  final PulldownMenuWindowsProperty? property;

  /// invoked when a menu item is selected. The generic type `T` represents the type of the selected value.
  final PulldownMenuSelectedCallback<T?>? onSelected;

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

  /// The title text to be displayed on the pulldown button.
  final String title;

  /// If true, the pulldown button won't be clickable. Default is false.
  final bool? disabled;

  /// If [disabled] is true, the pulldown button will not be clickable.
  /// If null, the [title] will be used as a fallback.
  final String? disabledTitle;

  /// Callback function invoked when the pulldown button is tapped.
  /// The callback will not be invoked if the pulldown button is disabled.
  final VoidCallback? onOpen;

  /// The menu color. If null, [FluentThemeData.menuColor] is used
  final Color? menuColor;

  final SelectionType selectionType;

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      onOpen: onOpen,
      focusNode: focusNode,
      menuColor: menuColor,
      leading: property?.leading,
      disabled: disabled ?? false,
      autofocus: autofocus ?? false,
      menuShape: property?.menuShape,
      items: _buildListPulldown(context),
      trailing: property?.trailing ?? const ChevronDown(),
      title: Text(disabled == true ? disabledTitle ?? '' : title),
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
          final defaultSelected =
              item.enabled ?? selectionType == SelectionType.none;

          switch (selectionType) {
            case SelectionType.none:
              return _menuFlyoutItemNoneSelection(
                item: item,
                index: index,
                context: context,
                isDisabled: !defaultSelected,
              );

            case SelectionType.single:
              return _menuFlyoutItemSingleSelection(
                item: item,
                index: index,
                context: context,
                selected: defaultSelected,
              );
          }
        }
        return const MenuFlyoutSeparator();
      },
    );
  }

  MenuFlyoutItem _menuFlyoutItemNoneSelection({
    required int index,
    required bool isDisabled,
    required BuildContext context,
    required AdaptivePulldownMenuItem<T?> item,
  }) {
    return MenuFlyoutItem(
      text: item.child.applyDisabledEffect(isDisabled),
      trailing: item.trailing?.applyDisabledEffect(isDisabled),
      leading: item.leading?.applyDisabledEffect(isDisabled),
      onPressed: !isDisabled ? () => _handelPressedItem(index, item, context) : null,
    );
  }

  MenuFlyoutItem _menuFlyoutItemSingleSelection({
    required int index,
    required bool selected,
    required BuildContext context,
    required AdaptivePulldownMenuItem<T?> item,
  }) {
    return MenuFlyoutItem(
      text: item.child,
      selected: selected,
      leading: item.leading,
      trailing: item.trailing,
      onPressed: () => _handelPressedItem(index, item, context),
    );
  }

  void _handelPressedItem(
    int index,
    AdaptivePulldownMenuItem<T?> item,
    BuildContext context,
  ) {
    onSelected?.call(index, item.value);
    item.onTap?.call();
  }
}

class PulldownMenuWindowsProperty extends CoreWindowsProperty {
  const PulldownMenuWindowsProperty({
    this.leading,
    this.trailing,
    this.menuShape,
    this.placement,
    this.verticalOffset,
    this.transitionBuilder,
  });

  /// The content at the start of this widget.
  ///
  /// Usually an [Icon]
  final Widget? leading;

  /// Trailing show a content at the right of this widget.
  ///
  /// If null, a chevron_down icon is displayed.
  ///
  /// Usually an [Icon] widget
  final Widget? trailing;

  /// The space between the button and the flyout.
  ///
  /// 6.0 is used by default
  final double? verticalOffset;

  /// The menu shape
  final ShapeBorder? menuShape;

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
