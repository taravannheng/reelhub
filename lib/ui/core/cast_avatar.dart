import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/routing/routes.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/profile_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class CastAvatar extends StatelessWidget {
  final Cast cast;
  final String movieId;

  const CastAvatar(this.cast, {super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final hasImage = cast.profilePath != null && cast.profilePath!.isNotEmpty;

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.personDetails,
          pathParameters: {'imdbId': cast.id.toString(), 'id': movieId},
        );
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        foregroundImage: hasImage
            ? NetworkImage(
                ImageHelpers.formatProfileUrl(
                  cast.profilePath,
                  size: ProfileSize.w185,
                ),
              )
            : null,
        child: !hasImage
            ? CustomIcon(
                path: CustomIcons.profile,
                color: Theme.of(context).colorScheme.primary,
              )
            : null,
      ),
    );
  }
}
