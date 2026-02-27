import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/home/blocs/now_playing/now_playing_bloc.dart';
import 'package:reelhub/ui/home/blocs/trending/trending_bloc.dart';
import 'package:reelhub/ui/core/movie_list.dart';
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
                          child: MovieList(
                            title: "Trending",
                            items: mockMediaList,
                          ),
                        );
                      case TrendingStatus.failure:
                        return MovieList(
                          title: "Trending",
                          errorMessage: state.errorMessage,
                        );
                      case TrendingStatus.success:
                        return MovieList(title: "Trending", items: state.items);
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<NowPlayingBloc, NowPlayingState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case NowPlayingStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            title: "Playing in Theatre",
                            items: mockMediaList,
                          ),
                        );
                      case NowPlayingStatus.success:
                        return MovieList(
                          items: state.items,
                          title: "Playing in Theatre",
                        );
                      default:
                        return const Text("No data");
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case UpcomingMoviesStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            title: "Upcoming Movies",
                            items: mockMediaList,
                          ),
                        );
                      case UpcomingMoviesStatus.success:
                        return MovieList(
                          title: "Upcoming Movies",
                          items: state.items,
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
