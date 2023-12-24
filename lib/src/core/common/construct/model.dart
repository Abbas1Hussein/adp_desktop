import 'package:flutter/widgets.dart';

abstract class CoreModel<W, M> {
  const CoreModel();

  W toWindows(BuildContext context);

  // fromWindows(W w) {}

  M toMacos(BuildContext context);
// fromMacos(M m) {}
}
