import 'package:flutter/material.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/ui/core/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Media>? items;
  final String title;

  const MovieList(this.items, {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Text("No trending...");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 16),
        SizedBox(
          height: 231,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < items!.length - 1 ? 8.0 : 16.0,
                ),
                child: MovieCard(items![index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
