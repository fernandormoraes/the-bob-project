import 'package:bob_design_system/src/atoms/ds_scroll_direction.dart';

final class DSListView {
  final DSScrollDirection scrollDirection;
  final bool shrinkWrap;
  final int itemCount;
  final List<String> children;

  const DSListView({
    required this.scrollDirection,
    required this.shrinkWrap,
    required this.itemCount,
    required this.children,
  });

  DSListView.sdui({
    required this.scrollDirection,
    required this.shrinkWrap,
    required this.itemCount,
  }) : children = <String>[];

  String toSdui(List<String> children) {
    return '''ListView(
          scrollDirection: "${scrollDirection.name}",
          shrinkWrap: $shrinkWrap,
          itemCount: $itemCount,
          children: $children
        )
    ''';
  }
}
