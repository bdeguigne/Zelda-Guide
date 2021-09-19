class HiveException implements Exception {
  final String cause;

  const HiveException(this.cause);
}
