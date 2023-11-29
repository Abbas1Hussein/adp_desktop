class UnsupportedPlatformException implements Exception {
  final String platformName;

  UnsupportedPlatformException(this.platformName);

  @override
  String toString() {
    return 'Unsupported platform: $platformName.\n"adp_desktop package" is not supported on this platform.';
  }
}
