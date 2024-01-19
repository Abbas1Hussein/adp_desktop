import 'package:flutter/material.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  /// Creates a read only rating bar indicator.
  const CustomRatingBarIndicator({
    this.onChanged,
    this.spacing = 0,
    this.iconSize = 16,
    this.semanticLabel,
    required this.amount,
    required this.rating,
    required this.icon,
    required this.unratedColor,
    super.key,
  });

  /// The icon used for rating.
  final Widget icon;

  /// The number of items in the rating bar.
  final int amount;

  /// The color for unrated items.
  final Color unratedColor;

  /// The spacing between items.
  final double spacing;

  /// The size of the rating icon.
  final double iconSize;

  /// The current rating value.
  final double rating;

  /// Callback when the rating is changed.
  final ValueChanged<double>? onChanged;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  bool get isDisabled => onChanged == null;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      slider: onChanged != null,
      value: rating.toStringAsFixed(2),
      label: semanticLabel,
      maxValueLength: amount,
      focusable: true,
      child: GestureDetector(
        onTapDown: (d) => _handleUpdate(d.localPosition.dx),
        onHorizontalDragStart: (d) => _handleUpdate(d.localPosition.dx),
        onHorizontalDragUpdate: (d) => _handleUpdate(d.localPosition.dx),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(amount, (index) => _buildItems(index)),
        ),
      ),
    );
  }

  Widget _buildItems(int index) {
    final bool isRated = index <= rating;
    return Padding(
      padding: EdgeInsetsDirectional.only(end: spacing),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(unratedColor, BlendMode.srcIn),
                child: icon,
              ),
              if (isRated)
                ClipRect(
                  clipper: _StarClipper(isRated ? rating - index : rating - 1),
                  child: icon,
                ),
            ],
          );
        },
      ),
    );
  }

  void _handleUpdate(double x) {
    final iSize = iconSize;
    final value = (x / iSize) - (spacing / amount);

    if (value >= 0 && value <= amount) {
      onChanged?.call(value);
    }
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double value;

  _StarClipper(this.value);

  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width * value, size.height);
    return rect;
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) => oldClipper.value != value;
}
