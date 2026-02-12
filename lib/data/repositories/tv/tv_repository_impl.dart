import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class TvRepositoryImpl implements TvRepository {
  final TmdbService _tmdb;

  TvRepositoryImpl(this._tmdb);

  @override
  Future<List<Movie>> getPopular() {
    return _tmdb.getPopularTvShows();
  }

  @override
  Future<List<Movie>> getTopRated() {
    return _tmdb.getTopRatedTvShows();
  }
}
