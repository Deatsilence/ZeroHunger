class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return "Your preferences didn't initialize right now ";
  }
}
