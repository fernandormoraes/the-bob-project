import 'package:bob_design_system/bob_design_system.dart';

class CoursesPage {
  final String widgetCourses;
  final String username;

  CoursesPage({required this.widgetCourses, required this.username});

  String generate() {
    return '''import core.widgets;
import core.material;

widget root = ${DSScaffold(appBarTitle: "Dashboard", username: username, body: '''
Column(
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
    ''').toSdui()} 
''';
  }
}
