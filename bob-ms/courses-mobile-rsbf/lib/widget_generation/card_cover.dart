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

    return data.map((e) {
      final videoUrl = e.module?.firstOrNull?.content?.firstOrNull?.video ?? '';

      return DSCardCover(
              description: e.description ?? '',
              coverUrl: e.cover ?? '',
              videoUrl:
                  e.module?.firstOrNull?.content?.firstOrNull?.video ?? '',
              onLongPress:
                  "event 'card_cover.play_video' { arguments: {'$videoUrl': '$videoUrl'} }",
              onTap:
                  "event 'card_cover.navigate' { arguments: {'id': '${e.id ?? 0}'} }")
          .toSdui();
    }).toList();
  }
}
