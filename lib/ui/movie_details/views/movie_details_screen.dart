import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/ui/movie_details/blocs/casts/casts_bloc.dart';
import 'package:reelhub/ui/movie_details/blocs/movie_details/movie_details_bloc.dart';
import 'package:reelhub/ui/movie_details/blocs/similar_movies/similar_movies_bloc.dart';
import 'package:reelhub/ui/movie_details/blocs/trailers/trailers_bloc.dart';
import 'package:reelhub/ui/movie_details/views/cast_list.dart';
import 'package:reelhub/ui/movie_details/views/movie_details_hero.dart';
import 'package:reelhub/ui/movie_details/views/movie_details_overview.dart';
import 'package:reelhub/ui/movie_details/views/trailer_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailsScreen(this.movieId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Builder(
        builder: (context) {
          final MovieDetailsState movieDetailsState = context
              .watch<MovieDetailsBloc>()
              .state;
          final TrailerState trailerState = context.watch<TrailerBloc>().state;
          final CastState castState = context.watch<CastBloc>().state;
          final SimilarMovieState similarMovieState = context
              .watch<SimilarMovieBloc>()
              .state;

          switch (movieDetailsState.status) {
            case MovieDetailsStatus.loading:
              return Center(child: const CircularProgressIndicator.adaptive());
            case MovieDetailsStatus.success:
              return ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                children: [
                  MovieDetailsHero(
                    backdropPath: movieDetailsState.item?.backdropPath,
                    posterPath: movieDetailsState.item?.posterPath,
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MovieDetailsOverview(movieDetailsState.item),
                  ),
                  const SizedBox(height: 24),
                  if (trailerState.items != null &&
                      trailerState.items!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TrailerList(trailerState.items!),
                    ),
                  const SizedBox(height: 24),
                  if (castState.items != null && castState.items!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CastList(castState.items!),
                    ),
                  const SizedBox(height: 24),
                  if (similarMovieState.items != null &&
                      similarMovieState.items!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MovieList(
                        similarMovieState.items,
                        title: 'Similar',
                      ),
                    ),
                  const SizedBox(height: 24),
                ],
              );
            default:
              return Text('No data...');
          }
        },
      ),
    );
  }
}
