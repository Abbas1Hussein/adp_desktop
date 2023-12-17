import 'dart:math';

abstract final class DummyText {
  const DummyText._();

  static final int _random = Random.secure().nextInt(_questions.length);

  static final String generateQuestion = _questions[_random];

  static final String generateAnswer = _answers[_random];

  static const List<String> _questions = [
    "How can Flutter make your UI responsive across different screen sizes?",
    "What's the best approach for handling state management in Flutter?",
    "How do you implement smooth animations in Flutter applications?",
    "What are the key benefits of using Flutter for cross-platform development?",
    "How can you effectively handle user input in Flutter?",
    "What are the main differences between StatelessWidget and StatefulWidget in Flutter?",
    "How do you optimize the performance of a Flutter app?",
    "What are the recommended practices for handling navigation in Flutter?",
    "How can you integrate third-party packages into your Flutter project?",
    "What are the best practices for designing a visually appealing UI in Flutter?",
    "How does Flutter facilitate the process of internationalization and localization?",
    "What are the common pitfalls to avoid when developing with Flutter?",
    "How can you implement authentication in a Flutter application?",
    "What are the key considerations for choosing between StatelessWidget and StatefulWidget?",
    "How do you test and debug Flutter applications effectively?",
    "What are the steps to deploy a Flutter app to different platforms?",
    "How does Flutter handle platform-specific features and APIs?",
    "What are the recommended strategies for handling app state persistence in Flutter?",
    "How can you implement a dark mode feature in a Flutter application?",
    "What are the best practices for structuring and organizing a Flutter project?",
  ];

  static const List<String> _answers = [
    "Use Flutter's layout widgets like `Expanded` and `MediaQuery` to adapt to different screen sizes.",
    "Choose a state management solution like Provider or Bloc based on the complexity of your app.",
    "Utilize Flutter's built-in animation widgets and controllers for smooth and interactive animations.",
    "Flutter enables code reuse for both iOS and Android, ensuring consistent UI and behavior.",
    "Employ GestureDetector and InkWell for handling various user interactions in your Flutter app.",
    "Use StatelessWidget for static UI and StatefulWidget for dynamic UI with mutable state.",
    "Optimize performance by minimizing widget rebuilds and using Flutter DevTools for profiling.",
    "Navigate between screens using Navigator and routes, and consider using named routes for clarity.",
    "Integrate packages via pubspec.yaml, ensuring compatibility with your Flutter version.",
    "Follow Material Design guidelines, leverage Flutter's rich widget library, and focus on user experience.",
    "Use Flutter's `intl` package for easy internationalization and localization of your app.",
    "Avoid excessive widget rebuilds, watch out for memory leaks, and stay updated on Flutter updates.",
    "Use Firebase Authentication or relevant packages to implement secure user authentication.",
    "Choose StatelessWidget for static UI and StatelessWidget for dynamic UI with mutable state.",
    "Write unit and widget tests, and use Flutter DevTools for effective debugging.",
    "Follow platform-specific guidelines to deploy your Flutter app on iOS and Android.",
    "Utilize platform channels to access native features and APIs in your Flutter app.",
    "Use shared preferences or packages like Hive or SQLite for efficient state persistence.",
    "Toggle between light and dark themes using Flutter's ThemeData and a state management solution.",
    "Organize your Flutter project with clear separation of concerns, following the recommended project structure.",
  ];
}
