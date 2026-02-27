import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/browse/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/core/movie_list.dart';
import 'package:reelhub/ui/browse/blocs/popular_tv_shows/popular_tv_shows_bloc.dart';
import 'package:reelhub/utils/mock/mock_media_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLogoAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TopRatedMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            items: mockMediaList,
                            title: "Top Rated Movies",
                          ),
                        );
                      case TopRatedMoviesStatus.success:
                        return MovieList(
                          items: state.items,
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
                            items: mockMediaList,
                            title: "Top Rated TV Shows",
                            isMovie: false,
                          ),
                        );
                      case TopRatedTVShowsStatus.success:
                        return MovieList(
                          items: state.items,
                          title: "Top Rated TV Shows",
                          isMovie: false,
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
                      case PopularMoviesStatus.initial:
                      case PopularMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            items: mockMediaList,
                            title: "Popular Movies",
                          ),
                        );
                      case PopularMoviesStatus.failure:
                        return MovieList(
                          title: "Popular Movies",
                          errorMessage: state.errorMessage,
                        );
                      case PopularMoviesStatus.success:
                        return MovieList(
                          items: state.items,
                          title: "Popular Movies",
                        );
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<PopularTVShowsBloc, PopularTVShowsState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case PopularTVShowsStatus.initial:
                      case PopularTVShowsStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            items: mockMediaList,
                            title: "Popular TV Shows",
                            isMovie: false,
                          ),
                        );
                      case PopularTVShowsStatus.failure:
                        return MovieList(
                          title: "Popular TV Shows",
                          errorMessage: state.errorMessage,
                          isMovie: false,
                        );
                      case PopularTVShowsStatus.success:
                        return MovieList(
                          items: state.items,
                          title: "Popular TV Shows",
                          isMovie: false,
                        );
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
