import 'package:shared_preferences/shared_preferences.dart';

class UserCache {
  final Future<SharedPreferences> sp = SharedPreferences.getInstance();

  Future<String> getToken() async {
    final SharedPreferences prefs = await sp;
    return prefs.getString('token') ?? '';
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await sp;
    await prefs.setString('token', token);
  }
}
