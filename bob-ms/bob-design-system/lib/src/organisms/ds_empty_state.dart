final class DSEmptyState {
  final String text;

  const DSEmptyState({required this.text});

  String toSdui() {
    return '''Padding(
      padding: [24.0],
      child: Align(
alignment: "center", 
child: Text(text: ["$text"], style: {fontSize: 16.0}),)),''';
  }
}
