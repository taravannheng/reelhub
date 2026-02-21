import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:reelhub/utils/helpers/movie_helpers.dart';

class GenreList extends StatelessWidget {
  final List<Genre>? genres;
  final int? runtime;

  const GenreList({super.key, required this.genres, required this.runtime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (runtime != null)
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                MovieHelpers.formatRuntime(runtime!),
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.grey),
              ),
            ),
          if (runtime != null && genres != null)
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                " | ",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.grey),
              ),
            ),
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
