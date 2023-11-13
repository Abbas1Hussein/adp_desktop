import 'dart:math';

import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DefaultPlatforms.initialize(
    AdaptiveTargetPlatform.macOS,
    isDebugging: true,
  );

  final List<String> foodItems = [
    'Pizza',
    'Burger',
    'Salad',
    'Sushi',
    'Tacos',
    'Pasta',
    'Chicken Curry',
    'Ice Cream',
    'Steak',
    'Fried Rice',
    'Pancakes',
    'Shrimp Scampi',
    'Lobster',
    'Caesar Salad',
    'Chocolate Cake',
    'Grilled Cheese Sandwich',
    'Hot Dog',
  ];

  final randomNumber = Random().nextInt(foodItems.length);

  group(
    'AdaptivePopupMenuButton Tests',
    () {
      testWidgets(
        'Render AdaptivePopupMenuButton correctly with items',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            AdpApp(
              home: AdaptivePopupMenuButton<String>(
                value: foodItems[randomNumber],
                onChanged: (value) {},
                items: foodItems.map((food) {
                  return AdaptivePopupMenuItem<String>(
                    child: Text(food),
                    value: food,
                  );
                }).toList(),
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Verify that the selected item is displayed.
          expect(find.text(foodItems[randomNumber], skipOffstage: false),
              findsOneWidget);

          // Verify that all items are present.
          for (String food in foodItems) {
            expect(find.text(food, skipOffstage: false), findsOneWidget);
          }
        },
      );

      testWidgets(
        'Throws AssertionError when AdaptivePopupMenuItem has an empty item list',
        (WidgetTester tester) async {
          final List<AdaptivePopupMenuItem<String>> emptyItems = [];

          // Act
          final button = AdaptivePopupMenuButton<String>(
            value: 'value1',
            items: emptyItems,
          );

          // Assert
          expect(
            () => button.validateSelectedItem(),
            throwsA(isA<AssertionError>()),
          );
        },
      );

      testWidgets(
        'Throws AssertionError when AdaptivePopupMenuItem has a null value',
        (WidgetTester tester) async {
          final List<AdaptivePopupMenuItem<String>> validItems = [
            const AdaptivePopupMenuItem<String>(
              child: Text('Item 1'),
              value: 'value1',
            ),
            const AdaptivePopupMenuItem<String>(
              child: Text('Item 2'),
              value: 'value2',
            ),
          ];

          // Act
          final button =
              AdaptivePopupMenuButton(value: null, items: validItems);

          // Assert
          expect(
            () => button.validateSelectedItem(),
            throwsA(isA<AssertionError>()),
          );
        },
      );

      testWidgets(
        'AdaptivePopupMenuItem value should only appear in one menu item',
        (WidgetTester tester) async {
          final List<AdaptivePopupMenuItem<String>> nonUniqueItems = [
            const AdaptivePopupMenuItem<String>(
              child: Text('Item 1'),
              value: 'value1',
            ),
            const AdaptivePopupMenuItem<String>(
              child: Text('Item 2'),
              value: 'value1',
            ),
          ]; // Duplicate value

          // Act
          final button = AdaptivePopupMenuButton<String>(
            value: 'value1',
            items: nonUniqueItems,
          );

          // Assert
          expect(
            () => button.validateSelectedItem(),
            throwsA(isA<AssertionError>()),
          );
        },
      );
    },
  );
}
