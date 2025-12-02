final class SignupUserDto {
  final String username;
  final String password;
  final String fullName;

  SignupUserDto({
    required this.username,
    required this.password,
    required this.fullName,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': username,
      'password': password,
      'name': fullName,
    };
  }
}
