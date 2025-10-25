### 🧪 Running Multiple Tests

To run the tests, make sure to specify the correct platform on:

### Windows

```bash
flutter test --dart-define=platform="windows"
````

### Macos

```bash
flutter test --dart-define=platform="macos"
```

### 🧩 Running a Single Test File

If you want to run a specific test file, you **must** provide the `platform` parameter to the `initializeDesktopDefaultsTests` method.

Example:

```dart
initializeDesktopDefaultsTests(DesktopTargetPlatform.windows);
```
or

```dart
initializeDesktopDefaultsTests(DesktopTargetPlatform.macos);
```