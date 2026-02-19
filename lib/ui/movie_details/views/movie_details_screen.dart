import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/movie_details/blocs/movie_details/movie_details_bloc.dart';
import 'package:reelhub/ui/movie_details/views/movie_details_hero.dart';
import 'package:reelhub/ui/movie_details/views/movie_details_overview.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailsScreen(this.movieId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case MovieDetailsStatus.loading:
              return Center(child: const CircularProgressIndicator.adaptive());
            case MovieDetailsStatus.success:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsHero(
                    backdropPath: state.item?.backdropPath,
                    posterPath: state.item?.posterPath,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    child: MovieDetailsOverview(state.item!),
                  ),
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
