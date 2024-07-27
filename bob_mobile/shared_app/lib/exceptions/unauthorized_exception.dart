class UnauthorizedException implements Exception {
  @override
  String toString() {
    return 'User is not authorized to perform this action';
  }
}
