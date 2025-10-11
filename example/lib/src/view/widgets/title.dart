import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart' show MaterialLocalizations;

import 'highlight_code.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    this.path,
    this.useBackgroundColor = false,
    required this.message,
    required this.title,
  });

  final String? path;
  final String title;
  final String message;

  final bool useBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: AdaptiveListTile(
        onTap: () {
          DialogPresenter.showCustomDialog(
            context,
            child: AdaptiveDialog(
              title: Text(title),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: message.split('\n').map(
                  (line) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(line),
                    );
                  },
                ).toList(),
              ),
              primary: AdaptiveButton(
                child: Text(localizations.cancelButtonLabel),
                onPressed: () => Navigator.pop(context, true),
              ),
              secondary: path != null
                  ? AdaptiveButton(
                      child: const Text('Source code'),
                      onPressed: () {
                        _buildHighlightViewCode(context);
                      },
                    )
                  : null,
            ),
          );
        },
        title: Text(title),
        useBackgroundColor: useBackgroundColor,
        //subtitle: message != null ? Text(message!) : null,
      ),
    );
  }

  void _buildHighlightViewCode(BuildContext context) {
    Navigator.push(
      context,
      AdaptivePageRoute(
        transition: AdaptiveTransition.entrance,
        builder: (context, animation, secondaryAnimation) {
          return HighlightViewCode(title: title, path: path ?? '');
        },
      ),
    );
  }
}
