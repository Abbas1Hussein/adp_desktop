class PropertyException implements Exception {
  const PropertyException(this.platform);

  final String platform;

  @override
  String toString() {
    return '\nError: Attempting to use a property that does not exist or is not initialized for the $platform widget.';
  }
}

class TypeMismatchException implements Exception {
  final String expectedType;
  final String actualType;

  TypeMismatchException(this.expectedType, this.actualType);

  @override
  String toString() {
    return 'MismatchException: Expected $expectedType, but found $actualType.\nTo resolve this, Use: \'property.all.$expectedType\' instead of \'property.all.$actualType\'';
  }
}
