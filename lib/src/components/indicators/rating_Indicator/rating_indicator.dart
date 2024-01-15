import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../core/common/construct/component.dart';
import '../../../core/common/construct/property.dart';
import '../../../core/extension/widget.dart';
import '../../icon/icons.dart';
import 'custom_rating_indicator.dart';

const kRatingBarIcon = AdpIcons.starFilled;

/// The rating bar allows users to view and set ratings that
/// reflect degrees of satisfaction with content and services.
/// Users can interact with the rating control with touch, pen,
/// mouse, gamepad or keyboard. The follow guidance shows how to
/// use the rating control's features to provide flexibility and
/// customization.
///
/// Use this widget to create rating indicator with platform-specific
/// styling and behavior:
/// - On macOS, [CustomRatingBarIndicator] is utilized.
/// - On Windows, [RatingBar] is used.
class AdaptiveRatingIndicator extends CoreAdaptiveComponent {
  /// Creates a adp rating bar.
  ///
  /// [rating] must be greater than 0 and less than [amount]
  ///
  /// [starSpacing] and [amount] must be greater than 0
  ///
  /// See also:
  ///
  ///   * [Slider] lets the user select from a range of values by moving a thumb control along a track.
  const AdaptiveRatingIndicator({
    super.builders,
    super.key,
    this.onChanged,
    this.spacing = 2.0,
    this.iconSize = 20,
    this.unratedIconColor,
    this.ratedIconColor,
    this.semanticLabel,
    this.icon = kRatingBarIcon,
    required this.amount,
    required this.rating,
  })  : assert(rating >= 0 && rating <= amount,
            'Rating must be between 0 and the specified amount.'),
        assert(spacing >= 0, 'Star spacing cannot be negative.'),
        assert(amount > 0, 'The amount of stars must be greater than 0.');

  /// The amount of stars in the bar.
  final int amount;

  /// The current rating of the bar.
  ///
  /// It must be more or equal to 0 and less than [amount]
  final double rating;

  /// The space between each icon.
  final double spacing;

  /// The icon used in the bar. If `null`, uses [kRatingBarIcon]
  final AdpIcons icon;

  /// The size of the icon. If `null`, uses 20px.
  final double iconSize;

  /// The color of the icons that are rated.
  ///
  /// If `null`, uses [AdpColors.orange].
  final Color? ratedIconColor;

  /// The color of the icons that are not rated.
  final Color? unratedIconColor;

  /// Called when the [rating] is changed.
  /// If this is `null`, the RatingBar will not detect touch inputs
  final ValueChanged<double>? onChanged;

  /// Semantic label for the rating indicator.
  ///
  /// Announced in accessibility modes such as TalkBack or VoiceOver.
  /// This label is not displayed in the user interface (UI).
  final String? semanticLabel;

  @override
  Widget windows(BuildContext context, [CoreWindowsProperty? property]) {
    return RatingBar(
      amount: amount,
      rating: rating,
      icon: icon.fluent,
      iconSize: iconSize,
      onChanged: onChanged,
      starSpacing: spacing,
      semanticLabel: semanticLabel,
      unratedIconColor: unratedIconColor,
      ratedIconColor: ratedIconColor ?? Colors.orange,
    );
  }

  @override
  Widget macos(BuildContext context, [CoreMacosProperty? property]) {
    final ratedColor = ratedIconColor ?? CupertinoColors.activeOrange;

    return CustomRatingBarIndicator(
      rating: rating,
      amount: amount,
      spacing: spacing,
      onChanged: onChanged,
      iconSize: iconSize,
      icon: MacosIcon(
        icon.cupertino,
        size: iconSize,
        color: MacosDynamicColor.resolve(ratedColor, context),
      ),
      unratedColor: MacosDynamicColor.resolve(
          unratedIconColor ?? CupertinoColors.inactiveGray, context),
      semanticLabel: semanticLabel,
    ).applyDisabledEffect(onChanged == null, 0.2);
  }
}
