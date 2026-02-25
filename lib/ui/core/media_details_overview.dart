import 'package:flutter/material.dart';
import 'package:reelhub/data/models/media_details/media_details_model.dart';
import 'package:reelhub/ui/core/genre_list.dart';
import 'package:reelhub/ui/core/meta_list.dart';
import 'package:reelhub/ui/core/production_info_list.dart';
import 'package:reelhub/utils/helpers/movie_helpers.dart';

class MediaDetailsOverview extends StatelessWidget {
  final MediaDetails? mediaDetails;

  const MediaDetailsOverview(this.mediaDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    if (mediaDetails == null) return Text("No data...");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${mediaDetails?.title ?? "N/A"}${mediaDetails?.releaseDate == null ? "" : MovieHelpers.extractYearFromReleaseDate(mediaDetails?.releaseDate)}",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 4),
        ProductionInfoList(
          runtime: mediaDetails?.runtime,
          productionCompanies: mediaDetails?.productionCompanies,
        ),
        const SizedBox(height: 4),
        GenreList(genres: mediaDetails?.genres),
        const SizedBox(height: 8),
        MetaList(
          adult: mediaDetails?.adult,
          popularity: mediaDetails?.popularity ?? 0,
          language: mediaDetails?.originalLanguage,
        ),
        const SizedBox(height: 24.0),
        Text(
          mediaDetails?.overview ?? "No overview...",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
