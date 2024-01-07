import 'package:flutter/widgets.dart';

abstract class CoreModel<W, M> {
  const CoreModel();


  W toWindows(BuildContext context);

  M toMacos(BuildContext context);

// W fromWindows(W windows) => throw UnimplementedError;
// M fromMacos(M macos) => throw UnimplementedError;
}
