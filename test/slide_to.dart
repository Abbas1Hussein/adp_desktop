import 'package:flutter_test/flutter_test.dart';

extension SlideTo on WidgetTester {
  Future<void> slideToValue(
    Finder slider,
    double value, {
    double paddingOffset = 24.0,
  }) async {
    final zeroPoint =
        getTopLeft(slider) + Offset(paddingOffset, getSize(slider).height / 2);

    final totalWidth = getSize(slider).width - (2 * paddingOffset);

    final calculatedOffset = value * (totalWidth / 100);

    await dragFrom(zeroPoint, Offset(calculatedOffset, 0));
  }
}
