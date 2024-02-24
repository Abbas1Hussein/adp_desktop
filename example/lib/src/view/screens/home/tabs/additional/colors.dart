import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart';

class ColorsPreview extends StatelessWidget {
  const ColorsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _getColorInfoList().map((colorInfo) {
        return SizedBox(
          height: 60,
          width: 60,
          child: AdaptiveTooltip(
            message: colorInfo.name,
            child: Card(color: colorInfo.color,),
          ),
        );
      }).toList(),
    );
  }

  List<ColorInfo> _getColorInfoList() {
    return [
      ColorInfo(AdpColors.green, 'AdpColors.green'),
      ColorInfo(AdpColors.teal, 'AdpColors.teal'),
      ColorInfo(AdpColors.cyan, 'AdpColors.cyan'),
      ColorInfo(AdpColors.red, 'AdpColors.red'),
      ColorInfo(AdpColors.orange, 'AdpColors.orange'),
      ColorInfo(AdpColors.gray, 'AdpColors.gray'),
      ColorInfo(AdpColors.yellow, 'AdpColors.yellow'),
      ColorInfo(AdpColors.magenta, 'AdpColors.magenta'),
      ColorInfo(AdpColors.blue, 'AdpColors.blue'),
      ColorInfo(AdpColors.purple, 'AdpColors.purple'),
      const ColorInfo(AdpColors.black, 'AdpColors.black'),
      const ColorInfo(AdpColors.white, 'AdpColors.white'),
    ];
  }
}

class ColorInfo {
  const ColorInfo(this.color, this.name);

  final String name;
  final Color color;
}
