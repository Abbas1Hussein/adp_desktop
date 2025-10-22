import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart' as m;

class IconFromPreview extends StatelessWidget {
  const IconFromPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdaptiveIcon.from(
          wICON: m.Icons.camera_alt,
          mICON: CupertinoIcons.camera_fill,
        ),
        AdaptiveIcon.from(
          wICON: CupertinoIcons.settings,
          mICON: m.Icons.settings,
        ),
        AdaptiveIcon.from(
          wICON: m.Icons.airplanemode_on_sharp,
          mICON: CupertinoIcons.airplane,
        ),
      ],
    );
  }
}
