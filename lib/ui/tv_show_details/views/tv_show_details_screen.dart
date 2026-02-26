import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/data/blocs/casts/casts_bloc.dart';
import 'package:reelhub/data/models/media_details/media_details_model.dart';
import 'package:reelhub/ui/core/cast_list.dart';
import 'package:reelhub/ui/core/media_details_hero.dart';
import 'package:reelhub/ui/core/media_details_overview.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/ui/core/trailer_list.dart';
import 'package:reelhub/data/blocs/similar_media/similar_media_bloc.dart';
import 'package:reelhub/ui/tv_show_details/blocs/tv_show_details/tv_show_details_bloc.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final int id;

  const TvShowDetailsScreen(this.id, {super.key});

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
          BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
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
                      MediaDetails.fromTvShow(state.item),
                      seasonList: state.item?.seasons,
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
            child: BlocBuilder<CastBloc, CastState>(
              builder: (context, state) {
                switch (state.status) {
                  case CastStatus.initial:
                  case CastStatus.loading:
                    return CastList(isLoading: true);
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
