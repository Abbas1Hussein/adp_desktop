import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/common/construct/properties.dart';
import '../../pulldown_item.dart';

class PulldownMenuWindows<T> extends StatelessWidget {
  final PulldownMenuWindowsProperty? property;

  /// The list of menu items to be displayed in the menu.
  final List<AdaptivePulldownMenuItemEntry> items;

  final ValueChanged<T?>? onItemPressed;

  final String? title;

  const PulldownMenuWindows({
    super.key,
    this.title,
    this.property,
    this.onItemPressed,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      title: Text(title ?? 'menu'),
      autofocus: property?.autofocus ?? false,
      trailing: property?.trailing ?? const ChevronDown(),
      focusNode: property?.focusNode,
      leading: property?.leading,
      buttonBuilder: property?.buttonBuilder,
      closeAfterClick: property?.closeAfterClick ?? true,
      disabled: property?.disabled ?? false,
      menuColor: property?.menuColor,
      menuShape: property?.menuShape,
      onClose: property?.onClose,
      onOpen: property?.onOpen,
      placement: property?.placement ?? FlyoutPlacementMode.bottomCenter,
      transitionBuilder: property?.transitionBuilder ?? PulldownMenuWindowsProperty._defaultTransitionBuilder,
      verticalOffset: property?.verticalOffset ?? 6.0,
      items: List.generate(
        items.length,
        (index) {
          final item = items[index];
          if (item is AdaptivePulldownMenuItem<T?>) {
            return MenuFlyoutItem(
              onPressed: () => onItemPressed?.call(item.value),
              text: item.child,
              trailing: item.trailing,
              leading: item.leading,
              selected: item.selected,
            );
          }
          return const MenuFlyoutSeparator();
        },
      ),
    );
  }
}

class PulldownMenuWindowsProperty extends CoreWindowsProperty {
  /// A builder for the button. If null, a [Button] with [leading], [title] and
  /// [trailing] is used.
  ///
  /// If [disabled] is true, [DropDownButtonBuilder.onOpen] will be null
  final DropDownButtonBuilder? buttonBuilder;

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

  /// Whether the flyout will be closed after an item is tapped.
  ///
  /// This is only effective on items that are [MenuFlyoutItem]
  ///
  /// Defaults to `true`
  final bool? closeAfterClick;

  /// If `true`, the button won't be clickable.
  final bool? disabled;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool? autofocus;

  /// The placement of the flyout.
  ///
  /// [FlyoutPlacementMode.bottomCenter] is used by default
  final FlyoutPlacementMode? placement;

  /// The menu shape
  final ShapeBorder? menuShape;

  /// The menu color. If null, [FluentThemeData.menuColor] is used
  final Color? menuColor;

  /// Called when the flyout is opened
  final VoidCallback? onOpen;

  /// Called when the flyout is closed
  final VoidCallback? onClose;

  final FlyoutTransitionBuilder? transitionBuilder;

  const PulldownMenuWindowsProperty({
    this.buttonBuilder,
    this.leading,
    this.trailing,
    this.verticalOffset,
    this.closeAfterClick,
    this.disabled,
    this.focusNode,
    this.autofocus,
    this.placement,
    this.menuShape,
    this.menuColor,
    this.onOpen,
    this.onClose,
    this.transitionBuilder,
  });

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
