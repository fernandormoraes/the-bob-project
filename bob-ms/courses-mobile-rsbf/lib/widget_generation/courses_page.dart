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
              Text(text: ["Welcome"]),
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
        $widgetCourses
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
);''';
  }
}
