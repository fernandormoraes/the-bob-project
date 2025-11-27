import 'package:bob_design_system/bob_design_system.dart';

class CoursesDisplay {
  final List<String> cards;

  CoursesDisplay({required this.cards});

  String generate() {
    return DSCoursesTemplate.sdui().toSdui(cards);
  }
}
