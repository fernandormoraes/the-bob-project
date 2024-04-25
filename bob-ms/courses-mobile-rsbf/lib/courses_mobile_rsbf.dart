import 'package:alfred/alfred.dart';
import 'package:courses_mobile_rsbf/courses_controller.dart';
import 'package:courses_mobile_rsbf/courses_service.dart';
import 'package:dio/dio.dart';

void main() async {
  final app = Alfred();

  final controller =
      CoursesController(coursesService: CoursesService(dio: Dio()));

  app.get('/courses-mobile', (req, res) => controller.getUi(req));

  await app.listen();
}
