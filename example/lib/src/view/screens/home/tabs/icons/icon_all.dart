import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart' as m;

class IconAllPreview extends StatelessWidget {
  const IconAllPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveIcon.all(m.Icons.flutter_dash_sharp),
        AdaptiveIcon.all(m.Icons.home),
        AdaptiveIcon.all(m.Icons.search),
      ],
    );
  }
}
