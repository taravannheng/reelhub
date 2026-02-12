import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/browse/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/utils/mock/mock_trending_items.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLogoAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TopRatedMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            mockMovieList,
                            title: "Top Rated Movies",
                          ),
                        );
                      case TopRatedMoviesStatus.success:
                        return MovieList(
                          state.items,
                          title: "Top Rated Movies",
                        );
                      default:
                        return const Text("No data");
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<TopRatedTVShowsBloc, TopRatedTVShowsState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TopRatedTVShowsStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            mockMovieList,
                            title: "Top Rated TV Shows",
                          ),
                        );
                      case TopRatedTVShowsStatus.success:
                        return MovieList(
                          state.items,
                          title: "Top Rated TV Shows",
                        );
                      default:
                        return const Text("No data");
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case PopularMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            mockMovieList,
                            title: "More Movies",
                          ),
                        );
                      case PopularMoviesStatus.success:
                        return MovieList(
                          state.items,
                          title: "More Movies",
                        );
                      default:
                        return const Text("No data");
                    }
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
