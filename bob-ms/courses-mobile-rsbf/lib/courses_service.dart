import 'package:courses_mobile_rsbf/courses_model.dart';
import 'package:dio/dio.dart';

class CoursesService {
  final Dio _dio;

  CoursesService({required Dio dio}) : _dio = dio;

  Future<CoursesResponseModel> getCourses(String authorization) async {
    final response = await _dio.get('http://api-gateway:8080/api/courses/',
        options: Options(headers: {'Authorization': authorization}));

    final coursesModel = CoursesResponseModel.fromJson(response.data);

    return coursesModel;
  }
}
