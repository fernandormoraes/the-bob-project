import 'package:courses_mobile_rsbf/courses_model.dart';
import 'package:courses_mobile_rsbf/widget_generation/detail/course_detail_page.dart';

class CourseDetailPageBuilder {
  final CourseByIdResponseModel model;

  late final CourseDetailPage courseDetailPage;

  CourseDetailPageBuilder({required this.model}) {
    courseDetailPage = CourseDetailPage(
      model: model,
    );
  }

  String generate() {
    return courseDetailPage.generate();
  }
}
