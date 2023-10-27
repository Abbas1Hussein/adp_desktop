class MissingPlatformException<T> implements Exception {
  final String platformName;

  MissingPlatformException(this.platformName);

  @override
  String toString() {
    return 'You are running the app on $platformName platform without providing a function to return ${T.toString()}.\n'
        'Make sure to implement $platformName for proper functionality.';
  }
}

class UnsupportedPlatformException<T> implements Exception {
  final String platformName;

  UnsupportedPlatformException(this.platformName);

  @override
  String toString() {
    return 'Unsupported platform: $platformName. ${T.toString()} functionality is not supported on this platform.';
  }
}
