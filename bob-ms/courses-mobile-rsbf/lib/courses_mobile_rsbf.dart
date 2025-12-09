import 'package:alfred/alfred.dart';
import 'package:courses_mobile_rsbf/courses_controller.dart';
import 'package:courses_mobile_rsbf/courses_service.dart';
import 'package:dio/dio.dart';

void main() async {
  final app = Alfred(pathPrefix: "/api/courses-mobile");

  final controller =
      CoursesController(coursesService: CoursesService(dio: Dio()));

  app.get(':id', (req, res) => controller.getDetail(req));

  app.get('', (req, res) => controller.getUi(req));

  app.printRoutes();

  await app.listen();
}
