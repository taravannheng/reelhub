import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/ui/home/views/trending_card.dart';

class TrendingList extends StatelessWidget {
  final List<Movie>? items;

  const TrendingList(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Text("No trending...");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trending", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 16),
        SizedBox(
          height: 231,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TrendingCard(items![index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
