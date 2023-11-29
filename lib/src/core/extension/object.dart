extension IsNotNull on Object? {
  bool get isNotNull => this != null;

  bool get isNull => !isNotNull;
}
