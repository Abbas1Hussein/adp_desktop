class UnsupportedPlatformException<T> implements Exception {
  final String platformName;

  UnsupportedPlatformException(this.platformName);

  @override
  String toString() {
    return 'Unsupported platform: $platformName. ${T.toString()} functionality is not supported on this platform.';
  }
}
