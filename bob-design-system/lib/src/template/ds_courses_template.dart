import 'package:bob_design_system/src/atoms/ds_scroll_direction.dart';
import 'package:bob_design_system/src/molecules/ds_list_view.dart';
import 'package:bob_design_system/src/molecules/ds_padding.dart';
import 'package:bob_design_system/src/organisms/ds_card_carrousel.dart';
import 'package:bob_design_system/src/organisms/ds_empty_state.dart';
import 'package:flutter/material.dart';

final class DSCoursesTemplate {
  final List<Widget> cards;

  const DSCoursesTemplate({required this.cards});

  DSCoursesTemplate.sdui() : cards = <Widget>[];

  String toSdui(List<String> cards) {
    if (cards.isEmpty) {
      return DSEmptyState(text: 'There\'s no courses yet.').toSdui();
    }

    return DSPadding.allLarge().toSdui(
      DSCardCarrousel(
        padding: DSPadding.allSmall(),
        listView: DSListView.sdui(
          scrollDirection: DSScrollDirection.horizontal,
          shrinkWrap: true,
          itemCount: cards.length,
        ),
      ).toSdui(cards),
    );
  }
}
