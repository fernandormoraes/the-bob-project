import 'package:dio/dio.dart';

class HomeService {
  final Dio _dio;

  HomeService({required Dio dio}) : _dio = dio;

  Future<String> getCourses() async {
    final res = await _dio.get('http://10.0.2.2:3000/courses-mobile',
        options: Options(headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJGZXJuYW5kbyBNb3JhZXMiLCJleHAiOjE3MTU0Njk4MDEsImlhdCI6MTcxMjg3NzgwMSwidXNlcm5hbWUiOiJmZXJuYW5kb21vcmFlc3ByYzJAZ21haWwuY29tIn0.S0Snys4uNxE1fxEJj936QtxmdqX67LvXApCoEAX4pJY'
        }));

    return res.data;
  }
}
