import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';
import 'package:reelhub/data/repositories/movie/movie_repository_impl.dart';
import 'package:reelhub/data/repositories/trending/trending_repository.dart';
import 'package:reelhub/data/repositories/trending/trending_repository_impl.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';
import 'package:reelhub/data/repositories/tv/tv_repository_impl.dart';
import 'package:reelhub/data/services/tmdb_service.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:reelhub/ui/browse/blocs/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:reelhub/ui/home/blocs/now_playing/now_playing_bloc.dart';
import 'package:reelhub/ui/home/blocs/popular/popular_bloc.dart';
import 'package:reelhub/ui/home/blocs/trending_bloc/trending_bloc.dart';
import 'package:tmdb_api/tmdb_api.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt.registerLazySingleton<TMDB>(
    () => TMDB(
      ApiKeys(dotenv.env["TMDB_API_KEY"] ?? '', 'apiReadAccessTokenv4'),
      logConfig: ConfigLogger.recommended(),
    ),
  );

  getIt.registerLazySingleton<TmdbService>(() => TmdbService(getIt<TMDB>()));

  getIt.registerLazySingleton<TrendingRepository>(
    () => TrendingRepositoryImpl(getIt<TmdbService>()),
  );

  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getIt<TmdbService>()),
  );

  getIt.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(getIt<TmdbService>()),
  );

  getIt.registerLazySingleton<NowPlayingBloc>(
    () => NowPlayingBloc(getIt<MovieRepository>()),
  );

  getIt.registerLazySingleton<TrendingBloc>(
    () => TrendingBloc(getIt<TrendingRepository>()),
  );

  getIt.registerLazySingleton<PopularBloc>(
    () => PopularBloc(getIt<TvRepository>()),
  );

  getIt.registerLazySingleton<TopRatedMoviesBloc>(
    () => TopRatedMoviesBloc(getIt<MovieRepository>()),
  );

  getIt.registerLazySingleton<TopRatedTVShowsBloc>(
    () => TopRatedTVShowsBloc(getIt<TvRepository>()),
  );
}
