import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/routing/routes.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/poster_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class MediaCard extends StatelessWidget {
  final Media item;
  final bool isMovie;

  const MediaCard(this.item, {super.key, required this.isMovie});

  @override
  Widget build(BuildContext context) {
    final bool hasPoster =
        item.posterPath != null && item.posterPath!.isNotEmpty;

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          isMovie ? Routes.movieDetails : Routes.tvShowDetails,
          pathParameters: {'id': item.id.toString()},
        );
      },
      child: hasPoster
          ? SizedBox(
              width: 154,
              height: 231,
              child: Image.network(
                ImageHelpers.formatPosterUrl(
                  item.posterPath,
                  size: PosterSize.w154,
                ),
                fit: BoxFit.cover,
              ),
            )
          : Container(
              width: 154,
              height: 231,
              color: Color(0xFFECECEC),
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CustomIcon(
                    path: CustomIcons.photo,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
    );
  }
}
