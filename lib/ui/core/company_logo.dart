import 'package:flutter/material.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';
import 'package:reelhub/utils/enums/profile_size_enums.dart';
import 'package:reelhub/utils/helpers/image_helpers.dart';

class CompanyLogo extends StatelessWidget {
  final ProductionCompany company;

  const CompanyLogo(this.company, {super.key});

  @override
  Widget build(BuildContext context) {
    final hasImage = company.logoPath != null && company.logoPath!.isNotEmpty;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: hasImage
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                ImageHelpers.formatProfileUrl(
                  company.logoPath,
                  size: ProfileSize.w185,
                ),
                fit: BoxFit.contain,
              ),
            )
          : Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CustomIcon(
                  path: CustomIcons.photo,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
    );
  }
}
