import 'package:bob_design_system/bob_design_system.dart';
import 'package:courses_mobile_rsbf/courses_model.dart';

class CardCover {
  final CoursesResponseModel model;

  CardCover({required this.model});

  List<String> generate() {
    final data = model.data;

    if (data == null || data.isEmpty) {
      return [];
    }

    return data
        .map((e) => DSCardCover(
                description: e.description ?? '', coverUrl: e.cover ?? '')
            .toSdui())
        .toList();
  }
}
