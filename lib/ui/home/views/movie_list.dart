import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/ui/home/views/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie>? items;
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
                padding: const EdgeInsets.only(right: 8.0),
                child: MovieCard(items![index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
