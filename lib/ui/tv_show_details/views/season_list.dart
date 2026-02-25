import 'package:flutter/material.dart';
import 'package:reelhub/data/models/season/season_model.dart';
import 'package:reelhub/ui/tv_show_details/views/season_card.dart';

class SeasonList extends StatelessWidget {
  final List<Season> seasonList;

  const SeasonList(this.seasonList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 291,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [...seasonList.map((season) => SeasonCard(season))],
      ),
    );
  }
}
