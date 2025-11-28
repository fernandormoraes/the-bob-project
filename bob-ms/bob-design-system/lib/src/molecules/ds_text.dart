import 'package:bob_design_system/bob_design_system.dart';

final class DSText {
  final String text;
  final double fontSize;

  const DSText({required this.text, this.fontSize = FontSizes.medium});

  const DSText.normal({required this.text}) : fontSize = FontSizes.small;

  const DSText.header({required this.text}) : fontSize = FontSizes.medium;

  const DSText.title({required this.text}) : fontSize = FontSizes.large;

  String toSdui() {
    return '''Text(
      text: ["$text"],
      style: {fontSize: $fontSize},
    )''';
  }
}
