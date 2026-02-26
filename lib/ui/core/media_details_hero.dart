import 'package:flutter/material.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/backdrop_size_enums.dart';
import 'package:reelhub/utils/enums/poster_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class MediaDetailsHero extends StatelessWidget {
  final String? backdropPath;
  final String? posterPath;

  const MediaDetailsHero({
    super.key,
    required this.backdropPath,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            backdropPath == null || backdropPath!.isEmpty
                ? Container(
                    height: 400,
                    width: double.infinity,
                    color: Colors.grey.withAlpha(100),
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CustomIcon(path: CustomIcons.photo),
                      ),
                    ),
                  )
                : Image.network(
                    ImageHelpers.formatBackdropUrl(
                      backdropPath,
                      size: BackdropSize.w1280,
                    ),
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            Positioned(
              left: 24,
              bottom: 24,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: posterPath == null || posterPath!.isEmpty
                      ? Container(
                          height: 120,
                          width: 80,
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
                            posterPath,
                            size: PosterSize.w154,
                          ),
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
