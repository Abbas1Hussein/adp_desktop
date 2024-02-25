import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

import '../wrap_app.dart';

void main() {
  initializeDesktopDefaultsTests();

  testWidgets(
    'AdaptiveBottomSheet should render correctly',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapApp(
          child: Builder(
            builder: (context) {
              return AdaptiveButton(
                child: const Text('Show BottomSheet'),
                onPressed: () {
                  showAdpBottomSheet(
                    context: context,
                    builder: (context) => AdaptiveBottomSheet(
                      child: Column(
                        children: [
                          Text(DummyText.generateQuestion),
                          Text(DummyText.generateAnswer),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

      await widgetTester.tap(find.text('Show BottomSheet'));
      await widgetTester.pumpAndSettle();

      adaptiveValue(
        macos: () {
          expect(find.byType(MacosSheet), findsOneWidget);
        },
        windows: () {
          expect(find.byType(MacosSheet), findsNothing);
        },
      );
    },
  );
}
