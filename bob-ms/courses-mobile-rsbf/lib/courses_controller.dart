import 'dart:convert';
import 'dart:io';

import 'package:courses_mobile_rsbf/courses_service.dart';

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

    List<String> texts = model.data!.map((e) => '''Padding(
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

    File file = File('tmp.rfw');

    await file.writeAsBytes(utf8.encode('''import core.widgets;
import core.material;

widget root = Scaffold(
  drawer: Drawer(
    child: ListView(
      padding: [0.0],
      children: [
        DrawerHeader(
          child: Column(
            children: [
              MaterialIcon(codePoint: 0xe491, size: 54.0),
              Text(text: ["Bem vindo(a)"]),
              Text(text: ["Fernando Moraes"], style: {fontSize: 24.0}),
            ]
          )
        ),
        ListTile(
          title: Text(text: ["Logout"]),
          onTap: event 'drawer.logout' { }
        ),
      ],
    )
  ),
  appBar: AppBar(title: Text(text: ['Dashboard'])),
  body: Column(
    mainAxisAlignment: "start",
    crossAxisAlignment: "start",    
    children: [
        Padding(
          padding: [24.0, 0.0, 0.0, 0.0],
          child: Text(text: ["Courses"], style: {fontSize: 32.0}),
        ),
        Padding(
          padding: [24.0],
          child: Card(
            child: Padding(
                padding: [8.0],
                child: SizedBox(
                  height: 170.0,
                  child: ListView(
                    scrollDirection: "horizontal",
                    shrinkWrap: true,
                    itemCount: ${texts.length},
                    children: $texts
                  )
                )
              )
            )
          ),
        Padding(
          padding: [24.0, 0.0, 0.0, 0.0],
          child: Text(text: ["Next to watch"], style: {fontSize: 32.0}),
        ),
        SizedBox(height: 16.0),
        Align( 
          alignment: "center",
          child: Text(text: ["Nothing yet. Let's start some courses?"], style: {fontSize: 16.0})
        )
    ])
);'''));

    return file;
  }
}
