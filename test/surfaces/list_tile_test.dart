import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveListTile should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child:  AdaptiveListTile(
            onTap: () {},
            title: const Text('title'),
            leading: const Text('leading'),
            trailing: const Text('trailing'),
            subtitle: const Text('subtitle'),
          ),
        ),
      );
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosListTile), findsOneWidget);
          expect(find.byType(ListTile), findsNothing);
        },
        windows: () {
          expect(find.byType(ListTile), findsOneWidget);
          expect(find.byType(MacosListTile), findsNothing);
        },
      );
    },
  );


}
