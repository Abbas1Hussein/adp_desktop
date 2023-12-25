// import 'package:adp_desktop/adp_desktop.dart';
// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:macos_ui/macos_ui.dart';
//
// import '../wrap_app.dart';
//
// void main() {
//   initializeDesktopDefaults(DesktopTargetPlatform.windows);
//
//   late List<AdaptiveNABActionEntry>? actions;
//
//   setUp(
//     () {
//       // Initialize the actions list with some data for testing
//       actions = [
//         AdaptiveNABIconButton(
//           label: 'Action 1',
//           icon: const AdaptiveIcon(AdpIcons.star),
//           onPressed: () {},
//         ),
//         const AdaptiveNABDivider(),
//         AdaptiveNABPulldownButton(
//           label: 'Action 2',
//           icon: AdpIcons.drop.platform,
//           items: [
//             AdaptivePulldownMenuItem(
//               child: const Text('Option 1'),
//               onTap: () {},
//             ),
//             AdaptivePulldownMenuItem(
//               child: const Text('Option 2'),
//               onTap: () {},
//             ),
//           ],
//         ),
//         const AdaptiveNABDivider(),
//       ];
//     },
//   );
//
//   testWidgets(
//     'AdaptiveNavigationAppBar should render correctly',
//     (widgetTester) async {
//       await widgetTester.pumpWidget(
//         wrapApp(
//           child: AdaptiveNavigationView(
//             navigationAppBar: AdaptiveNavigationAppBar(actions: actions),
//             items: const [],
//             children: const [],
//           ),
//         ),
//       );
//
//       await widgetTester.pumpAndSettle();
//
//       adaptiveValue(
//         macos: () {
//           expect(find.byType(ToolBar), findsOneWidget);
//           expect(find.byType(NavigationAppBar), findsNothing);
//         },
//         windows: () {
//           expect(find.byType(ToolBar), findsNothing);
//           expect(find.byType(NavigationAppBar), findsOneWidget);
//         },
//       );
//     },
//   );
//
//   testWidgets(
//     'AdaptiveNavigationAppBar with entry actions should render correctly',
//     (widgetTester) async {
//       await widgetTester.pumpWidget(
//         wrapApp(
//           child: AdaptiveNavigationView(
//             navigationAppBar: AdaptiveNavigationAppBar(actions: actions),
//             items: const [],
//             children: const [],
//           ),
//         ),
//       );
//
//       await widgetTester.pumpAndSettle();
//
//       expect(find.byType(AdaptiveNABIconButton), findsOneWidget);
//       expect(find.byType(AdaptiveNABPulldownButton), findsOneWidget);
//       expect(find.byType(AdaptiveNABDivider), findsWidgets);
//     },
//   );
// }
