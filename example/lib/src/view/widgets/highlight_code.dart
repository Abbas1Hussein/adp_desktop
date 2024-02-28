import 'package:adp_desktop/adp_desktop.dart';
import 'package:custom_text/custom_text.dart';
import 'package:flutter/material.dart'
    show Icons, MaterialLocalizations, SelectionArea;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/dart_definitions.dart';
import '../../utils/language_parser.dart';

class HighlightViewCode extends StatelessWidget {
  const HighlightViewCode({
    super.key,
    required this.title,
    required this.path,
  });

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: AdaptiveAppBarPage(
        title: Text(title),
        actions: [
          AdaptiveActionButton(
            label: 'View on GitHub',
            icon: const AdaptiveIcon(AdpIcons.link),
            onPressed: () => launchUrlString(_buildGitHubUrl()),
          ),
        ],
      ),
      content: _buildFutureBuilder(path),
    );
  }

  String _buildGitHubUrl() {
    final pathUrlSplit = path.split('/');
    return 'https://github.com/Abbas1Hussein/adp_desktop/blob/master/example/lib/src/view/screens/home/tabs/${pathUrlSplit[6]}/${pathUrlSplit.last}';
  }

  Widget _buildFutureBuilder(String path) {
    return FutureBuilder(
      future: rootBundle.loadString(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: AdaptiveCircularProgressIndicator());
        }
        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return _buildErrorWidget(context, snapshot.error.toString());
        }
        final code = snapshot.data!;
        return _buildCodeView(context, code);
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, String error) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdaptiveIcon(
            AdpIcons.cloudError,
            size: 34.0,
            color: AdpColors.red,
          ),
          const SizedBox(width: 10.0),
          Text(
            'Failed to load code preview: $error',
            style: AdaptiveTypography.of(context).subheading,
          ),
        ],
      ),
    );
  }

  Widget _buildCodeView(BuildContext context, String code) {
    final localizations = MaterialLocalizations.of(context);

    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          SafeArea(
            child: SelectionArea(
              child: SizedBox(
                width: double.infinity,
                child: AdaptiveScrollbar(
                  thickness: 8.0,
                  child: CustomText(
                    code,
                    parserOptions: ParserOptions.external(
                      (text) => parseLanguage(text, language: 'dart'),
                    ),
                    style: AdaptiveTypography.of(context).body,
                    definitions: dartDefinitions,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AdaptiveTooltip(
              message: localizations.copyButtonLabel,
              child: AdaptiveIconButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: code));
                },
                icon: const AdaptiveIcon.all(Icons.copy),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
