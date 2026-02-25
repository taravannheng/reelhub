import 'package:flutter/material.dart';
import 'package:reelhub/data/models/season/season_model.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/poster_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class SeasonCard extends StatelessWidget {
  final Season season;

  const SeasonCard(this.season, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          season.posterPath == null || season.posterPath!.isEmpty
              ? Container(
                  height: 154,
                  width: 231,
                  color: Colors.grey,
                  child: Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CustomIcon(path: CustomIcons.photo),
                    ),
                  ),
                )
              : Image.network(
                  ImageHelpers.formatPosterUrl(
                    season.posterPath,
                    size: PosterSize.w154,
                  ),
                  height: 231,
                  width: 154,
                  fit: BoxFit.cover,
                ),
          const SizedBox(height: 8),
          Text(season.name, style: Theme.of(context).textTheme.titleMedium),
          Text(
            "${season.episodeCount.toString()} episodes",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
