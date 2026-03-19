import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/home/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:reelhub/ui/home/blocs/popular_tv_shows/popular_tv_shows_bloc.dart';
import 'package:reelhub/ui/home/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:reelhub/ui/home/blocs/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/home/blocs/now_playing/now_playing_bloc.dart';
import 'package:reelhub/ui/home/blocs/trending/trending_bloc.dart';
import 'package:reelhub/ui/core/media_list.dart';
import 'package:reelhub/ui/home/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:reelhub/utils/mock/mock_media_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                BlocBuilder<TrendingBloc, TrendingState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TrendingStatus.initial:
                      case TrendingStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MediaList(
                            title: "Trending",
                            items: mockMediaList,
                          ),
                        );
                      case TrendingStatus.failure:
                        return MediaList(
                          title: "Trending",
                          errorMessage: state.errorMessage,
                        );
                      case TrendingStatus.success:
                        return MediaList(title: "Trending", items: state.items);
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<NowPlayingBloc, NowPlayingState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case NowPlayingStatus.initial:
                      case NowPlayingStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MediaList(
                            title: "Playing in Theatre",
                            items: mockMediaList,
                          ),
                        );
                      case NowPlayingStatus.failure:
                        return MediaList(
                          title: "Playing in Theatre",
                          errorMessage: state.errorMessage,
                        );
                      case NowPlayingStatus.success:
                        return MediaList(
                          items: state.items,
                          title: "Playing in Theatre",
                        );
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case UpcomingMoviesStatus.initial:
                      case UpcomingMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MediaList(
                            title: "Upcoming Movies",
                            items: mockMediaList,
                          ),
                        );
                      case UpcomingMoviesStatus.failure:
                        return MediaList(
                          title: "Upcoming Movies",
                          errorMessage: state.errorMessage,
                        );
                      case UpcomingMoviesStatus.success:
                        return MediaList(
                          title: "Upcoming Movies",
                          items: state.items,
                        );
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TopRatedMoviesStatus.initial:
                      case TopRatedMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MediaList(
                            items: mockMediaList,
                            title: "Top Rated Movies",
                          ),
                        );
                      case TopRatedMoviesStatus.failure:
                        return MediaList(
                          errorMessage: state.errorMessage,
                          title: "Top Rated Movies",
                        );
                      case TopRatedMoviesStatus.success:
                        return MediaList(
                          items: state.items,
                          title: "Top Rated Movies",
                        );
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<TopRatedTVShowsBloc, TopRatedTVShowsState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TopRatedTVShowsStatus.initial:
                      case TopRatedTVShowsStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MediaList(
                            items: mockMediaList,
                            title: "Top Rated TV Shows",
                            isMovie: false,
                          ),
                        );
                      case TopRatedTVShowsStatus.failure:
                        return MediaList(
                          title: "Top Rated TV Shows",
                          isMovie: false,
                          errorMessage: state.errorMessage,
                        );
                      case TopRatedTVShowsStatus.success:
                        return MediaList(
                          items: state.items,
                          title: "Top Rated TV Shows",
                          isMovie: false,
                        );
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
                          child: MediaList(
                            items: mockMediaList,
                            title: "Popular Movies",
                          ),
                        );
                      case PopularMoviesStatus.failure:
                        return MediaList(
                          title: "Popular Movies",
                          errorMessage: state.errorMessage,
                        );
                      case PopularMoviesStatus.success:
                        return MediaList(
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
                          child: MediaList(
                            items: mockMediaList,
                            title: "Popular TV Shows",
                            isMovie: false,
                          ),
                        );
                      case PopularTVShowsStatus.failure:
                        return MediaList(
                          title: "Popular TV Shows",
                          errorMessage: state.errorMessage,
                          isMovie: false,
                        );
                      case PopularTVShowsStatus.success:
                        return MediaList(
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
