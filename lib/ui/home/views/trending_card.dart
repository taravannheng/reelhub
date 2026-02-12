import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrendingCard extends StatelessWidget {
  final Movie item;

  const TrendingCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 154,
      height: 231,
      child: Stack(
        children: [
          if (item.posterPath != null && item.posterPath != "")
            Image.network(
              "https://image.tmdb.org/t/p/w154${item.posterPath ?? ""}",
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
    );
  }
}
