import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/data/blocs/casts/casts_bloc.dart';
import 'package:reelhub/data/blocs/trailers/trailers_bloc.dart';
import 'package:reelhub/data/models/media_details/media_details_model.dart';
import 'package:reelhub/ui/core/cast_list.dart';
import 'package:reelhub/ui/core/company_list.dart';
import 'package:reelhub/ui/core/custom_app_bar.dart';
import 'package:reelhub/ui/core/media_details_hero.dart';
import 'package:reelhub/ui/core/media_details_overview.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/ui/core/trailer_list.dart';
import 'package:reelhub/data/blocs/similar_media/similar_media_bloc.dart';
import 'package:reelhub/ui/core/trailer_list_skeleton.dart';
import 'package:reelhub/ui/tv_show_details/blocs/tv_show_details/tv_show_details_bloc.dart';
import 'package:reelhub/utils/mock/mock_cast_list.dart';
import 'package:reelhub/utils/mock/mock_media_list.dart';
import 'package:reelhub/utils/mock/mock_production_company_list.dart';
import 'package:reelhub/utils/mock/mock_tv_show.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final int id;

  const TvShowDetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
            builder: (context, state) {
              switch (state.status) {
                case TvShowDetailsStatus.initial:
                case TvShowDetailsStatus.loading:
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
                            mediaDetails: MediaDetails.fromTvShow(mockTvShow),
                            seasonList: mockTvShow.seasons,
                          ),
                        ),
                      ],
                    ),
                  );
                case TvShowDetailsStatus.failure:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediaDetailsHero(backdropPath: null, posterPath: null),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: MediaDetailsOverview(
                          errorMessage: state.errorMessage,
                        ),
                      ),
                    ],
                  );
                case TvShowDetailsStatus.success:
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
                          mediaDetails: MediaDetails.fromTvShow(state.item),
                          seasonList: state.item?.seasons,
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
                    return TrailerList(errorMessage: state.errorMessage);
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
                    return CastList(casts: mockCasts);
                  case CastStatus.failure:
                    return CastList(errorMessage: state.errorMessage);
                  case CastStatus.success:
                    return CastList(casts: state.items);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
              builder: (context, state) {
                switch (state.status) {
                  case TvShowDetailsStatus.initial:
                  case TvShowDetailsStatus.loading:
                    return Skeletonizer(
                      enabled: true,
                      child: ProductionCompanyList(
                        productionCompanies: mockProductionCompanies,
                      ),
                    );
                  case TvShowDetailsStatus.failure:
                    return ProductionCompanyList(
                      errorMessage: state.errorMessage,
                    );
                  case TvShowDetailsStatus.success:
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
                    return Skeletonizer(
                      enabled: true,
                      child: MovieList(title: 'Similar', items: mockMediaList),
                    );
                  case SimilarMediaStatus.failure:
                    return MovieList(
                      title: 'Similar',
                      errorMessage: state.errorMessage,
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
