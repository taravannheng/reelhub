import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/data/models/media_details/media_details_model.dart';
import 'package:reelhub/ui/core/company_list.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/ui/movie_details/blocs/movie_details/movie_details_bloc.dart';
import 'package:reelhub/data/blocs/similar_media/similar_media_bloc.dart';
import 'package:reelhub/ui/core/cast_list.dart';
import 'package:reelhub/ui/core/media_details_hero.dart';
import 'package:reelhub/ui/core/media_details_overview.dart';
import 'package:reelhub/ui/core/trailer_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailsScreen(this.movieId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              return Column(
                children: [
                  MediaDetailsHero(
                    backdropPath: state.item?.backdropPath,
                    posterPath: state.item?.posterPath,
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MediaDetailsOverview(
                      MediaDetails.fromMovie(state.item),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TrailerList(),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CastList(),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                switch (state.status) {
                  case MovieDetailsStatus.initial:
                  case MovieDetailsStatus.loading:
                    return ProductionCompanyList(isLoading: true);
                  case MovieDetailsStatus.failure:
                    return ProductionCompanyList(
                      errorMessage: 'Error occured while fetching data...',
                    );
                  case MovieDetailsStatus.success:
                    return ProductionCompanyList(
                      productionCompanies: state.item!.productionCompanies,
                    );
                }
              },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<SimilarMediaBloc, SimilarMediaState>(
              builder: (context, state) {
                return MovieList(state.items, title: 'Similar');
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
