import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelhub/ui/core/custom_logo_app_bar.dart';
import 'package:reelhub/ui/home/blocs/now_playing/now_playing_bloc.dart';
import 'package:reelhub/ui/home/blocs/popular/popular_bloc.dart';
import 'package:reelhub/ui/home/blocs/trending_bloc/trending_bloc.dart';
import 'package:reelhub/ui/home/views/movie_list.dart';
import 'package:reelhub/utils/mock/mock_trending_items.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                BlocBuilder<TrendingBloc, TrendingState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case TrendingStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(mockMovieList, title: "Trending"),
                        );
                      case TrendingStatus.success:
                        return MovieList(state.items, title: "Trending");
                      default:
                        return const Text("No data");
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
                            mockMovieList,
                            title: "Playing in Theatre",
                          ),
                        );
                      case NowPlayingStatus.success:
                        return MovieList(
                          state.items,
                          title: "Playing in Theatre",
                        );
                      default:
                        return const Text("No data");
                    }
                  },
                ),
                SizedBox(height: 24),
                BlocBuilder<PopularBloc, PopularState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case PopularStatus.loading:
                        return Skeletonizer(
                          enabled: true,
                          child: MovieList(
                            mockMovieList,
                            title: "Popular TV Shows",
                          ),
                        );
                      case PopularStatus.success:
                        return MovieList(
                          state.items,
                          title: "Popular TV Shows",
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
