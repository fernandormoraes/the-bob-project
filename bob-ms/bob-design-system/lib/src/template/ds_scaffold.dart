import 'package:bob_design_system/bob_design_system.dart';

final class DSScaffold {
  final String appBarTitle;
  final String username;
  final String body;
  final bool isPrimaryPage;

  const DSScaffold({
    required this.appBarTitle,
    required this.username,
    required this.body,
    this.isPrimaryPage = true,
  });

  String toSdui() {
    if (!isPrimaryPage) {
      return '''Scaffold(
  appBar: ${DSAppBar(title: appBarTitle).toSdui()},
  body: $body
);
    ''';
    }

    return '''Scaffold(
  drawer: Drawer(
    child: ListView(
      padding: [0.0],
      children: [
        DrawerHeader(
          child: Column(
            children: [
              MaterialIcon(codePoint: 0xe491, size: 54.0),
              ${DSText.normal(text: "Welcome").toSdui()},
              ${DSText.header(text: username).toSdui()}
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
  appBar: ${DSAppBar(title: appBarTitle).toSdui()},
  body: $body
);
    ''';
  }
}
