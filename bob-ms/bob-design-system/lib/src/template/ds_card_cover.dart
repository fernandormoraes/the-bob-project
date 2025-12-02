import 'package:bob_design_system/bob_design_system.dart';

class DSCardCover {
  final String description;
  final String coverUrl;
  final String videoUrl;

  DSCardCover({
    required this.description,
    required this.coverUrl,
    required this.videoUrl,
  });

  String toSdui() {
    final cardCover = DSPadding.allMedium().toSdui('''Column(
  mainAxisAlignment: "start",
  crossAxisAlignment: "start",
  children: [
    Text(text: "$description"),
    SizedBox(height: ${Paddings.small}),
    InkWell(
      onTap: event 'card_cover.play_video' { arguments: {"videoUrl": "$videoUrl"} },
      child: SizedBox(
        height: 100.0, 
        width: 200.0, 
        child: ImageNetwork(
          height: 100.0, 
          width: 200.0, 
          url: "$coverUrl"
        )
      )
    )
  ]
)''');

    return cardCover;
  }
}
