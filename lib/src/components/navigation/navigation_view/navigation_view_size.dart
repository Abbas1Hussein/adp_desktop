/// the size configuration for an adaptive navigation view.
///
/// Use this class to define constraints and initial sizes for an adaptive navigation view.
class AdaptiveNavigationViewSize {
  /// Creates an instance of [AdaptiveNavigationViewSize].
  ///
  /// The [minWidth] and [maxWidth] properties, if provided, should adhere to certain constraints.
  ///
  /// The [startWidth] property, if provided, should be between [minWidth] and [maxWidth] if both are provided.
  ///
  /// The [topOffset] property represents the top offset of the adaptive navigation view.
  const AdaptiveNavigationViewSize({
    this.minWidth,
    this.maxWidth,
    this.startWidth,
    this.topOffset,
  })  : assert(minWidth == null || maxWidth != null,
            'If minWidth is provided, maxWidth must also be provided'),
        assert(maxWidth == null || minWidth != null,
            'If maxWidth is provided, minWidth must also be provided'),
        assert(minWidth == null || maxWidth == null || minWidth <= maxWidth,
            'minWidth must not be larger than maxWidth'),
        assert(minWidth == null || startWidth == null || minWidth <= startWidth,
            'startWidth must be between minWidth and maxWidth'),
        assert(maxWidth == null || startWidth == null || startWidth <= maxWidth,
            'startWidth must be between minWidth and maxWidth');

  /// The minimum width that the adaptive navigation view can have.
  ///
  /// If provided, [maxWidth] must also be provided, and [minWidth] should not be larger than [maxWidth].
  final double? minWidth;

  /// The maximum width that the adaptive navigation view can have.
  ///
  /// If provided, [minWidth] must also be provided, and [minWidth] should not be larger than [maxWidth].
  final double? maxWidth;

  /// The initial width of the adaptive navigation view.
  ///
  /// If both [minWidth] and [maxWidth] are provided, [startWidth] must be between them.
  final double? startWidth;

  /// The top offset of the adaptive navigation view.
  final double? topOffset;
}
