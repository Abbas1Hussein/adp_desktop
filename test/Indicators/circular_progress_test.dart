import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaults();


  testWidgets('AdaptiveCircularProgressIndicator renders correctly with value', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapApp(
        child: AdaptiveCircularProgressIndicator(
          value: 50, // You can set any value between 0 and 100.
          activeColor: AdpColors.green,
          inactiveColor: AdpColors.gray,
          semanticLabel: 'Loading...',
        ),
      ),
    );

    adaptiveValue(
      macos: () {
        expect(find.byType(ProgressCircle), findsOneWidget);

        expect(find.byType(CupertinoActivityIndicator), findsNothing);
        expect(find.byType(ProgressRing), findsNothing);
      },
      windows: () {
        expect(find.byType(ProgressRing), findsOneWidget);

        expect(find.byType(ProgressCircle), findsNothing);
        expect(find.byType(CupertinoActivityIndicator), findsNothing);
      },
    );
  });

  testWidgets('AdaptiveCircularProgressIndicator renders correctly without value', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapApp(child: const AdaptiveCircularProgressIndicator()),
    );

    adaptiveValue(
      macos: () {
        expect(find.byType(CupertinoActivityIndicator), findsOneWidget);

        expect(find.byType(ProgressCircle), findsNothing);
        expect(find.byType(ProgressRing), findsNothing);
      },
      windows: () {
        expect(find.byType(ProgressRing), findsOneWidget);

        expect(find.byType(ProgressCircle), findsNothing);
        expect(find.byType(CupertinoActivityIndicator), findsNothing);
      },
    );
  });
}
