import 'package:flutter/material.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/ui/core/media_card.dart';

class MovieList extends StatelessWidget {
  final List<Media>? items;
  final String title;
  final bool isMovie;
  final String? errorMessage;

  const MovieList({
    super.key,
    required this.title,
    this.items,
    this.errorMessage,
    this.isMovie = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasMovies = items != null && items!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 16),
        if (errorMessage != null) Text(errorMessage!),
        if (hasMovies)
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
                  child: MediaCard(items![index], isMovie: isMovie),
                );
              },
            ),
          ),
        if (!hasMovies) Text("No Data..."),
      ],
    );
  }
}
