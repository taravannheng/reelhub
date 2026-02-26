import 'package:flutter/material.dart';
import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/profile_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class CastAvatar extends StatelessWidget {
  final Cast cast;

  const CastAvatar(this.cast, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundImage: cast.profilePath != null && cast.profilePath!.isNotEmpty
          ? NetworkImage(
              ImageHelpers.formatProfileUrl(
                cast.profilePath,
                size: ProfileSize.w185,
              ),
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      child: cast.profilePath == null || cast.profilePath!.isEmpty
          ? Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CustomIcon(
                    path: CustomIcons.profile,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
