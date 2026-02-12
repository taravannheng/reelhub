import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reelhub/config/di.dart';
import 'package:reelhub/routing/routes.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:reelhub/ui/browse/views/browse_screen.dart';
import 'package:reelhub/ui/core/scaffold_with_navbar.dart';
import 'package:reelhub/ui/home/blocs/now_playing/now_playing_bloc.dart';
import 'package:reelhub/ui/home/blocs/popular/popular_bloc.dart';
import 'package:reelhub/ui/home/blocs/trending_bloc/trending_bloc.dart';
import 'package:reelhub/ui/home/views/home_screen.dart';
import 'package:reelhub/ui/profile/views/profile_screen.dart';

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
                            getIt<PopularBloc>()..add(PopularFetched()),
                      ),
                    ],

                    child: const HomeScreen(),
                  ),
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
