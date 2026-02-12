import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/data/repositories/now_playing/now_playing_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class NowPlayingRepositoryImpl implements NowPlayingRepository {
  final TmdbService _tmdb;

  NowPlayingRepositoryImpl(this._tmdb);

  @override
  Future<List<Movie>> getNowPlaying() {
    return _tmdb.getNowPlaying();
  }
}
