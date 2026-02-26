import 'package:flutter/material.dart';
import 'package:reelhub/data/models/genre/genre_model.dart';

import 'package:reelhub/utils/helpers/movie_helpers.dart';

class ProductionInfoList extends StatelessWidget {
  final int? runtime;
  final List<Genre>? genres;

  const ProductionInfoList({
    super.key,
    required this.runtime,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
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
