import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class ProgressBarMacos extends StatelessWidget {
  const ProgressBarMacos({
    super.key,
    this.value,
    this.height = 4.5,
    this.trackColor,
    this.backgroundColor,
    this.semanticLabel,
  });

  /// The value of the progress bar.
  ///
  /// If non-null, this has to be non-negative and less the 100.
  /// If null, the progress bar will be considered indeterminate.
  final double? value;

  /// The height of the line. Default to 4.5px
  final double height;

  /// The color of the track. If null, [MacosThemeData.accentColor] is used
  final Color? trackColor;

  /// The color of the background. If null, [CupertinoColors.secondarySystemFill]
  /// is used
  final Color? backgroundColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return ProgressBar(
        value: value!,
        height: height,
        backgroundColor: backgroundColor,
        semanticLabel: semanticLabel,
        trackColor: trackColor,
      );
    } else {
      return IndeterminateProgressBar(
        height: height,
        backgroundColor: backgroundColor,
        semanticLabel: semanticLabel,
        trackColor: trackColor,
      );
    }
  }
}

class IndeterminateProgressBar extends StatefulWidget {
  const IndeterminateProgressBar({
    Key? key,
    this.trackColor,
    this.height = 4.5,
    this.semanticLabel,
    this.backgroundColor,
  }) : super(key: key);

  /// The height of the line. Default to 4.5px
  final double height;

  /// The color of the track. If null, [MacosThemeData.accentColor] is used
  final Color? trackColor;

  /// The color of the background. If null, [CupertinoColors.secondarySystemFill]
  /// is used
  final Color? backgroundColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  @override
  IndeterminateProgressBarState createState() {
    return IndeterminateProgressBarState();
  }
}

class IndeterminateProgressBarState extends State<IndeterminateProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const int _kIndeterminateLinearDuration = 1300;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 100,
      duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ProgressBar(
          height: widget.height,
          value: _controller.value,
          trackColor: widget.trackColor,
          semanticLabel: widget.semanticLabel,
          backgroundColor: widget.backgroundColor,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
