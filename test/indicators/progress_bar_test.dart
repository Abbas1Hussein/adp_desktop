import 'package:adp_desktop/adp_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveProgressBarIndicator renders correctly with value',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(child: const AdaptiveProgressBarIndicator(value: 50)),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(macos_ui.ProgressBar), findsOneWidget);
          expect(find.byType(ProgressBar), findsNothing);
        },
        windows: () {
          expect(find.byType(ProgressBar), findsOneWidget);
          expect(find.byType(macos_ui.ProgressBar), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveProgressBarIndicator renders correctly without value',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapApp(child: const AdaptiveProgressBarIndicator()),
      );

      adaptiveValue(
        macos: () {
          expect(find.byType(macos_ui.ProgressBar), findsOneWidget);
          expect(find.byType(ProgressBar), findsNothing);
        },
        windows: () {
          expect(find.byType(ProgressBar), findsOneWidget);
          expect(find.byType(macos_ui.ProgressBar), findsNothing);
        },
      );
    },
  );

  testWidgets(
    'AdaptiveProgressBarIndicator increase and decrease value',
    (WidgetTester tester) async {
      double progressValue = 0;

      await tester.pumpWidget(
        wrapAppWithScaffold(
          child: Center(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AdaptiveProgressBarIndicator(value: progressValue),
                    AdaptiveButton(
                      onPressed: () {
                        setState(() {
                          progressValue = 100;
                        });
                      },
                      child: const Text('Increase'),
                    ),
                    AdaptiveButton(
                      onPressed: () {
                        setState(() {
                          progressValue = 0;
                        });
                      },
                      child: const Text('Decrease'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(progressValue, 0.0);

      // Increase value
      await tester.tap(find.text('Increase'));
      await tester.pumpAndSettle();

      expect(progressValue, 100.0);

      // Decrease value
      await tester.tap(find.text('Decrease'));
      await tester.pumpAndSettle();

      expect(progressValue, 0.0);
    },
  );
}
