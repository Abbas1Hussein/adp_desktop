import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}


class _CustomWidgetState extends State<CustomWidget> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdaptiveTooltip(
        message: 'copy',
        child: AdaptiveIconButton(
          onPressed: () {},
          icon: const AdaptiveIcon.all(Icons.copy),
        ),
      ),
    );
  }
}
