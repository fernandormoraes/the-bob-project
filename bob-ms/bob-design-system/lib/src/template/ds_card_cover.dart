import 'package:bob_design_system/bob_design_system.dart';

class DSCardCover {
  final String description;
  final String coverUrl;

  DSCardCover({required this.description, required this.coverUrl});

  String toSdui() {
    final cardCover = DSPadding.allMedium().toSdui('''Column(
  mainAxisAlignment: "start",
  crossAxisAlignment: "start",
  children: [
    Text(text: "$description"),
    SizedBox(height: ${Paddings.small}),
    SizedBox(
      height: 100.0, 
      width: 200.0, 
      child: ImageNetwork(
        height: 100.0, 
        width: 200.0, 
        url: "$coverUrl"
      )
    )
  ]
)''');

    return cardCover;
  }
}
