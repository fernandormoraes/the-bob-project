import 'package:courses_mobile_rsbf/courses_model.dart';

class CardCover {
  final CoursesResponseModel model;

  CardCover({required this.model});

  List<String> generate() {
    return model.data!.map((e) => '''Padding(
padding: [16.0], 
child: Column(
  mainAxisAlignment: "start",
  crossAxisAlignment: "start",
  children: [
      Text(text: "${e.description!}"),
      SizedBox(height: 8.0),
      SizedBox(height: 100.0, width: 200.0, 
        child: ImageNetwork(height: 100.0, width: 200.0, url: "${e.cover!}")
      )
    ]
  )
)''').toList();
  }
}
