import 'package:shared_app/const.dart';
import 'package:dio/dio.dart';
import 'package:shared_app/cache/user_cache.dart';

class UserService {
  final Dio _dio;
  final UserCache _cache;

  static const String loginUrl = '$apiBaseUrl/users/login';

  UserService({required Dio dio, required UserCache cache})
      : _dio = dio,
        _cache = cache;

  Future<String> login(
      {required String username, required String password}) async {
    final res = await _dio.post(loginUrl,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: {}));

    if (res.data?['data'] is String && res.data['data'].length > 0) {
      _cache.setToken('Bearer ${res.data['data']}');
    }

    return res.data['data'];
  }
}
