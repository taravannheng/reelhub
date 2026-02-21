import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:reelhub/utils/helpers/movie_helpers.dart';

class ProductionInfoList extends StatelessWidget {
  final int? runtime;
  final List<ProductionCompany>? productionCompanies;

  const ProductionInfoList({
    super.key,
    required this.runtime,
    required this.productionCompanies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (runtime != null)
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                MovieHelpers.formatRuntime(runtime!),
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.grey),
              ),
            ),
          if (runtime != null && productionCompanies != null)
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                " | ",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.grey),
              ),
            ),
          if (productionCompanies != null)
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                productionCompanies!.map((c) => c.name).join(" , "),
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
