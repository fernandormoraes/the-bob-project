import 'package:bob_design_system/bob_design_system.dart';

class CoursesPage {
  final String widgetCourses;

  CoursesPage({required this.widgetCourses});

  String generate() {
    return '''import core.widgets;
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
              ${DSText.normal(text: "Welcome").toSdui()},
              ${DSText.header(text: "Fernando Moraes").toSdui()}
            ]
          )
        ),
        ListTile(
          title: ${DSText.normal(text: "Logout").toSdui()},
          onTap: event 'drawer.logout' { }
        ),
      ],
    )
  ),
  appBar: AppBar(title: ${DSText.normal(text: "Dashboard").toSdui()}),
  body: Column(
    mainAxisAlignment: "start",
    crossAxisAlignment: "start",    
    children: [
        ${DSPadding.startLarge().toSdui(DSText.title(text: "Courses").toSdui())},
        $widgetCourses,
        ${DSPadding.startLarge().toSdui(DSText.title(text: "Next to watch").toSdui())},
        SizedBox(height: ${Paddings.medium}),
        Align( 
          alignment: "center",
          child: ${DSText.normal(text: "Nothing yet. Let\'s start some courses?").toSdui()},
        )
    ])
);''';
  }
}
