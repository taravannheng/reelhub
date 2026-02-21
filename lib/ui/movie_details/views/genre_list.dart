import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';

class GenreList extends StatelessWidget {
  final List<Genre>? genres;

  const GenreList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (genres != null)
            ...genres!.map(
              (genre) => Align(
                alignment: AlignmentGeometry.center,
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Text(
                        genre.name,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(color: Colors.grey),
                      ),
                      if (genre != genres!.last) ...[
                        const SizedBox(width: 8.0),
                        Text(
                          "·",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
