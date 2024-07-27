import 'package:bob_mobile/const.dart';
import 'package:bob_mobile/shared/cache/user_cache.dart';
import 'package:bob_mobile/shared/exceptions/unauthorized_exception.dart';
import 'package:dio/dio.dart';

class HomeService {
  final Dio _dio;
  final UserCache _cache;

  static const String coursesUrl = '$apiBaseUrl/courses-mobile';

  HomeService({required Dio dio, required UserCache cache})
      : _dio = dio,
        _cache = cache;

  Future<String> getCourses() async {
    String authToken = await _cache.getToken();

    final res = await _dio.get(coursesUrl,
        options: Options(headers: {'Authorization': authToken}));

    if (res.statusCode == 401) {
      throw UnauthorizedException();
    }

    return res.data;
  }
}
