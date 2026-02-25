import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reelhub/config/di.dart';
import 'package:reelhub/routing/routes.dart';
import 'package:reelhub/ui/browse/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:reelhub/ui/browse/views/browse_screen.dart';
import 'package:reelhub/ui/core/scaffold_with_navbar.dart';
import 'package:reelhub/ui/home/blocs/now_playing/now_playing_bloc.dart';
import 'package:reelhub/ui/browse/blocs/popular_tv_shows/popular_tv_shows_bloc.dart';
import 'package:reelhub/ui/home/blocs/trending/trending_bloc.dart';
import 'package:reelhub/ui/home/blocs/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:reelhub/ui/home/views/home_screen.dart';
import 'package:reelhub/data/blocs/casts/casts_bloc.dart';
import 'package:reelhub/ui/movie_details/blocs/movie_details/movie_details_bloc.dart';
import 'package:reelhub/data/blocs/similar_media/similar_media_bloc.dart';
import 'package:reelhub/data/blocs/trailers/trailers_bloc.dart';
import 'package:reelhub/ui/movie_details/views/movie_details_screen.dart';
import 'package:reelhub/ui/profile/views/profile_screen.dart';
import 'package:reelhub/ui/tv_show_details/blocs/tv_show_details/tv_show_details_bloc.dart';
import 'package:reelhub/ui/tv_show_details/views/tv_show_details_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter routerInstance = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homePath,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              name: Routes.home,
              path: Routes.homePath,
              builder: (BuildContext context, GoRouterState state) =>
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            getIt<TrendingBloc>()..add(TrendingFetched()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<NowPlayingBloc>()..add(NowPlayingFetched()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<UpcomingMoviesBloc>()
                              ..add(UpcomingMoviesFetched()),
                      ),
                    ],
                    child: const HomeScreen(),
                  ),
              routes: <RouteBase>[
                GoRoute(
                  name: Routes.movieDetails,
                  path: Routes.movieDetailsPath,
                  builder: (BuildContext context, GoRouterState state) {
                    final id = state.pathParameters['id'] ?? '';
                    final idAsInt = int.tryParse(id) ?? 0;

                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) =>
                              getIt<MovieDetailsBloc>()
                                ..add(MovieDetailsFetched(id)),
                        ),
                        BlocProvider(
                          create: (context) =>
                              getIt<TrailerBloc>()..add(TrailerFetched(id)),
                        ),
                        BlocProvider(
                          create: (context) =>
                              getIt<CastBloc>()..add(CastFetched(id)),
                        ),
                        BlocProvider(
                          create: (context) =>
                              getIt<SimilarMediaBloc>()
                                ..add(SimilarMediaFetched(idAsInt)),
                        ),
                      ],
                      child: MovieDetailsScreen(id),
                    );
                  },
                ),
                GoRoute(
                  name: Routes.tvShowDetails,
                  path: Routes.tvShowDetailsPath,
                  builder: (BuildContext context, GoRouterState state) {
                    final id = state.pathParameters['id'] ?? '';
                    final idAsInt = int.tryParse(id) ?? 0;

                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) =>
                              getIt<TvShowDetailsBloc>()
                                ..add(TvShowDetailsFetched(idAsInt)),
                        ),
                        BlocProvider(
                          create: (context) =>
                              getIt<TrailerBloc>()
                                ..add(TrailerFetched(id, isMovie: false)),
                        ),
                        BlocProvider(
                          create: (context) =>
                              getIt<CastBloc>()
                                ..add(CastFetched(id, isMovie: false)),
                        ),
                        BlocProvider(
                          create: (context) => getIt<SimilarMediaBloc>()
                            ..add(SimilarMediaFetched(idAsInt, isMovie: false)),
                        ),
                      ],
                      child: TvShowDetailsScreen(idAsInt),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              name: Routes.browse,
              path: Routes.browsePath,
              builder: (BuildContext context, GoRouterState state) =>
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            getIt<TopRatedMoviesBloc>()
                              ..add(TopRatedMoviesFetched()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<TopRatedTVShowsBloc>()
                              ..add(TopRatedTVShowsFetched()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<PopularMoviesBloc>()
                              ..add(PopularMoviesFetched()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            getIt<PopularTVShowsBloc>()
                              ..add(PopularTVShowsFetched()),
                      ),
                    ],

                    child: const BrowseScreen(),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              name: Routes.profile,
              path: Routes.profilePath,
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
