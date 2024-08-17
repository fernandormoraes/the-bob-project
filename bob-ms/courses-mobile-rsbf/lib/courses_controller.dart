import 'dart:convert';
import 'dart:io';
import 'package:courses_mobile_rsbf/courses_service.dart';
import 'package:courses_mobile_rsbf/widget_generation/courses_page_builder.dart';

class CoursesController {
  final CoursesService _coursesService;

  CoursesController({required CoursesService coursesService})
      : _coursesService = coursesService;

  Future<File?> getUi(HttpRequest req) async {
    String? authorization = req.headers.value('Authorization');

    if (authorization == null) {
      return null;
    }

    final model = await _coursesService.getCourses(authorization);

    if (model.data == null) {
      return null;
    }

    File file = File('tmp.rfw');

    await file
        .writeAsBytes(utf8.encode(CoursesPageBuilder(model: model).generate()));

    return file;
  }
}
