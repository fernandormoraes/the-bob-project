import 'package:courses_mobile_rsbf/courses_model.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CoursesService {
  final Dio _dio;

  CoursesService({required Dio dio}) : _dio = dio;

  static const _coursesUrl = 'http://api-gateway:8080/api/courses/';

  Future<CoursesResponseModel> getCourses(String authorization) async {
    print(authorization);

    final response = await _dio.get(
      _coursesUrl,
      options: Options(
        headers: {
          'Authorization': authorization,
        },
      ),
    );

    final jwt = JwtDecoder.decode(authorization.replaceFirst('Bearer', ''));

    final username = jwt['sub'] ?? '';

    final coursesModel = CoursesResponseModel.fromJson(response.data);

    final coursesModelWithUsername = coursesModel.copyWithUsername(username);

    return coursesModelWithUsername;
  }
}
