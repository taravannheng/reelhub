import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reelhub/ui/core/company_logo.dart';
import 'package:reelhub/ui/movie_details/blocs/movie_details/movie_details_bloc.dart';

class ProductionCompanyList extends StatelessWidget {
  const ProductionCompanyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        final bool hasCompanies =
            state.item?.productionCompanies != null &&
            state.item!.productionCompanies.isNotEmpty;

        switch (state.status) {
          case MovieDetailsStatus.initial:
          case MovieDetailsStatus.loading:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Productions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                CircularProgressIndicator.adaptive(),
              ],
            );
          case MovieDetailsStatus.failure:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Productions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text("Error fetching production companies"),
              ],
            );
          case MovieDetailsStatus.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Productions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      if (hasCompanies)
                        ...state.item!.productionCompanies.map(
                          (item) => Row(
                            children: [
                              SizedBox(width: 100, child: CompanyLogo(item)),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                      if (!hasCompanies) Text("No Data"),
                    ],
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
