import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/widgets.dart';

Widget wrapApp({required Widget child}) {
  return AdpApp(home: child);
}

Widget wrapAppWithScaffold({
  required Widget child,
}) {
  return wrapApp(child: AdaptiveScaffold(body: child));
}
