import 'package:bob_design_system/bob_design_system.dart';

final class DSAppBar {
  final String title;

  const DSAppBar({required this.title});

  String toSdui() {
    return '''AppBar(title: ${DSText.normal(text: title).toSdui()})''';
  }
}
