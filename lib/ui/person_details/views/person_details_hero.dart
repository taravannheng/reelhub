import 'package:flutter/material.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class PersonDetailsHero extends StatelessWidget {
  final String? profilePath;

  const PersonDetailsHero({
    super.key,
    required this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            profilePath == null || profilePath!.isEmpty
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
                    ImageHelpers.formatProfileUrl(
                      profilePath,
                    ),
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ],
        ),
      ],
    );
  }
}
