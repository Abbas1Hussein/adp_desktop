import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveValuePreview extends StatelessWidget {
  const AdaptiveValuePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton.filled(
        child: Text(
          PlatformRuining.isMacos
              ? 'show cupertino Alert-Dialog'
              : 'show material License-Page',
        ),
        onPressed: () => adaptiveValue(
          // handel some things on macOS.
          macos: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text(DummyText.generateQuestion),
                  content: Text(DummyText.generateAnswer),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('cancel'),
                    ),
                  ],
                );
              },
            );
          },
          // handel some things on Windows.
          windows: () => showLicensePage(context: context),
        ),
      ),
    );
  }
}
