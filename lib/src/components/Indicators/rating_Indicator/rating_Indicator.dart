import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import 'custom_rating_Indicator.dart';

class AdaptiveRatingIndicator extends CoreAdaptiveComponent {
  /// The amount of stars in the bar. The default amount is 5.
  final int amount;

  /// The current rating of the bar.
  /// It must be more or equal to 0 and less than [amount].
  final double rating;

  /// Called when the [rating] is changed.
  final ValueChanged<double>? onChanged;

  /// The icon used in the bar.
  final IconData? icon;

  /// The color of unrated icons.
  final Color? unratedIconColor;

  /// The color of rated icons.
  final Color? ratedIconColor;

  /// The size of the icons.
  final double iconSize;

  /// The space between each icon.
  final double spacing;

  const AdaptiveRatingIndicator({
    super.builders,
    super.key,
    this.icon,
    this.onChanged,
    this.spacing = 2.0,
    this.amount = 5,
    this.iconSize = 16,
    this.unratedIconColor,
    this.ratedIconColor,
    required this.rating,
  })  : assert(rating >= 0 && rating <= amount, 'Rating must be between 0 and the specified amount.'),
        assert(spacing >= 0, 'Star spacing cannot be negative.'),
        assert(amount > 0, 'The amount of stars must be greater than 0.');

  @override
  Widget windows(BuildContext context) {
    return RatingBar(
      amount: amount,
      rating: rating,
      iconSize: iconSize,
      icon: icon,
      starSpacing: spacing,
      onChanged: onChanged,
      ratedIconColor: ratedIconColor,
      unratedIconColor: unratedIconColor,
    );
  }

  @override
  Widget macos(BuildContext context) {
    return CustomRatingBarIndicator(
      rating: rating,
      amount: amount,
      spacing: spacing,
      onChanged: onChanged,
      iconSize: iconSize,
      icon: MacosIcon(
        icon ?? CupertinoIcons.star_fill,
        color: MacosDynamicColor.resolve(ratedIconColor ?? CupertinoColors.activeOrange, context),
        size: iconSize,
      ),
      unratedColor: MacosDynamicColor.resolve(unratedIconColor ?? CupertinoColors.inactiveGray, context),
    );
  }
}
