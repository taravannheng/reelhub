import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/data/blocs/casts/casts_bloc.dart';
import 'package:reelhub/data/blocs/trailers/trailers_bloc.dart';
import 'package:reelhub/data/models/media_details/media_details_model.dart';
import 'package:reelhub/ui/core/company_list.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/ui/core/trailer_list_skeleton.dart';
import 'package:reelhub/ui/movie_details/blocs/movie_details/movie_details_bloc.dart';
import 'package:reelhub/data/blocs/similar_media/similar_media_bloc.dart';
import 'package:reelhub/ui/core/cast_list.dart';
import 'package:reelhub/ui/core/media_details_hero.dart';
import 'package:reelhub/ui/core/media_details_overview.dart';
import 'package:reelhub/ui/core/trailer_list.dart';
import 'package:reelhub/utils/mock/mock_cast_list.dart';
import 'package:reelhub/utils/mock/mock_media_list.dart';
import 'package:reelhub/utils/mock/mock_movie.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              switch (state.status) {
                case MovieDetailsStatus.initial:
                case MovieDetailsStatus.loading:
                  return Skeletonizer(
                    enabled: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MediaDetailsHero(
                          backdropPath: mockMediaList.first.backdropPath,
                          posterPath: mockMediaList.first.posterPath,
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: MediaDetailsOverview(
                            MediaDetails.fromMovie(mockMovie),
                          ),
                        ),
                      ],
                    ),
                  );
                case MovieDetailsStatus.failure:
                  return Column(
                    children: [
                      MediaDetailsHero(backdropPath: null, posterPath: null),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: MediaDetailsOverview(
                          MediaDetails.fromMovie(null),
                        ),
                      ),
                    ],
                  );
                case MovieDetailsStatus.success:
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
              }
            },
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<TrailerBloc, TrailerState>(
              builder: (context, state) {
                switch (state.status) {
                  case TrailerStatus.initial:
                  case TrailerStatus.loading:
                    return TrailerListSkeleton();
                  case TrailerStatus.failure:
                    return TrailerList(
                      errorMessage: 'Error occured while fetching data...',
                    );
                  case TrailerStatus.success:
                    return TrailerList(trailers: state.items);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<CastBloc, CastState>(
              builder: (context, state) {
                switch (state.status) {
                  case CastStatus.initial:
                  case CastStatus.loading:
                    return Skeletonizer(
                      enabled: true,
                      child: CastList(casts: mockCasts,));
                  case CastStatus.failure:
                    return CastList(
                      errorMessage: 'Error occured while fetching data...',
                    );
                  case CastStatus.success:
                    return CastList(casts: state.items);
                }
              },
            ),
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
                switch (state.status) {
                  case SimilarMediaStatus.initial:
                  case SimilarMediaStatus.loading:
                    return MovieList(title: 'Similar', isLoading: true);
                  case SimilarMediaStatus.failure:
                    return MovieList(
                      title: 'Similar',
                      errorMessage: "Failed to fetch data...",
                    );
                  case SimilarMediaStatus.success:
                    return MovieList(title: 'Similar', items: state.items);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
