import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:reelhub/data/services/tmdb_service.dart';
import 'package:tmdb_api/tmdb_api.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  sl.registerLazySingleton<TMDB>(
    () => TMDB(
      ApiKeys(dotenv.env["TMDB_API_KEY"] ?? '', 'apiReadAccessTokenv4'),
      logConfig: ConfigLogger.recommended(),
    ),
  );

  sl.registerLazySingleton<TmdbService>(
    () => TmdbService(sl<TMDB>()),
  );
}
