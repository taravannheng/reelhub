import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/routing/routes.dart';
import 'package:reelhub/utils/enums/poster_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class MovieCard extends StatelessWidget {
  final Movie item;

  const MovieCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.movieDetails, pathParameters: {
          'movieId': item.id.toString()
        });
      },
      child: SizedBox(
        width: 154,
        height: 231,
        child: Stack(
          children: [
            if (item.posterPath != null && item.posterPath != "")
              Image.network(
                ImageHelpers.formatPosterUrl(
                  item.posterPath,
                  size: PosterSize.w154,
                ),
                fit: BoxFit
                    .cover, // Ensure the image is stretched to cover the area
              ),
            Positioned(
              left: 0,
              bottom: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    width: 154,
                    color: Colors.black.withValues(alpha: 0.3),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.title ?? item.originalTitle ?? item.name ?? "N/A",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
