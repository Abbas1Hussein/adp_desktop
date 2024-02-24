import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart' show Icons, MaterialLocalizations;
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';

class HighlightViewCode extends StatelessWidget {
  const HighlightViewCode({super.key, this.style, required this.path});

  final String path;
  final HighlightStyle? style;

  @override
  Widget build(BuildContext context) {
    final highlightStyle = style ??
        (context.brightness.isDark
            ? HighlightStyle.a11yDark
            : HighlightStyle.schoolBook);

    final localizations = MaterialLocalizations.of(context);

    return FutureBuilder(
      future: rootBundle.loadString(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: AdaptiveCircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdaptiveIcon(AdpIcons.cloudError, size: 34.0, color: AdpColors.red),
                const SizedBox(width: 10.0),
                Text(
                  'Failed to load code preview: ${snapshot.error}',
                  style: AdaptiveTypography.of(context).subheading,
                ),
              ],
            ),
          );
        } else {
          final codePreview = snapshot.data!;
          return SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: HighlightView(
                    codePreview,
                    language: 'dart',
                    theme: highlightStyle.theme,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AdaptiveTooltip(
                    message: localizations.copyButtonLabel,
                    child: AdaptiveIconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: codePreview),
                        );
                      },
                      icon: const AdaptiveIcon.all(Icons.copy),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

enum HighlightStyle {
  a11yDark,
  a11yLight,
  agate,
  anOldHope,
  androidStudio,
  arduinoLight,
  arta,
  ascetic,
  atelierCaveDark,
  atelierCaveLight,
  atelierDuneDark,
  atelierDuneLight,
  atelierEstuaryDark,
  atelierEstuaryLight,
  atelierForestDark,
  atelierForestLight,
  atelierHeathDark,
  atelierHeathLight,
  atelierLakesideDark,
  atelierLakesideLight,
  atelierPlateauDark,
  atelierPlateauLight,
  atelierSavannaDark,
  atelierSavannaLight,
  atelierSeasideDark,
  atelierSeasideLight,
  atelierSulphurpoolDark,
  atelierSulphurpoolLight,
  atomOneDarkReasonable,
  atomOneDark,
  atomOneLight,
  brownPaper,
  codepenEmbed,
  colorBrewer,
  darcula,
  dark,
  defaultTheme,
  docco,
  dracula,
  far,
  foundation,
  githubGist,
  github,
  gml,
  googlecode,
  gradientDark,
  grayscale,
  gruvboxDark,
  gruvboxLight,
  hopscotch,
  hybrid,
  idea,
  irBlack,
  isblEditorDark,
  isblEditorLight,
  kimbieDark,
  kimbieLight,
  lightfair,
  magula,
  monoBlue,
  monokaiSublime,
  monokai,
  nightOwl,
  nord,
  obsidian,
  ocean,
  paraisoDark,
  paraisoLight,
  pojoaque,
  purebasic,
  qtcreatorDark,
  qtcreatorLight,
  railscasts,
  rainbow,
  routeros,
  schoolBook,
  shadesOfPurple,
  solarizedDark,
  solarizedLight,
  sunburst,
  tomorrowNightBlue,
  tomorrowNightBright,
  tomorrowNightEighties,
  tomorrowNight,
  tomorrow,
  vs,
  vs2015,
  xcode,
  xt256,
  zenburn,
}

extension HighlightStyleExtantion on HighlightStyle {
  Map<String, TextStyle> get theme => themeMap.values.elementAt(index);
}
