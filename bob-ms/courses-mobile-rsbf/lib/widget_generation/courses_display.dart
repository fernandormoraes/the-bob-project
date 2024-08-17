class CoursesDisplay {
  final List<String> cards;

  CoursesDisplay({required this.cards});

  String generate() {
    if (cards.isEmpty) {
      return '''Padding(
      padding: [24.0],
      child: Align(
alignment: "center", 
child: Text(text: ["There's no courses yet."], style: {fontSize: 16.0}),)),''';
    }

    return '''Padding(
  padding: [24.0],
  child: Card(
    child: Padding(
        padding: [8.0],
        child: SizedBox(
          height: 170.0,
          child: ListView(
            scrollDirection: "horizontal",
            shrinkWrap: true,
            itemCount: ${cards.length},
            children: $cards
          )
        )
      ))
    ),''';
  }
}
