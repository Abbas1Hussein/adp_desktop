import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../icon/icons.dart';
import 'custom_rating_Indicator.dart';

/// A custom rating indicator widget that adapts its appearance based on the platform.
///
/// Use this widget to create rating indicator with platform-specific
/// styling and behavior:
/// - On macOS, [CustomRatingBarIndicator] is utilized.
/// - On Windows, [RatingBar] is used.
class AdaptiveRatingIndicator extends CoreAdaptiveComponent {
  const AdaptiveRatingIndicator({
    super.builders,
    super.key,
    this.icon,
    this.onChanged,
    this.spacing = 2.0,
    this.amount = 5,
    this.iconSize = 20,
    this.unratedIconColor,
    this.ratedIconColor,
    this.semanticLabel,
    required this.rating,
  })  : assert(rating >= 0 && rating <= amount,
            'Rating must be between 0 and the specified amount.'),
        assert(spacing >= 0, 'Star spacing cannot be negative.'),
        assert(amount > 0, 'The amount of stars must be greater than 0.');

  /// The amount of stars in the bar. The default amount is 5.
  final int amount;

  /// The current rating of the bar.
  /// It must be more or equal to 0 and less than [amount].
  final double rating;

  /// Called when the [rating] is changed.
  final ValueChanged<double>? onChanged;

  /// The Icon used in the bar.
  final AdpIcons? icon;

  /// The color of unrated icons.
  final Color? unratedIconColor;

  /// The color of rated icons.
  final Color? ratedIconColor;

  /// The size of the icons.
  final double iconSize;

  /// The space between each icon.
  final double spacing;

  /// Semantic label for the rating indicator.
  ///
  /// Announced in accessibility modes such as TalkBack or VoiceOver.
  /// This label is not displayed in the user interface (UI).
  final String? semanticLabel;

  @override
  Widget windows(BuildContext context) {
    return RatingBar(
      amount: amount,
      rating: rating,
      iconSize: iconSize,
      icon: icon?.fluent,
      starSpacing: spacing,
      onChanged: onChanged,
      ratedIconColor: ratedIconColor,
      unratedIconColor: unratedIconColor,
      semanticLabel: semanticLabel,
    );
  }

  @override
  Widget macos(BuildContext context) {
    final theme = MacosTheme.of(context);

    final ratedColor = ratedIconColor ??
        (icon != null ? theme.primaryColor : CupertinoColors.activeOrange);

    return CustomRatingBarIndicator(
      rating: rating,
      amount: amount,
      spacing: spacing,
      onChanged: onChanged,
      iconSize: iconSize,
      icon: MacosIcon(
        icon?.cupertino ?? CupertinoIcons.star_fill,
        color: MacosDynamicColor.resolve(ratedColor, context),
        size: iconSize,
      ),
      unratedColor: MacosDynamicColor.resolve(
          unratedIconColor ?? CupertinoColors.inactiveGray, context),
      semanticLabel: semanticLabel,
    );
  }
}
