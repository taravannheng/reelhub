import 'package:flutter/material.dart';
import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/profile_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard(this.cast, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: cast.profilePath == null || cast.profilePath!.isEmpty
          ? Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey.withAlpha(100),
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CustomIcon(path: CustomIcons.profile),
                ),
              ),
            )
          : Image.network(
              ImageHelpers.formatProfileUrl(
                cast.profilePath,
                size: ProfileSize.w185,
              ),
              fit: BoxFit
                  .contain, // Ensure the image is stretched to cover the area
            ),
    );
  }
}
