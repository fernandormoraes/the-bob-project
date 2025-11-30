import 'package:courses_mobile_rsbf/courses_model.dart';
import 'package:courses_mobile_rsbf/widget_generation/card_cover.dart';
import 'package:courses_mobile_rsbf/widget_generation/courses_display.dart';
import 'package:courses_mobile_rsbf/widget_generation/courses_page.dart';

class CoursesPageBuilder {
  final CoursesResponseModel model;

  late final List<String> cards;
  late final String widgetCourses;
  late final CoursesPage coursesPage;

  CoursesPageBuilder({required this.model}) {
    cards = CardCover(model: model).generate();

    widgetCourses = CoursesDisplay(cards: cards).generate();

    coursesPage = CoursesPage(
      widgetCourses: widgetCourses,
      username: model.userName ?? 'User',
    );
  }

  String generate() {
    return coursesPage.generate();
  }
}
