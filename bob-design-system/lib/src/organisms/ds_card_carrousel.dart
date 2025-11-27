import 'package:bob_design_system/src/molecules/ds_list_view.dart';
import 'package:bob_design_system/src/molecules/ds_padding.dart';

final class DSCardCarrousel {
  final DSPadding padding;
  final DSListView listView;

  const DSCardCarrousel({required this.padding, required this.listView});

  String toSdui(List<String> children) {
    final paddingListView = DSPadding.allSmall().toSdui(
      listView.toSdui(children),
    );

    return ''''
      Card(
        child: $paddingListView
      )
    ''';
  }
}
